[Mesh]
  type = FileMesh
  file = test.msh
[]

[UserObjects]
  [./eos]
    type = MoskitoEOS1P_Brine_VC
  [../]
  [./viscosity]
    type = MoskitoViscosityWaterVogel
  [../]
[]

[Materials]
  [./left_vertical_up]
    type = MoskitoFluidWell_1p_MC
    pressure = p
    temperature = T
    flowrate = q
    molality = m
    well_direction = -z
    well_type = injection
    eos_uo = eos
    viscosity_uo = viscosity
    well_diameter = 0.244475
    roughness_type = rough
    roughness = 1e-04
    gravity = '0 0 -9.8'
    block = left_vertical_up
    output_properties = 'molality specific_heat density viscosity'
    #outputs = exodus
  [../]
  [./lat-left_vertical]
    type = MoskitoLatHeat_Inc_Formation_1p
    temperature_inner = T
    outer_diameters = '0.244475 0.272161 0.346075 0.377825 0.473075 0.502412 0.5588'
    conductivities = '100 0.7 100 0.7 100 0.7'
    formation_density = 2400
    formation_heat_capacity = 1000
    formation_temperature_function = grad_func
    formation_thermal_conductivity_function = conductivity_gradient
    convective_thermal_resistance = true
    nondimensional_time_function = Hasan_Kabir_2012
    output_properties = 'total_thermal_resistivity formation_thermal_conductivity'
    #outputs = exodus
    block = left_vertical_up
  [../]

  [./left_vertical_bet]
    type = MoskitoFluidWell_1p_MC
    pressure = p
    temperature = T
    flowrate = q
    molality = m
    well_direction = -z
    well_type = injection
    eos_uo = eos
    viscosity_uo = viscosity
    well_diameter = 0.244475
    roughness_type = rough
    roughness = 1e-04
    gravity = '0 0 -9.8'
    block = left_vertical_bet
    output_properties = 'molality specific_heat density viscosity'
    # outputs = exodus
  [../]
  [./lat-left_vertical_bet]
    type = MoskitoLatHeat_Inc_Formation_1p
    temperature_inner = T
    outer_diameters = '0.244475 0.272161 0.346075 0.377825 0.4318'
    conductivities = '100 0.7 100 0.7'
    formation_density = 2400
    formation_heat_capacity = 1000
    formation_temperature_function = grad_func
    formation_thermal_conductivity_function = conductivity_gradient
    convective_thermal_resistance = true
    nondimensional_time_function = Hasan_Kabir_2012
    output_properties = 'total_thermal_resistivity formation_thermal_conductivity'
    # outputs = exodus
    block = left_vertical_bet
  [../]

  [./left_vertical_down]
    type = MoskitoFluidWell_1p_MC
    pressure = p
    temperature = T
    flowrate = q
    molality = m
    well_direction = -z
    well_type = injection
    eos_uo = eos
    viscosity_uo = viscosity
    well_diameter = 0.244475
    roughness_type = rough
    roughness = 1e-04
    gravity = '0 0 -9.8'
    block = left_vertical_down
    output_properties = 'molality specific_heat density viscosity'
    # outputs = exodus
  [../]
  [./lat-left_vertical_down]
    type = MoskitoLatHeat_Inc_Formation_1p
    temperature_inner = T
    outer_diameters = '0.244475 0.272161 0.31115'
    conductivities = '100 0.7'
    formation_density = 2400
    formation_heat_capacity = 1000
    formation_temperature_function = grad_func
    formation_thermal_conductivity_function = conductivity_gradient
    convective_thermal_resistance = true
    nondimensional_time_function = Hasan_Kabir_2012
    output_properties = 'total_thermal_resistivity formation_thermal_conductivity'
    # outputs = exodus
    block = left_vertical_down
  [../]

  [./left_vertical_down_curve]
    type = MoskitoFluidWell_1p_MC
    pressure = p
    temperature = T
    flowrate = q
    molality = m
    well_direction = -z
    well_type = injection
    eos_uo = eos
    viscosity_uo = viscosity
    well_diameter = 0.244475
    roughness_type = rough
    roughness = 1e-04
    gravity = '0 0 -9.8'
    block = left_vertical_down_curve
    output_properties = 'molality specific_heat density viscosity'
    # outputs = exodus
  [../]
  [./lat-left_vertical_down_curve]
    type = MoskitoLatHeat_Inc_Formation_1p
    temperature_inner = T
    outer_diameters = '0.244475 0.272161 0.31115'
    conductivities = '100 0.7'
    formation_density = 2400
    formation_heat_capacity = 1000
    formation_temperature_function = grad_func
    formation_thermal_conductivity_function = conductivity_gradient
    convective_thermal_resistance = true
    nondimensional_time_function = Hasan_Kabir_2012
    output_properties = 'total_thermal_resistivity formation_thermal_conductivity'
    # outputs = exodus
    block = left_vertical_down_curve
  [../]

  [./horizontal]
     type = MoskitoFluidWell_1p_MC
     pressure = p
     temperature = T
     flowrate = q
     molality = m
     well_direction = x
     well_type = injection
     eos_uo = eos
     viscosity_uo = viscosity
     well_diameter = 0.212725
     roughness_type = rough
     roughness = 2e-04
     gravity = '0 0 0'
     block = horizontal
     output_properties = 'molality specific_heat density viscosity'
     #outputs = exodus
   [../]
   [./lat_horizontal]
     type = MoskitoLatHeat_Inc_Formation_1p
     temperature_inner = T
     outer_diameters = '0.212725 0.212726'
     conductivities = '3.000'
     formation_density = 2400
     formation_heat_capacity = 1000
     formation_temperature_function = grad_func
     formation_thermal_conductivity_function = conductivity_gradient
     convective_thermal_resistance = true
     nondimensional_time_function = Hasan_Kabir_2012
     output_properties = 'total_thermal_resistivity formation_thermal_conductivity'
     #outputs = exodus
     block = horizontal
   [../]

   [./right_vertical_up]
     type = MoskitoFluidWell_1p_MC
     pressure = p
     temperature = T
     flowrate = q
     molality = m
     well_direction = -z
     well_type = production
     eos_uo = eos
     viscosity_uo = viscosity
     well_diameter = 0.244475
     roughness_type = rough
     roughness = 1e-04
     gravity = '0 0 -9.8'
     block = right_vertical_up
     output_properties = 'molality specific_heat density viscosity'
     # outputs = exodus
   [../]
   [./lat_right_vertical_up]
     type = MoskitoLatHeat_Inc_Formation_1p
     temperature_inner = T
     outer_diameters = '0.244475 0.272161 0.346075 0.377825 0.473075 0.502412 0.5588'
     conductivities = '100 0.7 100 0.02 100 0.02'
     formation_density = 2400
     formation_heat_capacity = 1000
     formation_temperature_function = grad_func
     formation_thermal_conductivity_function = conductivity_gradient
     convective_thermal_resistance = true
     nondimensional_time_function = Hasan_Kabir_2012
     output_properties = 'total_thermal_resistivity formation_thermal_conductivity'
     # outputs = exodus
     block = right_vertical_up
   [../]
   [./right_vertical_bet]
     type = MoskitoFluidWell_1p_MC
     pressure = p
     temperature = T
     flowrate = q
     molality = m
     well_direction = -z
     well_type = production
     eos_uo = eos
     viscosity_uo = viscosity
     well_diameter = 0.244475
     roughness_type = rough
     roughness = 1e-04
     gravity = '0 0 -9.8'
     block = right_vertical_bet
     output_properties = 'molality specific_heat density viscosity'
     # outputs = exodus
   [../]
   [./lat_right_vertical_bet]
     type = MoskitoLatHeat_Inc_Formation_1p
     temperature_inner = T
     outer_diameters = '0.244475 0.272161 0.346075 0.377825 0.4318'
     conductivities = '100 0.7 100 0.02'
     formation_density = 2400
     formation_heat_capacity = 1000
     formation_temperature_function = grad_func
     formation_thermal_conductivity_function = conductivity_gradient
     convective_thermal_resistance = true
     nondimensional_time_function = Hasan_Kabir_2012
     output_properties = 'total_thermal_resistivity formation_thermal_conductivity'
     # outputs = exodus
     block = right_vertical_bet
   [../]
   [./right_vertical_down]
     type = MoskitoFluidWell_1p_MC
     pressure = p
     temperature = T
     flowrate = q
     molality = m
     well_direction = -z
     well_type = production
     eos_uo = eos
     viscosity_uo = viscosity
     well_diameter = 0.244475
     roughness_type = rough
     roughness = 1e-04
     gravity = '0 0 -9.8'
     block = right_vertical_down
     output_properties = 'molality specific_heat density viscosity'
     # outputs = exodus
   [../]
   [./lat_right_vertical_down]
     type = MoskitoLatHeat_Inc_Formation_1p
     temperature_inner = T
     outer_diameters = '0.244475 0.272161 0.31115'
     conductivities = '100 0.7'
     formation_density = 2400
     formation_heat_capacity = 1000
     formation_temperature_function = grad_func
     formation_thermal_conductivity_function = conductivity_gradient
     convective_thermal_resistance = true
     nondimensional_time_function = Hasan_Kabir_2012
     output_properties = 'total_thermal_resistivity formation_thermal_conductivity'
     # outputs = exodus
     block = right_vertical_down
   [../]

[]

[Functions]
  [./dts]
    type = PiecewiseLinear
    x = '0 7200  72000.0 943000  315360000 3153600000'
    y = '100 1000.0 1000.0 360000 3600000 3600000'
    # x = '0 7200  72000.0 943000'
    # y = '10 1000.0 1000.0 1000'
  [../]
  [./grad_func]
    type = ParsedFunction
    value ='283.15 - z * 0.03'
  [../]
  [./conductivity_gradient]
    type = ParsedFunction
    value = 'if(z>-2000, 2.0, 3.0)'
  [../]
[]

[BCs]
  [./mleft]
    type = DirichletBC
    variable = m
    boundary = inlet
    value = 0.25
  [../]
  [./pleft]
    type = DirichletBC
    variable = p
    boundary = inlet
    value = 100000
  [../]
  [./qleft]
    type = DirichletBC
    variable = q
    boundary = inlet
    value = 0.0025
  [../]
  [./tleft]
    type = DirichletBC
    variable = T
    boundary = inlet
    value = 283.15
  [../]
  # [./p-eleven]
  #   type = PostprocessorDirichletBC
  #   variable = p
  #   boundary = inlet_yaz
  #   postprocessor = pressure-eleven
  # [../]
  # [./t-eleven]
  #   type = PostprocessorDirichletBC
  #   variable = T
  #   boundary = inlet_yaz
  #   postprocessor = temperature-eleven
  # [../]
  # [./q-eleven]
  #   type = PostprocessorDirichletBC
  #   variable = q
  #   boundary = inlet_yaz
  #   postprocessor = flow-elevenn
  # [../]
  # [./m-eleven]
  #   type = PostprocessorDirichletBC
  #   variable = m
  #   boundary = inlet_yaz
  #   postprocessor = salinity-eleven
  # [../]
  # [./p-twelve]
  #   type = PostprocessorDirichletBC
  #   variable = p
  #   boundary = inlet_dav
  #   postprocessor = pressure-twelve
  # [../]
  # [./t-twelve]
  #   type = PostprocessorDirichletBC
  #   variable = T
  #   boundary = inlet_dav
  #   postprocessor = temperature-twelve
  # [../]
  # [./q-twelve]
  #   type = PostprocessorDirichletBC
  #   variable = q
  #   boundary = inlet_dav
  #   postprocessor = flow-twelvee
  # [../]
  # [./m-twelve]
  #   type = PostprocessorDirichletBC
  #   variable = m
  #   boundary = inlet_dav
  #   postprocessor = salinity-twelve
  # [../]
  [./p-two]
    type = PostprocessorDirichletBC
    variable = p
    boundary = inlet_do
    postprocessor = pressure-two
  [../]
  [./t-two]
    type = PostprocessorDirichletBC
    variable = T
    boundary = inlet_do
    postprocessor = temperature-two
  [../]
  [./q-two]
    type = PostprocessorDirichletBC
    variable = q
    boundary = inlet_do
    postprocessor = flow-twoo
  [../]
  [./m-two]
    type = PostprocessorDirichletBC
    variable = m
    boundary = inlet_do
    postprocessor = salinity-two
  [../]
  # [./p-three]
  #   type = PostprocessorDirichletBC
  #   variable = p
  #   boundary = inlet_se
  #   postprocessor = pressure-three
  # [../]
  # [./t-three]
  #   type = PostprocessorDirichletBC
  #   variable = T
  #   boundary = inlet_se
  #   postprocessor = temperature-three
  # [../]
  # [./q-three]
  #   type = PostprocessorDirichletBC
  #   variable = q
  #   boundary = inlet_se
  #   postprocessor = flow-threee
  # [../]
  # [./m-three]
  #   type = PostprocessorDirichletBC
  #   variable = m
  #   boundary = inlet_se
  #   postprocessor = salinity-three
  # [../]
  # [./p-four]
  #   type = PostprocessorDirichletBC
  #   variable = p
  #   boundary = inlet_ch
  #   postprocessor = pressure-four
  # [../]
  # [./t-four]
  #   type = PostprocessorDirichletBC
  #   variable = T
  #   boundary = inlet_ch
  #   postprocessor = temperature-four
  # [../]
  # [./q-four]
  #   type = PostprocessorDirichletBC
  #   variable = q
  #   boundary = inlet_ch
  #   postprocessor = flow-fourr
  # [../]
  # [./m-four]
  #   type = PostprocessorDirichletBC
  #   variable = m
  #   boundary = inlet_ch
  #   postprocessor = salinity-four
  # [../]
  # [./p-five]
  #   type = PostprocessorDirichletBC
  #   variable = p
  #   boundary = inlet_pa
  #   postprocessor = pressure-five
  # [../]
  # [./t-five]
  #   type = PostprocessorDirichletBC
  #   variable = T
  #   boundary = inlet_pa
  #   postprocessor = temperature-five
  # [../]
  # [./q-five]
  #   type = PostprocessorDirichletBC
  #   variable = q
  #   boundary = inlet_pa
  #   postprocessor = flow-fivee
  # [../]
  # [./m-five]
  #   type = PostprocessorDirichletBC
  #   variable = m
  #   boundary = inlet_pa
  #   postprocessor = salinity-five
  # [../]
  # [./p-six]
  #   type = PostprocessorDirichletBC
  #   variable = p
  #   boundary = inlet_shi
  #   postprocessor = pressure-six
  # [../]
  # [./t-six]
  #   type = PostprocessorDirichletBC
  #   variable = T
  #   boundary = inlet_shi
  #   postprocessor = temperature-six
  # [../]
  # [./q-six]
  #   type = PostprocessorDirichletBC
  #   variable = q
  #   boundary = inlet_shi
  #   postprocessor = flow-sixx
  # [../]
  # [./m-six]
  #   type = PostprocessorDirichletBC
  #   variable = m
  #   boundary = inlet_shi
  #   postprocessor = salinity-six
  # [../]
  # [./p-seven]
  #   type = PostprocessorDirichletBC
  #   variable = p
  #   boundary = inlet_haf
  #   postprocessor = pressure-seven
  # [../]
  # [./t-seven]
  #   type = PostprocessorDirichletBC
  #   variable = T
  #   boundary = inlet_haf
  #   postprocessor = temperature-seven
  # [../]
  # [./q-seven]
  #   type = PostprocessorDirichletBC
  #   variable = q
  #   boundary = inlet_haf
  #   postprocessor = flow-sevenn
  # [../]
  # [./m-seven]
  #   type = PostprocessorDirichletBC
  #   variable = m
  #   boundary = inlet_haf
  #   postprocessor = salinity-seven
  # [../]
  # [./p-eight]
  #   type = PostprocessorDirichletBC
  #   variable = p
  #   boundary = inlet_hash
  #   postprocessor = pressure-eight
  # [../]
  # [./t-eight]
  #   type = PostprocessorDirichletBC
  #   variable = T
  #   boundary = inlet_hash
  #   postprocessor = temperature-eight
  # [../]
  # [./q-eight]
  #   type = PostprocessorDirichletBC
  #   variable = q
  #   boundary = inlet_hash
  #   postprocessor = flow-eightt
  # [../]
  # [./m-eight]
  #   type = PostprocessorDirichletBC
  #   variable = m
  #   boundary = inlet_hash
  #   postprocessor = salinity-eight
  # [../]
[]

[Variables]
  [./m]
    initial_condition = 0.5
  [../]
  [./T]
    [./InitialCondition]
      type = FunctionIC
      function = '283.15 - z * 0.03'
      variable = T
    [../]
  [../]
  [./p]
    [./InitialCondition]
      type = FunctionIC
      function = '-10000 * z + 100000'
      variable = p
    [../]
  [../]
  [./q]
    initial_condition = 0.001
  [../]
[]

[Kernels]
  [./Tkernel]
    type = MoskitoEnergy_1p1c
    variable = T
    flowrate = q
    pressure = p
    molality = m
    block = 'left_vertical_up left_vertical_bet left_vertical_down left_vertical_down_curve horizontal right_vertical_up right_vertical_bet right_vertical_down'
    gravity_energy = false
  [../]
  [./Ttkernel]
    type = MoskitoTimeEnergy_1p1c
    variable = T
    flowrate = q
    pressure = p
    molality = m
    block = 'left_vertical_up left_vertical_bet left_vertical_down left_vertical_down_curve horizontal right_vertical_up right_vertical_bet right_vertical_down'
  [../]
  [./pkernel]
    type = MoskitoMass_1p1c
    variable = p
    flowrate = q
    temperature = T
    molality = m
    block = 'left_vertical_up left_vertical_bet left_vertical_down left_vertical_down_curve horizontal right_vertical_up right_vertical_bet right_vertical_down'
  [../]
  [./ptkernel]
    type = MoskitoTimeMass_1p1c
    variable = p
    temperature = T
    molality = m
    block = 'left_vertical_up left_vertical_bet left_vertical_down left_vertical_down_curve horizontal right_vertical_up right_vertical_bet right_vertical_down'
  [../]
  [./qkernel]
    type = MoskitoMomentum_1p1c
    variable = q
    pressure = p
    temperature = T
    molality = m
    block = 'left_vertical_up left_vertical_bet left_vertical_down left_vertical_down_curve horizontal right_vertical_up right_vertical_bet right_vertical_down'
  [../]
  [./qtkernel]
    type = MoskitoTimeMomentum_1p1c
    variable = q
    pressure = p
    temperature = T
    molality = m
    block = 'left_vertical_up left_vertical_bet left_vertical_down left_vertical_down_curve horizontal right_vertical_up right_vertical_bet right_vertical_down'
  [../]
  [./heat]
    type = MoskitoLatHeatIncFormation_1p
    variable = T
    block = 'left_vertical_up left_vertical_bet left_vertical_down left_vertical_down_curve horizontal right_vertical_up right_vertical_bet right_vertical_down'
  [../]
[./transport]
  type = MoskitoTransport_1p2c
  variable = m
  flowrate = q
  pressure = p
  temperature = T
  block = 'left_vertical_up left_vertical_bet left_vertical_down left_vertical_down_curve horizontal right_vertical_up right_vertical_bet right_vertical_down'
[../]
[./t_transport]
  type = MoskitoTimeTransport_1p2c
  variable = m
  pressure = p
  temperature = T
  block = 'left_vertical_up left_vertical_bet left_vertical_down left_vertical_down_curve horizontal right_vertical_up right_vertical_bet right_vertical_down'
[../]
[]

[AuxVariables]
  [./HeatFlux]
      # order = FIRST
      family = MONOMIAL
      initial_condition = 0.0
  [../]
  [./density1]
      # order = FIRST
      family = MONOMIAL
      initial_condition = 0.0
  [../]
  [./p1]
      # order = FIRST
      family = MONOMIAL
      initial_condition = 0.0
  [../]
  [./p2]
      # order = FIRST
      family = MONOMIAL
      initial_condition = 0.0
  [../]
  [./p3]
      # order = FIRST
      family = MONOMIAL
      initial_condition = 0.0
  [../]
  [./p11]
      # order = FIRST
      family = MONOMIAL
      initial_condition = 0.0
  [../]
  [./p22]
      # order = FIRST
      family = MONOMIAL
      initial_condition = 0.0
  [../]
  [./p33]
      # order = FIRST
      family = MONOMIAL
      initial_condition = 0.0
  [../]
  [./average_system_temperature_t]
      # order = FIRST
      family = MONOMIAL
      initial_condition = 0.0
  [../]
  [./average_max_temperature_t]
      # order = FIRST
      family = MONOMIAL
      initial_condition = 0.0
  [../]
  [./average_outlet_temperature_t]
      # order = FIRST
      family = MONOMIAL
      initial_condition = 0.0
  [../]
  [./average_system_temperature]
      # order = FIRST
      family = MONOMIAL
      initial_condition = 0.0
  [../]
  [./average_max_temperature]
      # order = FIRST
      family = MONOMIAL
      initial_condition = 0.0
  [../]
  [./average_outlet_temperature]
      # order = FIRST
      family = MONOMIAL
      initial_condition = 0.0
  [../]
[]

[AuxKernels]
  [./Flux]
    type = MoskitoHeatExchange
    temperature = T
    variable = HeatFlux
    HeatFlux = HeatFlux
  [../]
  [./density1]
    type = MaterialRealAux
    property = density
    variable = density1
  [../]
  [./pleft]
    type = Moskitoleftpower
    variable = p1
    p1 = p1
    den_1 = den_1
    den_2 = den_2
    q_1 = q_1
    t_1 = t_1
    t_2 = t_2
  [../]
  [./phor]
    type = Moskitohorpower
    variable = p2
    p2 = p2
    den_2 = den_2
    den_3 = den_3
    q_1 = q_1
    t_2 = t_2
    t_3 = t_3
  [../]
  [./ptotal]
    type = Moskitorightpower
    variable = p3
    p3 = p3
    den_1 = den_1
    den_4 = den_4
    q_1 = q_1
    t_1 = t_1
    t_4 = t_4
  [../]
  [./p111]
    type = powergenerator
    variable = p11
    cumulative_energy = p1
  [../]
  [./p222]
    type = powergenerator
    variable = p22
    cumulative_energy = p2
  [../]
  [./p333]
    type = powergenerator
    variable = p33
    cumulative_energy = p3
  [../]
  [./ast_t]
    type = avgenerator
    variable = average_system_temperature_t
    pp = an
  [../]
  [./amt_t]
    type = avgenerator
    variable = average_max_temperature_t
    pp = nm
  [../]
  [./aot_t]
    type = avgenerator
    variable = average_outlet_temperature_t
    pp = t_4
  [../]
  [./ast]
    type = meancalculator
    variable = average_system_temperature
    pp_var = average_system_temperature_t
  [../]
  [./amt]
    type = meancalculator
    variable = average_max_temperature
    pp_var = average_max_temperature_t
  [../]
  [./aot]
    type = meancalculator
    variable = average_outlet_temperature
    pp_var = average_outlet_temperature_t
  [../]
[]

[Postprocessors]
  [./pressure-two]
    type = PointValue
    point = '0 -7 -4000'
    variable = p
  [../]
  [./temperature-two]
    type = PointValue
    point = '0 -7 -4000'
    variable = T
  [../]
  [./flow-two]
    type = PointValue
    point = '0 -7 -4000'
    variable = q
  [../]
  [./salinity-two]
    type = PointValue
    point = '0 -7 -4000'
    variable = m
  [../]
  [./flow-twoo]
    type = LinearCombinationPostprocessor
    pp_names = flow-two
    pp_coefs = 2.0
  [../]

  # [./pressure-twelve]
  #   type = PointValue
  #   point = '0 -407 -3600'
  #   variable = p
  # [../]
  # [./temperature-twelve]
  #   type = PointValue
  #   point = '0 -407 -3600'
  #   variable = T
  # [../]
  # [./flow-twelve]
  #   type = PointValue
  #   point = '0 -407 -3600'
  #   variable = q
  # [../]
  # [./salinity-twelve]
  #   type = PointValue
  #   point = '0 -407 -3600'
  #   variable = m
  # [../]
  # [./flow-twelvee]
  #   type = LinearCombinationPostprocessor
  #   pp_names = flow-twelve
  #   pp_coefs = 2.0
  # [../]

  # [./pressure-eleven]
  #   type = PointValue
  #   point = '0 -607 -3400'
  #   variable = p
  # [../]
  # [./temperature-eleven]
  #   type = PointValue
  #   point = '0 -607 -3400'
  #   variable = T
  # [../]
  # [./flow-eleven]
  #   type = PointValue
  #   point = '0 -607 -3400'
  #   variable = q
  # [../]
  # [./salinity-eleven]
  #   type = PointValue
  #   point = '0 -607 -3400'
  #   variable = m
  # [../]
  # [./flow-elevenn]
  #   type = LinearCombinationPostprocessor
  #   pp_names = flow-eleven
  #   pp_coefs = 2.0
  # [../]

  # [./pressure-three]
  #   type = PointValue
  #   point = '100 0 -4100'
  #   variable = p
  # [../]
  # [./temperature-three]
  #   type = PointValue
  #   point = '100 0 -4100'
  #   variable = T
  # [../]
  # [./flow-three]
  #   type = PointValue
  #   point = '100 0 -4100'
  #   variable = q
  # [../]
  # [./salinity-three]
  #   type = PointValue
  #   point = '100 0 -4100'
  #   variable = m
  # [../]
  # [./flow-threee]
  #   type = LinearCombinationPostprocessor
  #   pp_names = flow-three
  #   pp_coefs = 0.5
  # [../]

  # [./pressure-four]
  #   type = PointValue
  #   point = '500 -400 -4100'
  #   variable = p
  # [../]
  # [./temperature-four]
  #   type = PointValue
  #   point = '500 -400 -4100'
  #   variable = T
  # [../]
  # [./flow-four]
  #   type = PointValue
  #   point = '500 -400 -4100'
  #   variable = q
  # [../]
  # [./salinity-four]
  #   type = PointValue
  #   point = '500 -400 -4100'
  #   variable = m
  # [../]
  # [./flow-fourr]
  #   type = LinearCombinationPostprocessor
  #   pp_names = flow-four
  #   pp_coefs = 0.5
  # [../]

  # [./pressure-five]
  #   type = PointValue
  #   point = '700 -600 -4100'
  #   variable = p
  # [../]
  # [./temperature-five]
  #   type = PointValue
  #   point = '700 -600 -4100'
  #   variable = T
  # [../]
  # [./flow-five]
  #   type = PointValue
  #   point = '700 -600 -4100'
  #   variable = q
  # [../]
  # [./salinity-five]
  #   type = PointValue
  #   point = '700 -600 -4100'
  #   variable = m
  # [../]
  # [./flow-fivee]
  #   type = LinearCombinationPostprocessor
  #   pp_names = flow-five
  #   pp_coefs = 0.5
  # [../]
  #
  # [./pressure-six]
  #   type = PointValue
  #   point = '3293 -600 -4100'
  #   variable = p
  # [../]
  # [./temperature-six]
  #   type = PointValue
  #   point = '3293 -600 -4100'
  #   variable = T
  # [../]
  # [./flow-six]
  #   type = PointValue
  #   point = '3293 -600 -4100'
  #   variable = q
  # [../]
  # [./salinity-six]
  #   type = PointValue
  #   point = '3293 -600 -4100'
  #   variable = m
  # [../]
  # [./flow-sixx]
  #   type = LinearCombinationPostprocessor
  #   pp_names = flow-six
  #   pp_coefs = 2.0
  # [../]

  # [./pressure-seven]
  #   type = PointValue
  #   point = '3493 -400 -4100'
  #   variable = p
  # [../]
  # [./temperature-seven]
  #   type = PointValue
  #   point = '3493 -400 -4100'
  #   variable = T
  # [../]
  # [./flow-seven]
  #   type = PointValue
  #   point = '3493 -400 -4100'
  #   variable = q
  # [../]
  # [./salinity-seven]
  #   type = PointValue
  #   point = '3493 -400 -4100'
  #   variable = m
  # [../]
  # [./flow-sevenn]
  #   type = LinearCombinationPostprocessor
  #   pp_names = flow-seven
  #   pp_coefs = 2.0
  # [../]

  # [./pressure-eight]
  #   type = PointValue
  #   point = '3893 0 -4100'
  #   variable = p
  # [../]
  # [./temperature-eight]
  #   type = PointValue
  #   point = '3893 0 -4100'
  #   variable = T
  # [../]
  # [./flow-eight]
  #   type = PointValue
  #   point = '3893 0 -4100'
  #   variable = q
  # [../]
  # [./salinity-eight]
  #   type = PointValue
  #   point = '3893 0 -4100'
  #   variable = m
  # [../]
  # [./flow-eightt]
  #   type = LinearCombinationPostprocessor
  #   pp_names = flow-eight
  #   pp_coefs = 2.0
  # [../]

  [./pi]
    type = PointValue
    point = '4000 0 -4000'
    variable = p11
  [../]

  [./ph]
    type = PointValue
    point = '4000 0 -4000'
    variable = p22
  [../]

  [./pt]
    type = PointValue
    point = '4000 0 -4000'
    variable = p33
  [../]


  [./t_1]
    type = PointValue
    point = '0 -400 0'
    variable = T
  [../]
  [./q_1]
    type = PointValue
    point = '4000 0 0'
    variable = q
  [../]
  [./den_1]
    type = PointValue
    point = '0 -400 0'
    variable = density1
  [../]
  [./t_2]
    type = PointValue
    point = '0 0 -4000'
    variable = T
  [../]
  [./den_2]
    type = PointValue
    point = '0 0 -4000'
    variable = density1
  [../]
  [./t_3]
    type = PointValue
    point = '4000 0 -4000'
    variable = T
  [../]
  [./den_3]
    type = PointValue
    point = '4000 0 -4000'
    variable = density1
  [../]
  [./t_4]
    type = PointValue
    point = '4000 0 0'
    variable = T
  [../]
  [./den_4]
    type = PointValue
    point = '4000 0 0'
    variable = density1
  [../]

  [./an]
    type = AverageNodalVariableValue
     variable = T
  [../]

  [./ne]
    type = NodalExtremeValue
    variable = T
  [../]

  [./nm]
    type = NodalMaxValue
     variable = T
  [../]

  [./te]
    type = TimeExtremeValue
     postprocessor = t_4
  [../]

  [./amtt]
    type = PointValue
    point = '4000 0 -4000'
    variable = average_max_temperature
  [../]

  [./aott]
    type = PointValue
    point = '4000 0 -4000'
    variable = average_outlet_temperature
  [../]

  [./astt]
    type = PointValue
    point = '4000 0 -4000'
    variable = average_system_temperature
  [../]

  # [./den_4]
  #   type =  AverageNodalVariableValue
  #   type =  AxisymmetricCenterlineAverageValue
  #   type =  ChangeOverTimePostprocessor
  #   type =  ElementAverageValue
  #   type =  ElementExtremeValue
  #   type =  GreaterThanLessThanPostprocessor
  #   type =  NodalExtremeValue
  #   type =  NodalMaxValue
  #   type =  NodalSum
  #   type =  NumNodes
  #   type =  NodalVariableValue
  #   type =  PercentChangePostprocessor
  #   type =  Residual
  #   type =  TimeExtremeValue
  #   type =  TotalVariableValue
  #   type =  VariableResidual
  #   point = '4000 0 0'
  #   variable = density1
  # [../]
[]

[Preconditioning]
  active = pn1
  [./p1]
    type = SMP
    full = true
    petsc_options_iname = '-pc_type -sub_pc_type -sub_pc_factor_shift_type'
    petsc_options_value = ' bjacobi  ilu          NONZERO                 '
  [../]
  [./pn1]
    type = SMP
    full = true
    petsc_options_iname = '-pc_type -sub_pc_type -sub_pc_factor_shift_type -snes_type -snes_linesearch_type'
    petsc_options_value = ' bjacobi  ilu          NONZERO                   newtonls   basic               '
  [../]
[]

[Executioner]
  type = Transient
  start_time = 0
  end_time = 3153600000
  l_max_its = 100
  solve_type = NEWTON
  nl_rel_tol = 1e-06
  # nl_abs_tol = 1e5
  [./TimeStepper]
    type = FunctionDT
    function = dts
  [../]
[]

[Outputs]
  # exodus = true
  csv = true
  print_linear_residuals = false
   # show = p1
[]
