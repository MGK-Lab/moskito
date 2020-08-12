
# Validation of Heat exchange using the Paper from Satman & Tureyen 2016
[Mesh]
  type = GeneratedMesh
  dim = 1
  xmin = 0
  xmax = 30
  nx = 30
[]

[Modules]
  [./FluidProperties]
    [./water_uo]
      type = SimpleFluidProperties
      density0 = 1000
      cp = 4190
      thermal_conductivity = 0.59
    [../]
  [../]
[]

[UserObjects]
  [./viscosity]
    type = MoskitoViscosityConst
    viscosity = 1.14e-3
  [../]
  [./eos]
    type = MoskitoEOS1P_FPModule
    SinglePhase_fp = water_uo
  [../]
[]

[Functions]
  [./grad_func]
    type = ParsedFunction
    value = '55'
  [../]
[]

[Materials]
  [./area0]
    type = MoskitoFluidWell_1p1c
    temperature = T
    pressure = p
    flowrate = q
    well_direction = x
    well_diameter = 0.25826
    eos_uo = eos
    viscosity_uo = viscosity
    roughness_type = smooth
    gravity = '0 0 0'
    well_type = injection
  [../]
  [./Lateral]
    type = MoskitoLatHeat_Inc_Formation_1p
     temperature_inner = T
     outer_diameters = '0.25826 0.27 0.28'
     conductivities = '1.3 0.73'
     # Rock parameters
     formation_density = 1800
     formation_thermal_conductivity = 2.78018
     formation_heat_capacity = 1778
     # Configuration of material
     formation_temperature_function = grad_func
     nondimensional_time_function = Ramey_1981
     output_properties = 'wellbore_formation_temperature well_thermal_resistivity'
     outputs = exodus
   [../]
[]

[Variables]
  [./T]
    initial_condition = 20
  [../]
[]

[AuxVariables]
  [./p]
    initial_condition = 1.0e5
  [../]
  [./q]
    initial_condition = 2e-4
  [../]
[]

[BCs]
  [./Tbc]
    type = DirichletBC
    variable = T
    boundary = left
    value = 20
  [../]
[../]

[Kernels]
  [./Tkernel]
    type = MoskitoEnergy_1p1c
    variable = T
    pressure = p
    flowrate = q
  [../]
  [./Ttkernel]
    type = MoskitoTimeEnergy_1p1c
    variable = T
    pressure = p
    flowrate = q
  [../]
  [./heat]
    type = MoskitoLatHeatIncFormation_1p
    variable = T
  [../]
[]

[Preconditioning]
  active = p3
  [./p3]
    type = SMP
    full = true
    #petsc_options = '-snes_ksp_ew'
    petsc_options_iname = '-pc_type -ksp_type -sub_pc_type -snes_type -snes_linesearch_type -pc_asm_overlap -sub_pc_factor_shift_type -ksp_gmres_restart'
    petsc_options_value = 'asm gmres lu newtonls basic 2 NONZERO 51'
  [../]
[]

[Executioner]
  type = Transient
  dt = 86400
  end_time = 2592000
  l_max_its = 50
  l_tol = 1e-10
  nl_rel_tol = 1e-8
  nl_max_its = 50
  solve_type = NEWTON
  nl_abs_tol = 1e-7
  []
[]

[Outputs]
  exodus = true
  print_linear_residuals = false
[]
