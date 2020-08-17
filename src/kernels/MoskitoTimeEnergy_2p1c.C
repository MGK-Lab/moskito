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

#include "MoskitoTimeEnergy_2p1c.h"

registerMooseObject("MoskitoApp", MoskitoTimeEnergy_2p1c);

template <>
InputParameters
validParams<MoskitoTimeEnergy_2p1c>()
{
  InputParameters params = validParams<TimeKernel>();

  params.addRequiredCoupledVar("pressure", "Pressure nonlinear variable");
  params.addRequiredCoupledVar("massrate", "Massrate nonlinear variable");
  params.addClassDescription("Time derivative part of energy conservation equation for "
                  "2 phase pipe flow and it returns enthalpy");

  return params;
}

MoskitoTimeEnergy_2p1c::MoskitoTimeEnergy_2p1c(const InputParameters & parameters)
  : TimeKernel(parameters),
    _m(coupledValue("massrate")),
    _p_dot(coupledDot("pressure")),
    _m_dot(coupledDot("massrate")),
    _dp_dot(coupledDotDu("pressure")),
    _dm_dot(coupledDotDu("massrate")),
    _p_var_number(coupled("pressure")),
    _m_var_number(coupled("massrate")),
    _area(getMaterialProperty<Real>("well_area")),
    _rho(getMaterialProperty<Real>("density")),
    _drho_dp(getMaterialProperty<Real>("drho_dp")),
    _drho_dh(getMaterialProperty<Real>("drho_dh")),
    _drho_dp2(getMaterialProperty<Real>("drho_dp2")),
    _drho_dh2(getMaterialProperty<Real>("drho_dh2")),
    _drho_dph(getMaterialProperty<Real>("drho_dph")),
    _dgamma_dp(getMaterialProperty<Real>("dgamma_dp")),
    _dgamma_dh(getMaterialProperty<Real>("dgamma_dh")),
    _dgamma_dm(getMaterialProperty<Real>("dgamma_dm"))
{
}

Real
MoskitoTimeEnergy_2p1c::computeQpResidual()
{
  Real r = 0.0;

  r += (_drho_dp[_qp] * _p_dot[_qp] + _drho_dh[_qp] * _u_dot[_qp]) * (_u[_qp]
        - std::pow(_m[_qp] / _area[_qp] / _rho[_qp], 2.0) / 2.0);
  r += _rho[_qp] * _u_dot[_qp];
  r += _m[_qp] * _m_dot[_qp] / (_area[_qp] * _area[_qp] * _rho[_qp]);
  r -= _p_dot[_qp];
  r += _dgamma_dh[_qp] * _u_dot[_qp] + _dgamma_dp[_qp] * _p_dot[_qp]
        + _dgamma_dm[_qp] * _m_dot[_qp];

  return r * _test[_i][_qp];
}

Real
MoskitoTimeEnergy_2p1c::computeQpJacobian()
{
  Real j = 0.0;

  j += (_drho_dph[_qp] * _p_dot[_qp] + _drho_dh2[_qp] * _u_dot[_qp]
        + _drho_dh[_qp] * _du_dot_du[_qp]) * (_u[_qp] - std::pow(_m[_qp]
        / _area[_qp] / _rho[_qp], 2.0) / 2.0);
  j += (_drho_dp[_qp] * _p_dot[_qp] + _drho_dh[_qp] * _u_dot[_qp]) * ( 1.0
        + _drho_dh[_qp] / _rho[_qp] * std::pow(_m[_qp] / _area[_qp] / _rho[_qp], 2.0));
  j += _drho_dh[_qp] * _u_dot[_qp] + _rho[_qp] * _du_dot_du[_qp];
  j -= _drho_dh[_qp] * _m[_qp] * _m_dot[_qp] / (_area[_qp] * _area[_qp] * _rho[_qp] * _rho[_qp]);
  j += _dgamma_dh[_qp] * _du_dot_du[_qp];

  return j * _test[_i][_qp] * _phi[_j][_qp];
}

Real
MoskitoTimeEnergy_2p1c::computeQpOffDiagJacobian(unsigned int jvar)
{
  Real j = 0.0;

  if (jvar == _m_var_number)
  {
    j -= (_drho_dp[_qp] * _p_dot[_qp] + _drho_dh[_qp] * _u_dot[_qp])
          * _m_dot[_qp] * _m[_qp] * std::pow(1.0 / _area[_qp] / _rho[_qp], 2.0);
    j += (_m_dot[_qp] * _m_dot[_qp] + _m[_qp] * _dm_dot[_qp]) / (_area[_qp] * _area[_qp] * _rho[_qp]);
    j += _dgamma_dm[_qp] * _dm_dot[_qp];
  }

  if (jvar == _p_var_number)
  {
    j += (_drho_dp2[_qp] * _p_dot[_qp] + _drho_dph[_qp] * _u_dot[_qp]
          + _drho_dp[_qp] * _dp_dot[_qp]) * (_u[_qp] - std::pow(_m[_qp]
          / _area[_qp] / _rho[_qp], 2.0) / 2.0);
    j += (_drho_dp[_qp] * _p_dot[_qp] + _drho_dh[_qp] * _u_dot[_qp])
          * _drho_dp[_qp] / _rho[_qp] * std::pow(_m[_qp] / _area[_qp] / _rho[_qp], 2.0);
    j += _drho_dp[_qp] * _u_dot[_qp];
    j -= _drho_dp[_qp] * _m[_qp] * _m_dot[_qp] / (_area[_qp] * _area[_qp] * _rho[_qp] * _rho[_qp]);
    j -= _dp_dot[_qp];
    j += _dgamma_dp[_qp] * _dp_dot[_qp];
  }

  return j * _test[_i][_qp] * _phi[_j][_qp];
}
