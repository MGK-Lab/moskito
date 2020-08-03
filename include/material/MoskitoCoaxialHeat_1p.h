/**************************************************************************/
/*  MOSKITO - Multiphysics cOupled Simulator toolKIT for wellbOres        */
/*                                                                        */
/*  Copyright (C) 2019 by Maziar Gholami Korzani                          */
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

#include "Material.h"
#include "MoskitoEOS1P.h"
#include "MoskitoViscosity1P.h"

class MoskitoCoaxialHeat_1p;

template <>
InputParameters validParams<MoskitoCoaxialHeat_1p>();

class MoskitoCoaxialHeat_1p : public Material
{
public:
  MoskitoCoaxialHeat_1p(const InputParameters & parameters);
  virtual void computeQpProperties() override;

protected:
  // Userobject to equation of state
  const MoskitoEOS1P & eos_uo;
  // Userobject to Viscosity Eq
  const MoskitoViscosity1P & viscosity_uo;
  // overall heat transfer coeff
  MaterialProperty<Real> & _ohc;
  Real _rdo;
  Real _rdi;
  Real _rwo;
  Real _kd;
  // The coupled temperature of inner pipe
  const VariableValue & _T_i;
  // The coupled flow rate of inner pipe
  const VariableValue & _flow_i;
  // The coupled pressure of inner pipe
  const VariableValue & _p_i;
  // The coupled temperature of inner pipe
  const VariableValue & _T_a;
  // The coupled flow rate of inner pipe
  const VariableValue & _flow_a;
  // The coupled pressure of inner pipe
  const VariableValue & _p_a;
  // Nusslet number inner pipe
  MaterialProperty<Real> & _nusselt_i;
  // Nusslet number annulus
  MaterialProperty<Real> & _nusselt_a;
  // function for calculating convective heat transfer coeff in the inner pipe
  Real Conv_coeff_inner();
  // function for calculating convective heat transfer coeff in the annulus
  Real Conv_coeff_annulus();
  Real PI = 3.141592653589793238462643383279502884197169399375105820974944592308;
};
