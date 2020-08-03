/**************************************************************************/
/*  MOSKITO - Multiphysics cOupled Simulator toolKIT for wellbOres        */
/*                                                                        */
/*  Copyright (C) 2017 by Maziar Gholami Korzani                          */
/*  Karlsruhe Institute of Technology, Institute of Applied Geosciences   */
/*  Division of Geothermal Research                                       */
/*                                                                        */
/*  This file is part of MOSKITO App                                      */
/*                                                                        */
/*  This program is free software: you can redistribute it and/or modify  */
/*  it under the terms of the GNU General Public License as published by  */
/*  the Free Software Foundation, either version 3 of the License, or     */
/*  (at your option) any later version.                                   */
/*                                                                        */
/*  This program is distributed in the hope that it will be useful,       */
/*  but WITHOUT ANY WARRANTY; without even the implied warranty of        */
/*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the          */
/*  GNU General Public License for more details.                          */
/*                                                                        */
/*  You should have received a copy of the GNU General Public License     */
/*  along with this program.  If not, see <http://www.gnu.org/licenses/>  */
/**************************************************************************/

#include "MoskitoCoaxialHeat_1p.h"

registerMooseObject("MoskitoApp", MoskitoCoaxialHeat_1p);

template <>
InputParameters
validParams<MoskitoCoaxialHeat_1p>()
{
    InputParameters params = validParams<Material>();

    params.addClassDescription("Materials for the Lateral heat transfer between "
          "inner and outer pipes");
    params.addRequiredCoupledVar("temperature_inner_pipe", "Temperature of fluid inside inner pipe (K)");
    params.addRequiredCoupledVar("flowrate_inner_pipe", "Mixture flow rate inside inner pipe (m^3/s)");
    params.addRequiredCoupledVar("pressure_inner_pipe", "Pressure inside inner pipe (Pa)");
    params.addRequiredCoupledVar("temperature_annulus", "Temperature of fluid inside annulus (K)");
    params.addRequiredCoupledVar("flowrate_annulus", "Mixture flow rate inside annulus (m^3/s)");
    params.addRequiredCoupledVar("pressure_annulus", "Pressure inside annulus (Pa)");
    params.addRequiredParam<Real>("inner_pipe_outer_radius",
          "outer radius of the inner pipe (m)");
    params.addRequiredParam<Real>("inner_pipe_inner_radius",
          "inner radius of the inner pipe (m)");
    params.addRequiredParam<Real>("annulus_outer_radius",
          "outer radius of the annulus (m)");
    params.addRequiredParam<Real>("conductivity_inner_pipe",
          "Thermal conductivity of the inner pipe (W/(m*K))");
    params.addRequiredParam<UserObjectName>("eos_uo",
          "The name of the userobject for EOS");
    params.addRequiredParam<UserObjectName>("viscosity_uo",
          "The name of the userobject for viscosity Eq");

    return params;
}

MoskitoCoaxialHeat_1p::MoskitoCoaxialHeat_1p(const InputParameters & parameters)
  : Material(parameters),
    eos_uo(getUserObject<MoskitoEOS1P>("eos_uo")),
    viscosity_uo(getUserObject<MoskitoViscosity1P>("viscosity_uo")),
    _ohc(declareProperty<Real>("overall_heat_transfer_coeff")),
    _rdo(getParam<Real>("inner_pipe_outer_radius")),
    _rdi(getParam<Real>("inner_pipe_inner_radius")),
    _rwo(getParam<Real>("annulus_outer_radius")),
    _kd(getParam<Real>("conductivity_inner_pipe")),
    _T_i(coupledValue("temperature_inner_pipe")),
    _flow_i(coupledValue("flowrate_inner_pipe")),
    _p_i(coupledValue("pressure_inner_pipe")),
    _T_a(coupledValue("temperature_annulus")),
    _flow_a(coupledValue("flowrate_annulus")),
    _p_a(coupledValue("pressure_annulus")),
    _nusselt_i(declareProperty<Real>("Nusselt_number_inner_pipe")),
    _nusselt_a(declareProperty<Real>("Nusselt_number_annulus"))
{
}

void
MoskitoCoaxialHeat_1p::computeQpProperties()
{
  Real j = 0.0 ;
  j += 1.0 / _rdo / Conv_coeff_annulus();
  j += log(_rdo /_rdi )/_kd;
  j += 1.0 / _rdi / Conv_coeff_inner();
  _ohc[_qp] = 1.0 / j ;
}

Real
MoskitoCoaxialHeat_1p::Conv_coeff_inner()
{
  Real pr_i, gama_i, area_i, u_i, rho_i, vis_i, cp_i, lambda_i, Re_i;

  area_i = PI * _rdi * _rdi;
  u_i = _flow_i[_qp] / area_i;
  rho_i = eos_uo.rho_from_p_T(_p_i[_qp], _T_i[_qp]);
  vis_i = viscosity_uo.mu(_p_i[_qp], _T_i[_qp]);
  cp_i = eos_uo.cp(_p_i[_qp], _T_i[_qp]);
  lambda_i = eos_uo.lambda(_p_i[_qp], _T_i[_qp]);
  Re_i = rho_i * 2.0 * _rdi * fabs(u_i) / vis_i;

  if (Re_i>0.0)
  {
     pr_i = vis_i * cp_i / lambda_i;
     if (Re_i<2300.0)
     {
         _nusselt_i[_qp]  = 4.364 ;
     }
     if (2300.0<Re_i<10000.0)
     {
         gama_i = (Re_i - 2300.0)/(10000.0 - 2300.0);
         _nusselt_i[_qp] = (1.0 - gama_i) * 4.364 + gama_i * 0.023 * pow(Re_i, 0.8) * pow(pr_i, 0.3);
     }
     if (10000.0<Re_i)
     {
         _nusselt_i[_qp] = 0.023 * pow(Re_i, 0.8) * pow(pr_i, 0.3);
     }
  }

  return _nusselt_i[_qp] * lambda_i / 2.0 / _rdi;
}

Real
MoskitoCoaxialHeat_1p::Conv_coeff_annulus()
{
  Real pr_a, gama_a, area_a, u_a, rho_a, vis_a, cp_a, lambda_a, Re_a ,hd;

  area_a = PI * (_rwo * _rwo - _rdi * _rdi);
  u_a = _flow_a[_qp] / area_a;
  rho_a = eos_uo.rho_from_p_T(_p_a[_qp], _T_a[_qp]);
  vis_a = viscosity_uo.mu(_p_a[_qp], _T_a[_qp]);
  cp_a = eos_uo.cp(_p_a[_qp], _T_a[_qp]);
  lambda_a = eos_uo.lambda(_p_a[_qp], _T_a[_qp]);
  hd = 4.0 * area_a / (2.0 * PI * (_rwo + _rdi));
  Re_a = rho_a * hd * fabs(u_a) / vis_a;

  if (Re_a>0.0)
  {
     pr_a = vis_a * cp_a / lambda_a;
     if (Re_a<2300.0)
     {
         _nusselt_a[_qp]  = 4.364 ;
     }
     if (2300.0<Re_a<10000.0)
     {
         gama_a = (Re_a - 2300.0)/(10000.0 - 2300.0);
         _nusselt_a[_qp] = (1.0 - gama_a) * 4.364 + gama_a * 0.023 * pow(Re_a, 0.8) * pow(pr_a, 0.3);
     }
     if (10000.0<Re_a)
     {
         _nusselt_a[_qp] = 0.023 * pow(Re_a, 0.8) * pow(pr_a, 0.3);
     }
  }

  return _nusselt_a[_qp] * lambda_a / hd;
}
