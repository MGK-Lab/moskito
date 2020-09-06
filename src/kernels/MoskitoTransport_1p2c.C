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

#include "MoskitoTransport_1p2c.h"

registerMooseObject("MoskitoApp", MoskitoTransport_1p2c);

template <>
InputParameters
validParams<MoskitoTransport_1p2c>()
{
  InputParameters params = validParams<Kernel>();

  params.addRequiredCoupledVar("flowrate", "Volumetric flowrate nonlinear variable");
  params.addRequiredCoupledVar("temperature", "Temperature nonlinear variable");
  params.addRequiredCoupledVar("pressure", "Temperature nonlinear variable");
  params.addClassDescription("transport equation for pipe flow and "
        "it returns salt concentration");

  return params;
}

MoskitoTransport_1p2c::MoskitoTransport_1p2c(const InputParameters & parameters)
  : Kernel(parameters),
  _q(coupledValue("flowrate")),
  _grad_q(coupledGradient("flowrate")),
  _grad_T(coupledGradient("temperature")),
  _grad_p(coupledGradient("pressure")),
  _q_var_number(coupled("flowrate")),
  _T_var_number(coupled("temperature")),
  _p_var_number(coupled("pressure")),
  _area(getMaterialProperty<Real>("well_area")),
  _well_dir(getMaterialProperty<RealVectorValue>("well_direction_vector")),
  _well_sign(getMaterialProperty<Real>("flow_direction_sign")),
  _rho(getMaterialProperty<Real>("density")),
  _drho_dp(getMaterialProperty<Real>("drho_dp")),
  _drho_dT(getMaterialProperty<Real>("drho_dT")),
  _drho_dm(getMaterialProperty<Real>("drho_dm"))
{
}

Real
MoskitoTransport_1p2c::computeQpResidual()
{
  RealVectorValue r = 0.0;

  r += _drho_dp[_qp] * _grad_p[_qp];
  r += _drho_dT[_qp] * _grad_T[_qp];
  r += _drho_dm[_qp] * _grad_u[_qp];
  r *= _q[_qp];
  r += _rho[_qp] * _grad_q[_qp];
  r *= _u[_qp];
  r += _rho[_qp] * _q[_qp] * _grad_u[_qp];
  r *= _test[_i][_qp] * _well_sign[_qp] / _area[_qp];

  return r * _well_dir[_qp];
}

Real
MoskitoTransport_1p2c::computeQpJacobian()
{
  RealVectorValue j = 0.0;
  RealVectorValue h = 0.0;
  RealVectorValue s = 0.0;

  j += _drho_dp[_qp] * _grad_p[_qp];
  j += _drho_dT[_qp] * _grad_T[_qp];
  j += _drho_dm[_qp] * _grad_u[_qp];
  j *= _phi[_j][_qp];
  j += _drho_dm[_qp] * _grad_phi[_j][_qp] * _u[_qp];
  j *= _q[_qp];

  h += _drho_dm[_qp] * _grad_q[_qp] * _u[_qp];
  h += _rho[_qp] * _grad_q[_qp];
  h *= _phi[_j][_qp];

  s += _drho_dm[_qp] * _phi[_j][_qp] * _grad_u[_qp];
  s += _rho[_qp] * _grad_phi[_j][_qp];
  s *= _q[_qp];

  j += h + s;
  j *= _test[_i][_qp] * _well_sign[_qp] / _area[_qp];

  return j * _well_dir[_qp];
}

Real
MoskitoTransport_1p2c::computeQpOffDiagJacobian(unsigned int jvar)
{
  RealVectorValue j = 0.0;
  if (jvar == _q_var_number)
  {
    j += _drho_dp[_qp] * _grad_p[_qp];
    j += _drho_dT[_qp] * _grad_T[_qp];
    j += _drho_dm[_qp] * _grad_u[_qp];
    j *= _phi[_j][_qp] * _u[_qp];

    j += _rho[_qp] * _grad_phi[_j][_qp] * _u[_qp];

    j += _rho[_qp] * _phi[_j][_qp] * _grad_u[_qp];

    j *= _test[_i][_qp] * _well_sign[_qp] / _area[_qp];
  }

  if (jvar == _T_var_number)
  {
    j += _drho_dT[_qp] * _grad_phi[_j][_qp] * _q[_qp];

    j += _drho_dT[_qp] * _phi[_j][_qp] * _grad_q[_qp];
    j *= _u[_qp];

    j += _drho_dT[_qp] * _phi[_j][_qp] * _q[_qp] * _grad_u[_qp];

    j *= _test[_i][_qp] * _well_sign[_qp] / _area[_qp];
  }

  if (jvar == _p_var_number)
  {
    j += _drho_dp[_qp] * _grad_phi[_j][_qp] * _q[_qp];

    j += _drho_dp[_qp] * _phi[_j][_qp] * _grad_q[_qp];
    j *= _u[_qp];

    j += _drho_dp[_qp] * _phi[_j][_qp] * _q[_qp] * _grad_u[_qp];

    j *= _test[_i][_qp] * _well_sign[_qp] / _area[_qp];
  }

  return j * _well_dir[_qp];
}
