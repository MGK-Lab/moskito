/**************************************************************************/
/*  TIGER - THMC sImulator for GEoscience Research                        */
/*                                                                        */
/*  Copyright (C) 2017 by Maziar Gholami Korzani                          */
/*  Karlsruhe Institute of Technology, Institute of Applied Geosciences   */
/*  Division of Geothermal Research                                       */
/*                                                                        */
/*  This file is part of TIGER App                                        */
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

#ifndef MOSKITOHEATEXCHANGE_H
#define MOSKITOHEATEXCHANGE_H

#include "AuxKernel.h"

class MoskitoHeatExchange;

template <>
InputParameters validParams<MoskitoHeatExchange>();

class MoskitoHeatExchange : public AuxKernel
{
public:
  MoskitoHeatExchange(const InputParameters & parameters);

protected:
  virtual Real computeValue() override;

private:
  // imported props from TigerHydarulicMaterial
  const VariableValue & _T;
  const MaterialProperty<Real> & _lambda;
  const MaterialProperty<Real> & _Tform;
  const Real PI = 3.141592653589793238462643383279502884197169399375105820974944592308;
};

#endif // MOSKITOHEATEXCHANGE_H
