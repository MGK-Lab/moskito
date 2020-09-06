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

#include "MoskitoTimeTransport_1p2c.h"

registerMooseObject("MoskitoApp", MoskitoTimeTransport_1p2c);

template <>
InputParameters
validParams<MoskitoTimeTransport_1p2c>()
{
  InputParameters params = validParams<TimeKernel>();

  params.addRequiredCoupledVar("temperature", "Temperature nonlinear variable");
  params.addRequiredCoupledVar("pressure", "Temperature nonlinear variable");
  params.addClassDescription("Time derivative part of transport equation for "
                  "1 phase pipe flow and it returns salt concentration");

  return params;
}

MoskitoTimeTransport_1p2c::MoskitoTimeTransport_1p2c(const InputParameters & parameters)
  : TimeKernel(parameters),
    _T_dot(coupledDot("temperature")),
    _dT_dot(coupledDotDu("temperature")),
    _p_dot(coupledDot("pressure")),
    _dp_dot(coupledDotDu("pressure")),
    _T_var_number(coupled("temperature")),
    _p_var_number(coupled("pressure")),
    _rho(getMaterialProperty<Real>("density")),
    _drho_dp(getMaterialProperty<Real>("drho_dp")),
    _drho_dT(getMaterialProperty<Real>("drho_dT")),
    _drho_dm(getMaterialProperty<Real>("drho_dm"))
{
}

Real
MoskitoTimeTransport_1p2c::computeQpResidual()
{
  Real r = 0.0;

  r += _drho_dp[_qp] * _p_dot[_qp];
  r += _drho_dT[_qp] * _T_dot[_qp];
  r += _drho_dm[_qp] * _u_dot[_qp];
  r *= _u[_qp];
  r += _rho[_qp] * _u_dot[_qp];
  r *= _test[_i][_qp];

  return r;
}

Real
MoskitoTimeTransport_1p2c::computeQpJacobian()
{
  Real j = 0.0;

  j += _drho_dp[_qp] * _p_dot[_qp];
  j += _drho_dT[_qp] * _T_dot[_qp];
  j += _drho_dm[_qp] * _u_dot[_qp];
  j *= _phi[_j][_qp];
  j += _drho_dm[_qp] * _phi[_j][_qp] * _du_dot_du[_qp] * _u[_qp];
  j += _drho_dm[_qp] * _phi[_j][_qp] * _u_dot[_qp];
  j += _rho[_qp] * _phi[_j][_qp] * _du_dot_du[_qp];
  j *= _test[_i][_qp];

  return j;
}

Real
MoskitoTimeTransport_1p2c::computeQpOffDiagJacobian(unsigned int jvar)
{
  Real j = 0.0;

  if (jvar == _T_var_number)
  {
    j += _drho_dT[_qp] * _phi[_j][_qp] * _dT_dot[_qp] * _u[_qp];
    j += _drho_dT[_qp] * _phi[_j][_qp] * _u_dot[_qp];
    j *= _test[_i][_qp];
  }

  if (jvar == _p_var_number)
  {
    j += _drho_dp[_qp] * _phi[_j][_qp] * _dp_dot[_qp] * _u[_qp];
    j += _drho_dp[_qp] * _phi[_j][_qp] * _u_dot[_qp];
    j *= _test[_i][_qp];
  }

  return j;
}
