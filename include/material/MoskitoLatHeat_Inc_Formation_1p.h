/**************************************************************************/
/*  MOSKITO - Multiphysics cOupled Simulator toolKIT for wellbOres        */
/*                                                                        */
/*  Copyright (C) 2017 by Maziar Gholami Korzani                          */
/*  Karlsruhe Institute of Technology, Institute of Applied Geosciences   */
/*  Division of Geothermal Research                                       */
/*                                                                        */
/*  This file is part of MOSKITO App                                      */
/*  Co-developed by Sebastian Held                                        */
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
#include "Function.h"
#include "MoskitoSUPG.h"
#include "NewtonIteration.h"

class MoskitoLatHeat_Inc_Formation_1p;

template <>
InputParameters validParams<MoskitoLatHeat_Inc_Formation_1p>();

class MoskitoLatHeat_Inc_Formation_1p : public Material, public NewtonIteration
{
public:
  MoskitoLatHeat_Inc_Formation_1p(const InputParameters & parameters);
  virtual void computeQpProperties() override;

  Real TemperatureWFinterface(const Real & Uto);
  Real nonDtimefunction();

  virtual Real computeReferenceResidual(const Real trail_value, const Real scalar) override;
  virtual Real computeResidual(const Real trail_value, const Real scalar) override;
  virtual Real computeDerivative(const Real trail_value, const Real scalar) override;
  virtual Real initialGuess(const Real trail_value) override;
  virtual Real minimumPermissibleValue(const Real trail_value) const override
  {
    return 0.000000001;
  }
  virtual Real maximumPermissibleValue(const Real trail_value) const override
  {
    return 100000.0;
  }

protected:
  // Fluid temperature at the center of the pipe
  const VariableValue & _Tf;

  // tubing outer radius
  MaterialProperty<Real> & _Rto;
  // Well thermal resistivity
  MaterialProperty<Real> & _Uto;
  // total thermal resistivity
  MaterialProperty<Real> & _lambda_t;
  // temperature at well-formation interface
  MaterialProperty<Real> & _Twf;

  // Tolerance of finite difference derivation
  const Real _tol;

  // outer diamters of well complition
  std::vector<Real> _OD_vec;
  // conductivities vector
  std::vector<Real> _lambda_vec;

  const Function & _Tform_func;
  // formation temperature from the function
  MaterialProperty<Real> & _Tform;
  // formation properties
  const Real & _lambda_form;
  const Real & _rho_form;
  const Real & _cp_form;
  Real _alpha_form;

  // imported from other materials
  const MaterialProperty<Real> & _Dti;
  const MaterialProperty<RealVectorValue> & _gravity;
  const MaterialProperty<RealVectorValue> & _well_dir;
  const MaterialProperty<Real> & _Re;
  const MaterialProperty<Real> * _hf;
  const bool & _add_hf;

  // Annulus outer and inner radiuses
  Real _rai = 0.0, _rao = 0.0;
  unsigned int _annulus_loc = 0;
  bool _annulus_ind = false;

  const MoskitoSUPG * _annulus_uo;

  Real _time;
  bool _mt = false;
  Real PI = 3.141592653589793238462643383279502884197169399375105820974944592308;

  MooseEnum _time_func_user;
  enum time_func_cases {Kutasov2003_constHF, Kutasov2005_constWFT, Ramey_1981_BF, Hasan_Kabir_2012};

  // well-formation interface radius
  Real _Rwf;
  Real _ft;

};
