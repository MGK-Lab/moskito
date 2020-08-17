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

#include "MoskitoFluidWell_2p1c.h"

registerMooseObject("MoskitoApp", MoskitoFluidWell_2p1c);

template <>
InputParameters
validParams<MoskitoFluidWell_2p1c>()
{
  InputParameters params = validParams<MoskitoFluidWellGeneral>();
  params.addRequiredCoupledVar("enthalpy", "Specific enthalpy nonlinear variable (J/kg)");
  params.addRequiredParam<UserObjectName>("eos_uo",
        "The name of the userobject for 2 phase EOS");
  params.addRequiredParam<UserObjectName>("viscosity_uo",
        "The name of the userobject for 2 phase viscosity Eq");
  params.addRequiredParam<UserObjectName>("drift_flux_uo",
        "The name of the userobject for drift flux model");
  params.addRequiredCoupledVar("massrate", "Massrate nonlinear variable (m^3/s)");
  return params;
}

MoskitoFluidWell_2p1c::MoskitoFluidWell_2p1c(const InputParameters & parameters)
  : MoskitoFluidWellGeneral(parameters),
    eos_uo(getUserObject<MoskitoEOS2P>("eos_uo")),
    viscosity_uo(getUserObject<MoskitoViscosity2P>("viscosity_uo")),
    dfm_uo(getUserObject<MoskitoDriftFlux>("drift_flux_uo")),
    _T(declareProperty<Real>("temperature")),
    _cp_m(declareProperty<Real>("specific_heat")),
    _rho_g(declareProperty<Real>("gas_density")),
    _rho_l(declareProperty<Real>("liquid_density")),
    _rho_m(declareProperty<Real>("density")),
    _rho_pam(declareProperty<Real>("profile_mixture_density")),
    _drho_m_dp(declareProperty<Real>("drho_dp")),
    _drho_m_dp2(declareProperty<Real>("drho_dp2")),
    _drho_m_dh(declareProperty<Real>("drho_dh")),
    _drho_m_dh2(declareProperty<Real>("drho_dh2")),
    _drho_m_dph(declareProperty<Real>("drho_dph")),
    _vmfrac(declareProperty<Real>("mass_fraction")),
    _u_g(declareProperty<Real>("gas_velocity")),
    _u_l(declareProperty<Real>("liquid_velocity")),
    _vfrac(declareProperty<Real>("void_fraction")),
    _phase(declareProperty<Real>("current_phase")),
    _u_d(declareProperty<Real>("drift_velocity")),
    _c0(declareProperty<Real>("flow_type_c0")),
    _flow_pat(declareProperty<Real>("flow_pattern")),
    _dgamma_dp(declareProperty<Real>("dgamma_dp")),
    _dgamma_dh(declareProperty<Real>("dgamma_dh")),
    _dgamma_dm(declareProperty<Real>("dgamma_dm")),
    _dkappa_dp(declareProperty<Real>("dkappa_dp")),
    _dkappa_dh(declareProperty<Real>("dkappa_dh")),
    _dkappa_dm(declareProperty<Real>("dkappa_dm")),
    _dkappa_dph(declareProperty<Real>("dkappa_dph")),
    _dkappa_dpm(declareProperty<Real>("dkappa_dpm")),
    _dkappa_dhm(declareProperty<Real>("dkappa_dhm")),
    _dkappa_dp2(declareProperty<Real>("dkappa_dp2")),
    _dkappa_dh2(declareProperty<Real>("dkappa_dh2")),
    _dkappa_dm2(declareProperty<Real>("dkappa_dm2")),
    _domega_dp(declareProperty<Real>("domega_dp")),
    _domega_dh(declareProperty<Real>("domega_dh")),
    _domega_dm(declareProperty<Real>("domega_dm")),
    _h(coupledValue("enthalpy")),
    _m(coupledValue("massrate")),
    _grad_m(coupledGradient("massrate")),
    _grad_h(coupledGradient("enthalpy")),
    _grad_p(coupledGradient("pressure"))
{
}

void
MoskitoFluidWell_2p1c::computeQpProperties()
{
  MoskitoFluidWellGeneral::computeQpProperties();

  // To calculate required properties based on the given EOS
  eos_uo.VMFrac_T_from_p_h(_P[_qp], _h[_qp], _vmfrac[_qp], _T[_qp], _phase[_qp]);
  eos_uo.rho_m_by_p(_P[_qp], _h[_qp], _rho_m[_qp], _drho_m_dp[_qp], _drho_m_dp2[_qp]);
  eos_uo.rho_m_by_h(_P[_qp], _h[_qp], _rho_m[_qp], _drho_m_dh[_qp], _drho_m_dh2[_qp]);
  eos_uo.rho_m_by_ph(_P[_qp], _h[_qp], _drho_m_dph[_qp]);
  _rho_l[_qp] = eos_uo.rho_l_from_p_T(_P[_qp], _T[_qp], _phase[_qp]);
  _rho_g[_qp] = eos_uo.rho_g_from_p_T(_P[_qp], _T[_qp], _phase[_qp]);
  _vfrac[_qp]  = (_rho_m[_qp] - _rho_l[_qp]) / (_rho_g[_qp] - _rho_l[_qp]);
  _cp_m[_qp]  = eos_uo.cp_m_from_p_T(_P[_qp], _T[_qp], _vmfrac[_qp], _phase[_qp]);

  // To calculate the friction factor and Re No
  _u[_qp] = fabs(_m[_qp]) / _rho_m[_qp] / _area[_qp];
  _Re[_qp] = _rho_m[_qp] * _dia[_qp] * _u[_qp] / viscosity_uo.mixture_mu(_P[_qp], _T[_qp], _vmfrac[_qp]);
  if (_f_defined)
    _friction[_qp] = _u_f;
  else
    MoodyFrictionFactor(_friction[_qp], _rel_roughness, _Re[_qp], _roughness_type);

  // drift-flux calculator section
    MoskitoDFGVar DFinp(_u[_qp], _rho_g[_qp], _rho_l[_qp], _vmfrac[_qp], _vfrac[_qp],
      _dia[_qp], _well_sign[_qp], _friction[_qp], _gravity[_qp], _well_dir[_qp]);
    dfm_uo.DFMCalculator(DFinp);
    DFinp.DFMOutput(_flow_pat[_qp], _c0[_qp], _u_d[_qp]);

  _rho_pam[_qp] = _rho_g[_qp] * _c0[_qp]  * _vfrac[_qp] + (1.0 - _vfrac[_qp] * _c0[_qp]) * _rho_l[_qp];

  PhaseVelocities();
  GammaDerivatives();
  KappaDerivatives();
  OmegaDerivatives();

  // _lambda[_qp]  = (1.0 - (_d * _d) / std::pow(_d + _thickness , 2.0)) * _lambda0;
  // _lambda[_qp] += (_d * _d) / std::pow(_d + _thickness , 2.0) * eos_uo._lambda;
}
void
MoskitoFluidWell_2p1c::PhaseVelocities()
{
  // based on mass weighted flow rate
  // momentum eq is valid only by mass mixing flow rate
  if (_phase[_qp] == 2.0 && _u[_qp] != 0.0)
  {
    _u_g[_qp]  = _c0[_qp] * _rho_m[_qp] * _u[_qp] + _rho_l[_qp] * _u_d[_qp];
    _u_g[_qp] /= _rho_pam[_qp];
    _u_l[_qp]  = (1.0 - _vfrac[_qp] * _c0[_qp]) * _rho_m[_qp]  * _u[_qp] - _rho_g[_qp] * _vfrac[_qp] * _u_d[_qp];
    _u_l[_qp] /= (1.0 - _vfrac[_qp]) * _rho_pam[_qp];
  }
  else
  {
    if (_vmfrac[_qp] == 0.0)
    {
      _u_g[_qp] = 0.0;
      _u_l[_qp] = _u[_qp];
    }
    else
    {
      _u_l[_qp] = 0.0;
      _u_g[_qp] = _u[_qp];
    }
  }
}

Real
MoskitoFluidWell_2p1c::gamma(const Real & h, const Real & p, const Real & m)
{
  Real vmfrac, T, phase, gamma = 0.0;
  eos_uo.VMFrac_T_from_p_h(p, h, vmfrac, T, phase);

  if(phase == 2.0 && m != 0.0)
  {
    Real vfrac, rho_l, rho_g, rho_m, rho_pam;
    rho_l = eos_uo.rho_l_from_p_T(p, T, phase);
    rho_g = eos_uo.rho_g_from_p_T(p, T, phase);
    rho_m = rho_l * rho_g / (vmfrac * (rho_l - rho_g) + rho_g);
    vfrac = (rho_m - rho_l) / (rho_g - rho_l);
    rho_pam = rho_g * _c0[_qp]  * vfrac + (1.0 - vfrac * _c0[_qp]) * rho_l;

    gamma  = vfrac / (1.0 - vfrac);
    gamma *= rho_g * rho_l * rho_m / (rho_pam * rho_pam);
    gamma *= std::pow((_c0[_qp] - 1.0) * (m / rho_m / _area[_qp]) + _u_d[_qp] , 2.0);
  }

  return gamma;
}

Real
MoskitoFluidWell_2p1c::kappa(const Real & h, const Real & p, const Real & m)
{
  Real vmfrac, T, phase, kappa = 0.0;
  eos_uo.VMFrac_T_from_p_h(p, h, vmfrac, T, phase);

  if(phase == 2.0 && m != 0.0)
  {
    Real vfrac, rho_l, rho_g, rho_m, rho_pam, h_g, h_l;
    rho_l = eos_uo.rho_l_from_p_T(p, T, phase);
    rho_g = eos_uo.rho_g_from_p_T(p, T, phase);
    rho_m = rho_l * rho_g / (vmfrac * (rho_l - rho_g) + rho_g);
    vfrac = (rho_m - rho_l) / (rho_g - rho_l);

    Real dummy, c0, u_d;
    MoskitoDFGVar DFinp(m / rho_m / _area[_qp], rho_g, rho_l, vmfrac, vfrac,
        _dia[_qp], _well_sign[_qp], _friction[_qp], _gravity[_qp], _well_dir[_qp]);
    dfm_uo.DFMCalculator(DFinp);
    DFinp.DFMOutput(dummy, c0, u_d);

    rho_pam = rho_g * c0 * vfrac + (1.0 - vfrac * c0) * rho_l;
    eos_uo.h_lat(p, dummy, h_l, h_g);

    kappa  = vfrac * rho_g * rho_l / rho_pam * (h_g - h_l);
    kappa *= (c0 - 1.0) * (m / rho_m / _area[_qp]) + u_d;
  }

  return kappa;
}

Real
MoskitoFluidWell_2p1c::omega(const Real & h, const Real & p, const Real & m)
{
  Real vmfrac, T, phase, omega = 0.0;
  eos_uo.VMFrac_T_from_p_h(p, h, vmfrac, T, phase);

  if(phase == 2.0 && m != 0.0)
  {
    Real vfrac, rho_l, rho_g, rho_m, u_g, u_l, rho_pam, dummy, c0, u_d;
    rho_l = eos_uo.rho_l_from_p_T(p, T, phase);
    rho_g = eos_uo.rho_g_from_p_T(p, T, phase);
    rho_m = rho_l * rho_g / (vmfrac * (rho_l - rho_g) + rho_g);
    vfrac = (rho_m - rho_l) / (rho_g - rho_l);
    rho_pam = rho_g * c0  * vfrac + (1.0 - vfrac * c0) * rho_l;

    Real v = m / rho_m / _area[_qp] ;

    u_g  = (c0 * rho_m * v + rho_l * u_d) / rho_pam;
    u_l  = (1.0 - vfrac * c0) * rho_m * v - rho_g * vfrac * u_d;
    u_l /= (1.0 - vfrac) * rho_pam;

    omega -= 3.0 * u_g * u_l * v;
    omega += std::pow(u_g,3.0) * (1.0 + rho_g * vfrac /rho_m);
    omega += std::pow(u_l,3.0) * (1.0 + rho_l * (1.0 - vfrac) / rho_m);
    omega *= 0.5 * vfrac * (1.0 - vfrac) * rho_g * rho_l / rho_m;
  }

  return omega;
}

void
MoskitoFluidWell_2p1c::GammaDerivatives()
{
  _dgamma_dp[_qp]  = 0.0; _dgamma_dh[_qp]  = 0.0; _dgamma_dm[_qp]  = 0.0;

  if (_phase[_qp] == 2.0)
  {
    Real dh, dm, dp;
    Real tol = 1.0e-3;
    dh = tol * _h[_qp]; dp = tol * _P[_qp]; dm = tol * _m[_qp];

    if (dh != 0.0)
    {
      _dgamma_dh[_qp]  = gamma(_h[_qp] + dh, _P[_qp], _m[_qp]) - gamma(_h[_qp] - dh, _P[_qp], _m[_qp]);
      _dgamma_dh[_qp] /= 2.0 * dh;
    }

    if (dp != 0.0)
    {
    _dgamma_dp[_qp]  = gamma(_h[_qp], _P[_qp] + dp, _m[_qp]) - gamma(_h[_qp], _P[_qp] - dp, _m[_qp]);
    _dgamma_dp[_qp] /= 2.0 * dp;
    }

    if (dm != 0.0)
    {
    _dgamma_dm[_qp]  = gamma(_h[_qp], _P[_qp], _m[_qp] + dm) - gamma(_h[_qp], _P[_qp], _m[_qp] - dm);
    _dgamma_dm[_qp] /= 2.0 * dm;
    }
  }
}

void
MoskitoFluidWell_2p1c::KappaDerivatives()
{
  _dkappa_dp[_qp] = 0.0; _dkappa_dh[_qp] = 0.0; _dkappa_dm[_qp] = 0.0;
  _dkappa_dph[_qp] = 0.0; _dkappa_dpm[_qp] = 0.0; _dkappa_dhm[_qp] = 0.0;
  _dkappa_dp2[_qp] = 0.0; _dkappa_dh2[_qp] = 0.0; _dkappa_dm2[_qp] = 0.0;

  if (_phase[_qp] == 2.0)
  {
    Real dh, dm, dp;
    Real tol = 1.0e-3;
    dh = tol * _h[_qp]; dp = tol * _P[_qp]; dm = tol * _m[_qp];

    if (dh != 0.0)
    {
      _dkappa_dh[_qp]  = kappa(_h[_qp] + dh, _P[_qp], _m[_qp]) - kappa(_h[_qp] - dh, _P[_qp], _m[_qp]);
      _dkappa_dh[_qp] /= 2.0 * dh;
    }

    if (dp != 0.0)
    {
    _dkappa_dp[_qp]  = kappa(_h[_qp], _P[_qp] + dp, _m[_qp]) - kappa(_h[_qp], _P[_qp] - dp, _m[_qp]);
    _dkappa_dp[_qp] /= 2.0 * dp;
    }

    if (dm != 0.0)
    {
    _dkappa_dm[_qp]  = kappa(_h[_qp], _P[_qp], _m[_qp] + dm) - kappa(_h[_qp], _P[_qp], _m[_qp] - dm);
    _dkappa_dm[_qp] /= 2.0 * dm;
    }
    if (dp * dh != 0.0)
    {
    _dkappa_dph[_qp]  = kappa(_h[_qp] + dh, _P[_qp] + dp, _m[_qp]) + kappa(_h[_qp] - dh, _P[_qp] - dp, _m[_qp]);
    _dkappa_dph[_qp] -= kappa(_h[_qp] + dh, _P[_qp] - dp, _m[_qp]) + kappa(_h[_qp] - dh, _P[_qp] + dp, _m[_qp]);
    _dkappa_dph[_qp] /= 4.0 * dh * dp;
    }

    if (dh * dm != 0.0)
    {
    _dkappa_dhm[_qp]  = kappa(_h[_qp] + dh, _P[_qp], _m[_qp] + dm) + kappa(_h[_qp] - dh, _P[_qp], _m[_qp] - dm);
    _dkappa_dhm[_qp] -= kappa(_h[_qp] + dh, _P[_qp], _m[_qp] - dm) + kappa(_h[_qp] - dh, _P[_qp], _m[_qp] + dm);
    _dkappa_dhm[_qp] /= 4.0 * dh * dm;
    }

    if (dp * dm != 0.0)
    {
    _dkappa_dpm[_qp]  = kappa(_h[_qp], _P[_qp] + dp, _m[_qp] + dm) + kappa(_h[_qp], _P[_qp] - dp, _m[_qp] - dm);
    _dkappa_dpm[_qp] -= kappa(_h[_qp], _P[_qp] + dp, _m[_qp] - dm) + kappa(_h[_qp], _P[_qp] - dp, _m[_qp] + dm);
    _dkappa_dpm[_qp] /= 4.0 * dp * dm;
    }

    if (dp != 0.0)
    {
    _dkappa_dp2[_qp]  = kappa(_h[_qp], _P[_qp] + dp, _m[_qp]) + kappa(_h[_qp], _P[_qp] - dp, _m[_qp]);
    _dkappa_dp2[_qp] -= 2.0 * kappa(_h[_qp], _P[_qp], _m[_qp]);
    _dkappa_dp2[_qp] /=  dp * dp;
    }
    if (dh != 0.0)
    {
    _dkappa_dh2[_qp]  = kappa(_h[_qp] + dh, _P[_qp], _m[_qp]) + kappa(_h[_qp] - dh, _P[_qp], _m[_qp]);
    _dkappa_dh2[_qp] -= 2.0 * kappa(_h[_qp], _P[_qp], _m[_qp]);
    _dkappa_dh2[_qp] /=  dh * dh;
    }
    if (dm != 0.0)
    {
    _dkappa_dm2[_qp]  = kappa(_h[_qp], _P[_qp], _m[_qp] + dm) + kappa(_h[_qp], _P[_qp], _m[_qp] - dm);
    _dkappa_dm2[_qp] -= 2.0 * kappa(_h[_qp], _P[_qp], _m[_qp]);
    _dkappa_dm2[_qp] /=  dm * dm;
    }
  }
}

void
MoskitoFluidWell_2p1c::OmegaDerivatives()
{
  _domega_dp[_qp] = 0.0; _domega_dh[_qp] = 0.0; _domega_dm[_qp] = 0.0;

  if (_phase[_qp] == 2.0)
  {
    Real dh, dm, dp;
    Real tol = 1.0e-3;
    dh = tol * _h[_qp]; dp = tol * _P[_qp]; dm = tol * _m[_qp];

    if (dh != 0.0)
    {
      _domega_dh[_qp]  = omega(_h[_qp] + dh, _P[_qp], _m[_qp]) - omega(_h[_qp] - dh, _P[_qp], _m[_qp]);
      _domega_dh[_qp] /= 2.0 * dh;
    }

    if (dp != 0.0)
    {
    _domega_dp[_qp]  = omega(_h[_qp], _P[_qp] + dp, _m[_qp]) - omega(_h[_qp], _P[_qp] - dp, _m[_qp]);
    _domega_dp[_qp] /= 2.0 * dp;
    }

    if (dm != 0.0)
    {
    _domega_dm[_qp]  = omega(_h[_qp], _P[_qp], _m[_qp] + dm) - omega(_h[_qp], _P[_qp], _m[_qp] - dm);
    _domega_dm[_qp] /= 2.0 * dm;
    }
  }
}
