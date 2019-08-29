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

#ifndef MOSKITOEOSIDEALFLUID_H
#define MOSKITOEOSIDEALFLUID_H

#include "MoskitoEOS1P.h"

class MoskitoEOSIdealFluid;

template <>
InputParameters validParams<MoskitoEOSIdealFluid>();

class MoskitoEOSIdealFluid : public MoskitoEOS1P
{
public:
  MoskitoEOSIdealFluid(const InputParameters & parameters);

  virtual Real rho_from_p_T(const Real & pressure, const Real & temperature, const Real & enthalpy) const override;
  virtual void rho_from_p_T(const Real & pressure, const Real & temperature, const Real & enthalpy,
                        Real & rho, Real & drho_dp, Real & drho_dT) const override;
  virtual Real h_to_T(const Real & enthalpy, const Real & pressure) const override;
  virtual Real T_to_h(const Real & temperature, const Real & pressure) const override;
  virtual Real cp(const Real & temperature, const Real & pressure) const override;
  virtual Real lambda(const Real & pressure, const Real & temperature) const override;

protected:
  // density at reference pressure and temperature
  const Real _rho_ref = 0;
  // reference temperature
  const Real _T_ref = 0;
  // reference pressure
  const Real _P_ref = 0;
  // reference enthalpy
  const Real _h_ref = 0;
  const Real _cp;
  const Real _lambda;
  const Real _thermal_expansion_0;
  const Real _thermal_expansion_1;
  const Real _bulk_modulus;
};

#endif /* MOSKITOEOSIDEALFLUID_H */
