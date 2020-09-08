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

#include "MoskitoEOS1P_Brine_VC.h"

registerMooseObject("MoskitoApp", MoskitoEOS1P_Brine_VC);

template <>
InputParameters
validParams<MoskitoEOS1P_Brine_VC>()
{
  InputParameters params = validParams<MoskitoEOS1P_MC>();
  params.addParam<Real>("thermal_conductivity", 0.6,
        "Constant thermal conductivity (W/m/K)");

  return params;
}

MoskitoEOS1P_Brine_VC::MoskitoEOS1P_Brine_VC(const InputParameters & parameters)
  : MoskitoEOS1P_MC(parameters),
    _lambda(getParam<Real>("thermal_conductivity"))
{
}

Real
MoskitoEOS1P_Brine_VC::rho_from_p_T(const Real & molality, const Real & pressure, const Real & temperature) const
{
  if (pressure <0.0 || temperature <273.15)
    mooseError("The pressure or temperature is out of the range.");
  Real _mass_frac = molality / ((1.0 - molality) * 0.05844);
  Real _a = -9.9559*std::exp(-4.539e-3*_mass_frac) + 7.0845*std::exp(-1.638e-4*(temperature-273.15))+3.909*std::exp(2.551e-10*pressure);
  return (-3.033405 + 10.128163*_a - 8.750567*_a*_a + 2.663107*_a*_a*_a)*1.0e3;
}

void
MoskitoEOS1P_Brine_VC::rho_from_p_T(const Real & molality, const Real & pressure, const Real & temperature,
                              Real & rho, Real & drho_dp, Real & drho_dT, Real & drho_dm) const
{
  rho = this->rho_from_p_T(molality, pressure, temperature);
  Real _mass_frac = molality / ((1.0 - molality) * 0.05844);
  Real _a = -9.9559*std::exp(-4.539e-3*_mass_frac) + 7.0845*std::exp(-1.638e-4*(temperature-273.15))+3.909*std::exp(2.551e-10*pressure);
  drho_dp = (10.128163 - 17.501134*_a + 7.989321*_a*_a)*9.971859e-10*std::exp(2.551e-10*pressure);
  drho_dT = (10.128163 - 17.501134*_a + 7.989321*_a*_a)*-1.1604411e-3*std::exp(-1.638e-4*(temperature-273.15));
  drho_dm = (10.128163 - 17.501134*_a + 7.989321*_a*_a)*4.51898301e-2*std::exp(-4.539e-3*_mass_frac);
}

Real
MoskitoEOS1P_Brine_VC::cp(const Real & molality, const Real & pressure, const Real & temperature) const
{
  return molality * 880 + (1.0 - molality) * 4190.0;
}

Real
MoskitoEOS1P_Brine_VC::lambda(const Real & pressure, const Real & temperature) const
{
  return _lambda;
}
