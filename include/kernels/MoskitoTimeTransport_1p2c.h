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

#include "TimeKernel.h"

class MoskitoTimeTransport_1p2c;

template <>
InputParameters validParams<MoskitoTimeTransport_1p2c>();

class MoskitoTimeTransport_1p2c : public TimeKernel
{
public:
  MoskitoTimeTransport_1p2c(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;
  virtual Real computeQpJacobian() override;
  virtual Real computeQpOffDiagJacobian(unsigned int jvar) override;

  // required values for temperature coupling
  const VariableValue & _T_dot;
  const VariableValue & _dT_dot;
  const VariableValue & _p_dot;
  const VariableValue & _dp_dot;
  const unsigned int _T_var_number;
  const unsigned int _p_var_number;

  // fluid density
  const MaterialProperty<Real> & _rho;
  // The first derivative of density wrt pressure
  const MaterialProperty<Real> & _drho_dp;
  // The first derivative of density wrt temperature
  const MaterialProperty<Real> & _drho_dT;
  // The first derivative of density wrt salinity
  const MaterialProperty<Real> & _drho_dm;
};
