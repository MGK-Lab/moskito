//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#pragma once

// MOOSE includes
#include "AuxKernel.h"
#include "MoskitoEOS2P.h"

// Forward declarations
class MoskitoKappa;

template <>
InputParameters validParams<MoskitoKappa>();

class MoskitoKappa : public AuxKernel
{
public:
  static InputParameters validParams();

  MoskitoKappa(const InputParameters & parameters);

protected:
  virtual Real computeValue() override;

private:
  const VariableValue & _h;
  const VariableValue & _P;
  const MoskitoEOS2P & eos_uo;
  const MaterialProperty<Real> & _well_sign;
  const MaterialProperty<Real> & _u_d;
  const MaterialProperty<Real> & _c0;
  const MaterialProperty<Real> & _v;
};
