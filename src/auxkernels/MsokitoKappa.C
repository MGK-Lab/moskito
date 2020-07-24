//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#include "MoskitoKappa.h"

registerMooseObject("MoskitoApp", MoskitoKappa);

defineLegacyParams(MoskitoKappa);

InputParameters
MoskitoKappa::validParams()
{
  MooseEnum component("x=0 y=1 z=2");
  InputParameters params = AuxKernel::validParams();
  params.addRequiredCoupledVar("enthalpy",
                               "Specific enthalpy nonlinear variable");
  params.addRequiredCoupledVar("pressure",
                               "Pressure nonlinear variable");
  params.addRequiredParam<UserObjectName>("eos_uo",
        "The name of the userobject for 2 phase EOS");
  return params;
}

MoskitoKappa::MoskitoKappa(const InputParameters & parameters)
  : AuxKernel(parameters),
    _h(coupledValue("enthalpy")),
    _P(coupledValue("pressure")),
    eos_uo(getUserObject<MoskitoEOS2P>("eos_uo")),
    _well_sign(getMaterialProperty<Real>("flow_direction_sign")),
    _u_d(getMaterialProperty<Real>("drift_velocity")),
    _c0(getMaterialProperty<Real>("flow_type_c0")),
    _v(getMaterialProperty<Real>("well_velocity"))
{
}

Real
MoskitoKappa::computeValue()
{
  Real vmfrac, T, phase, kappa = 0.0;
  eos_uo.VMFrac_T_from_p_h(_P[_qp], _h[_qp], vmfrac, T, phase);

  if(phase == 2.0)
  {
    Real vfrac, rho_l, rho_g, rho_m, rho_pam, h_g, h_l, dummy;
    rho_l = eos_uo.rho_l_from_p_T(_P[_qp], T, phase);
    rho_g = eos_uo.rho_g_from_p_T(_P[_qp], T, phase);
    rho_m = rho_l * rho_g / (vmfrac * (rho_l - rho_g) + rho_g);
    vfrac = (rho_m - rho_l) / (rho_g - rho_l);
    rho_pam = rho_g * _c0[_qp]  * vfrac + (1.0 - vfrac * _c0[_qp]) * rho_l;
    eos_uo.h_lat(_P[_qp], dummy, h_l, h_g);

    kappa  = vfrac * rho_g * rho_l / rho_pam * (h_g - h_l);
    kappa *= (_c0[_qp] - 1.0) * _v[_qp] * _well_sign[_qp] + _u_d[_qp];
  }

  return kappa;
}
