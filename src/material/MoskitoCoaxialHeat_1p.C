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
    params.addRequiredCoupledVar("hi", "convective heat transfer coefficient of inner fluid");
    params.addRequiredCoupledVar("ho", "convective heat transfer coefficient of outer fluid");
    params.addRequiredParam<Real>("inner_pipe_outer_radius",
          "outer radius of the inner pipe (m)");
    params.addRequiredParam<Real>("inner_pipe_inner_radius",
          "inner radius of the inner pipe (m)");
    params.addRequiredParam<Real>("conductivity_inner_pipe",
          "Thermal conductivity of the inner pipe (W/(m*K))");

    return params;
}

MoskitoCoaxialHeat_1p::MoskitoCoaxialHeat_1p(const InputParameters & parameters)
  : Material(parameters),
    _hi(coupledValue("hi")),
    _ho(coupledValue("ho")),
    _rdo(declareProperty<Real>("inner_pipe_outer_radius")),
    _rdi(declareProperty<Real>("inner_pipe_inner_radius")),
    _kd(declareProperty<Real>("conductivity_inner_pipe")),
    _ohc(declareProperty<Real>("overall_heat_transfer_coeff")),
    _rdoo(getParam<Real>("inner_pipe_outer_radius")),
    _rdii(getParam<Real>("inner_pipe_inner_radius")),
    _kdd(getParam<Real>("conductivity_inner_pipe"))
{
}

void
MoskitoCoaxialHeat_1p::computeQpProperties()
{
  _rdo[_qp] = _rdoo;
  _rdi[_qp] = _rdii;
  _kd[_qp] = _kdd;
  Real j = 0.0 ;
  j += 1.0/_rdo[_qp]/_ho[_qp] ;
  j += log(_rdo[_qp]/_rdi[_qp])/_kd[_qp] ;
  j += 1.0/_rdi[_qp]/_hi[_qp] ;
  _ohc[_qp] = 1.0 / j ;
}
