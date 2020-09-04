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

#pragma once

#include "MoskitoFluidWellGeneral.h"
#include "MoskitoEOS1P_MC.h"
#include "MoskitoViscosity1P.h"

class MoskitoFluidWell_1p_MC;

template <>
InputParameters validParams<MoskitoFluidWell_1p_MC>();

class MoskitoFluidWell_1p_MC : public MoskitoFluidWellGeneral
{
public:
  MoskitoFluidWell_1p_MC(const InputParameters & parameters);
  virtual void computeQpProperties() override;

protected:
  // Userobject to equation of state
  const MoskitoEOS1P_MC & eos_uo;
  // Userobject to Viscosity Eq
  const MoskitoViscosity1P & viscosity_uo;
  // The convective heat transfer factor of fluid in coaxial configuration
  MaterialProperty<Real> & _hf;
  // The vescosity
  MaterialProperty<Real> & _vis;
  // salt concentration
  MaterialProperty<Real> & _m;
  // The constant thermal conductivity of fluid
  MaterialProperty<Real> & _lambda;
  // The specific heat at constant pressure
  MaterialProperty<Real> & _cp;
  // The density
  MaterialProperty<Real> & _rho;
  // The first derivative of density wrt pressure
  MaterialProperty<Real> & _drho_dp;
  // The first derivative of density wrt temperature
  MaterialProperty<Real> & _drho_dT;
  // Enthalpy from P and T
  MaterialProperty<Real> & _h;

  // The coupled temperature
  const VariableValue & _T;
  // The coupled flow rate
  const VariableValue & _flow;

  const Function & _mol;

  // function for calculating convective heat transfer coeff
  Real Conv_coeff();
};
