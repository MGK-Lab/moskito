
# Validation of Heat exchange using the Paper from Satman & Tureyen 2016
[Mesh]
  type = GeneratedMesh
  dim = 1
  xmin = 0
  xmax = 2500
  nx = 400
[]

[UserObjects]
  [./viscosity]
    type = MoskitoViscosityWaterSmith
  [../]
  [./eos]
    type = MoskitoEOS1P_IdealFluid
    specific_heat = 3160
    reference_temperature = 273.15
  [../]
[]

[Functions]
  [./grad_func]
    type = ParsedFunction
    value = '293.15 + 0.09 * x'
  [../]
[]

[Materials]
  [./area0]
    type = MoskitoFluidWell_1p1c
    temperature = T
    pressure = p
    flowrate = q
    well_direction = x
    well_diameter = 0.3
    eos_uo = eos
    viscosity_uo = viscosity
    roughness_type = smooth
    gravity = '0.0 0 0'
    well_type = injection
    outputs = exodus
    output_properties = 'temperature density well_velocity specific_heat well_reynolds_no well_moody_friction viscosity diameter'
  [../]
  [./Lateral]
    type = MoskitoLatHeat_Inc_Formation_1p
     temperature_inner = T
     outer_diameters = '0.3 0.300000000001'
     conductivities = '40.0'
     # Rock parameters
     formation_density = 2650
     formation_thermal_conductivity = 2.92
     formation_heat_capacity = 1000
     # Configuration of material
     formation_temperature_function = grad_func
     nondimensional_time_function =  Satman_eq16
     output_properties = 'wellbore_formation_temperature well_thermal_resistivity'
     outputs = exodus
   [../]
[]

[Variables]
  [./T]
    scaling = 1e-2
    initial_condition = 293.15
  [../]
  [./p]
    initial_condition = 1.0e5
    scaling = 1e1
  [../]
  [./q]
    initial_condition = 0.020038
    scaling = 1e-2
  [../]
[]

[BCs]
  [./qbc]
    type = DirichletBC
    variable = q
    boundary = right
    value = 0.020038
  [../]
  [./pbc]
    type = DirichletBC
    variable = p
    boundary = left
    value = 1.0e5
  [../]
  [./Tbc]
    type = DirichletBC
    variable = T
    boundary = left
    value =  293.15
  [../]
[]

[Kernels]
  [./Tkernel]
    type = MoskitoEnergy_1p1c
    variable = T
    pressure = p
    flowrate = q
  [../]
  [./qkernel1]
    type = MoskitoMomentum_1p1c
    variable = q
    pressure = p
    temperature = T
  [../]
  [./pkernel1]
    type = MoskitoMass_1p1c
    variable = p
    temperature = T
    flowrate = q
  [../]
  # [./heat]
  #   type = MoskitoLateralHeat_1p
  #   variable = T
  # [../]
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
  type = Steady
  dt = 100
  end_time = 2000

  l_max_its = 50
  l_tol = 1e-10
  nl_rel_tol = 1e-8
  nl_max_its = 50
  solve_type = NEWTON
  nl_abs_tol = 1e-7
[]

[Outputs]
  exodus = true
  print_linear_residuals = true
[]
