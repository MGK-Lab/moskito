CDF      
      
len_string     !   len_line   Q   four      	time_step          len_name   !   num_dim       	num_nodes      3   num_elem   2   
num_el_blk        num_node_sets         num_side_sets         num_el_in_blk1     2   num_nod_per_el1       num_side_ss1      num_side_ss2      num_nod_ns1       num_nod_ns2       num_nod_var       num_info  �         api_version       @�
=   version       @�
=   floating_point_word_size            	file_size               int64_status             title         example_EnergyKernel_out.e     maximum_name_length                    
time_whole                            �8   	eb_status                                eb_prop1               name      ID                 	ns_status         	                       ns_prop1      	         name      ID                 	ss_status         
                        ss_prop1      
         name      ID              (   coordx                     �      0   coordy                     �      	�   coordz                     �      `   eb_names                       $      �   ns_names      	                 D         ss_names      
                 D      `   
coor_names                         d      �   node_num_map                    �         connect1                  	elem_type         EDGE2        �      �   elem_num_map                    �      d   elem_ss1                          ,   side_ss1                          0   elem_ss2                          4   side_ss2                          8   node_ns1                          <   node_ns2                          @   vals_nod_var1                         �      �@   vals_nod_var2                         �      ��   vals_nod_var3                         �      �p   name_nod_var                       d      D   info_records                      ~�      �                                         @       @      @      @       @$      @(      @,     @0      @2      @4      @6      @8      @:      @<     @>      @@      @A      @B      @C      @D      @E      @F      @G      @H      @I      @J      @K      @L     @L������@N      @O      @P      @P�     @Q      @Q�     @R      @R�     @S      @S�     @T      @T�     @U      @U�     @V      @V�     @W      @W�     @X      @X�     @Y                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          left                             right                              right                            left                                                                                                                                                              	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3                                                	   	   
   
                                                                                                                                         !   !   "   "   #   #   $   $   %   %   &   &   '   '   (   (   )   )   *   *   +   +   ,   ,   -   -   .   .   /   /   0   0   1   1   2   2   3                           	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   2               3T                                p                                q                                 ####################@r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�  # Created by MOOSE #r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�   ####################�     @r�     @r�     @r�     @r�     @r�     @r�     @r�    ### Command Line Arguments ###   @r�     @r�     @r�     @r�     @r�     @r�      moskito-opt -i test/1_phase/example_EnergyKernel.i### Version Info ### A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.Framework Information:A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.�MOOSE Version:           git commit 3d958a9 on 2019-08-28    A.��    A.��    A.��LibMesh Version:         da98c0178b4d03f222d6b02c1a701eea8a38af5e   A.��    A.�� PETSc Version:           3.10.5G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�Current Time:            Thu Mar 12 14:14:26 2020{?�z�G�{?�z�G�{?�z�G�{?�z�G�Executable Timestamp:    Thu Mar 12 11:25:04 2020?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�### Input File ###G�{?�z�G�{                                                                                                                                    []                                                                                 inactive                       = (no_default)                                    initial_from_file_timestep     = LATEST                                          initial_from_file_var          = INVALID                                         element_order                  = AUTO                                            order                          = AUTO                                            side_order                     = AUTO                                            type                           = GAUSS                                         []                                                                                                                                                                [BCs]                                                                                                                                                               [./hbc_top]                                                                        boundary                     = left                                              control_tags                 = INVALID                                           displacements                = INVALID                                           enable                       = 1                                                 extra_matrix_tags            = INVALID                                           extra_vector_tags            = INVALID                                           implicit                     = 1                                                 inactive                     = (no_default)                                      isObjectAction               = 1                                                 matrix_tags                  = system                                            type                         = DirichletBC                                       use_displaced_mesh           = 0                                                 variable                     = T                                                 vector_tags                  = nontime                                           diag_save_in                 = INVALID                                           save_in                      = INVALID                                           seed                         = 0                                                 value                        = 300                                             [../]                                                                          []                                                                                                                                                                [Executioner]                                                                      auto_preconditioning           = 1                                               inactive                       = (no_default)                                    isObjectAction                 = 1                                               type                           = Steady                                          accept_on_max_picard_iteration = 0                                               automatic_scaling              = INVALID                                         compute_initial_residual_before_preset_bcs = 0                                   compute_scaling_once           = 1                                               contact_line_search_allowed_lambda_cuts = 2                                      contact_line_search_ltol       = INVALID                                         control_tags                   = (no_default)                                    disable_picard_residual_norm_check = 0                                           enable                         = 1                                               l_abs_step_tol                 = -1                                              l_abs_tol                      = 1e-50                                           l_max_its                      = 50                                              l_tol                          = 1e-08                                           line_search                    = default                                         line_search_package            = petsc                                           max_xfem_update                = 4294967295                                      mffd_type                      = wp                                              nl_abs_step_tol                = 1e-50                                           nl_abs_tol                     = 1e-50                                           nl_max_funcs                   = 10000                                           nl_max_its                     = 50                                              nl_rel_step_tol                = 1e-50                                           nl_rel_tol                     = 1e-08                                           petsc_options                  = INVALID                                         petsc_options_iname            = INVALID                                         petsc_options_value            = INVALID                                         picard_abs_tol                 = 1e-50                                           picard_force_norms             = 0                                               picard_max_its                 = 1                                               picard_rel_tol                 = 1e-08                                           relaxation_factor              = 1                                               relaxed_variables              = (no_default)                                    restart_file_base              = (no_default)                                    skip_exception_check           = 0                                               snesmf_reuse_base              = 1                                               solve_type                     = NEWTON                                          splitting                      = INVALID                                         time                           = 0                                               update_xfem_at_timestep_begin  = 0                                               verbose                        = 0                                             []                                                                                                                                                                [Kernels]                                                                                                                                                           [./hkernel]                                                                        inactive                     = (no_default)                                      isObjectAction               = 1                                                 type                         = MoskitoEnergy_1p1c                                block                        = INVALID                                           control_tags                 = Kernels                                           diag_save_in                 = INVALID                                           displacements                = INVALID                                           enable                       = 1                                                 extra_matrix_tags            = INVALID                                           extra_vector_tags            = INVALID                                           flowrate                     = q                                                 implicit                     = 1                                                 matrix_tags                  = system                                            pressure                     = p                                                 save_in                      = INVALID                                           seed                         = 0                                                 use_displaced_mesh           = 0                                                 variable                     = T                                                 vector_tags                  = nontime                                         [../]                                                                                                                                                             [./pkernel1]                                                                       inactive                     = (no_default)                                      isObjectAction               = 1                                                 type                         = NullKernel                                        block                        = INVALID                                           control_tags                 = Kernels                                           diag_save_in                 = INVALID                                           displacements                = INVALID                                           enable                       = 1                                                 extra_matrix_tags            = INVALID                                           extra_vector_tags            = INVALID                                           implicit                     = 1                                                 jacobian_fill                = 1e-09                                             matrix_tags                  = system                                            save_in                      = INVALID                                           seed                         = 0                                                 use_displaced_mesh           = 0                                                 variable                     = p                                                 vector_tags                  = nontime                                         [../]                                                                                                                                                             [./qkernel1]                                                                       inactive                     = (no_default)                                      isObjectAction               = 1                                                 type                         = NullKernel                                        block                        = INVALID                                           control_tags                 = Kernels                                           diag_save_in                 = INVALID                                           displacements                = INVALID                                           enable                       = 1                                                 extra_matrix_tags            = INVALID                                           extra_vector_tags            = INVALID                                           implicit                     = 1                                                 jacobian_fill                = 1e-09                                             matrix_tags                  = system                                            save_in                      = INVALID                                           seed                         = 0                                                 use_displaced_mesh           = 0                                                 variable                     = q                                                 vector_tags                  = nontime                                         [../]                                                                          []                                                                                                                                                                [Materials]                                                                                                                                                         [./area0]                                                                          inactive                     = (no_default)                                      isObjectAction               = 1                                                 type                         = MoskitoFluidWell1P                                block                        = INVALID                                           boundary                     = INVALID                                           casing_thermal_conductivity  = 0                                                 casing_thickness             = 0                                                 compute                      = 1                                                 constant_on                  = NONE                                              control_tags                 = Materials                                         enable                       = 1                                                 eos_uo                       = eos                                               flowrate                     = q                                                 gravity                      = '(x,y,z)=(      10,        0,        0)'          implicit                     = 1                                                 manual_cross_section_area    = 0                                                 manual_friction_factor       = 0                                                 manual_wetted_perimeter      = 0                                                 output_properties            = INVALID                                           outputs                      = none                                              pressure                     = p                                                 roughness                    = 2.5e-05                                           roughness_type               = smooth                                            seed                         = 0                                                 temperature                  = T                                                 use_displaced_mesh           = 0                                                 viscosity_uo                 = viscosity                                         well_diameter                = 0.0890016                                         well_direction               = x                                                 well_type                    = production                                      [../]                                                                          []                                                                                                                                                                [Mesh]                                                                             displacements                  = INVALID                                         inactive                       = (no_default)                                    use_displaced_mesh             = 1                                               include_local_in_ghosting      = 0                                               output_ghosting                = 0                                               block_id                       = INVALID                                         block_name                     = INVALID                                         boundary_id                    = INVALID                                         boundary_name                  = INVALID                                         construct_side_list_from_node_list = 0                                           ghosted_boundaries             = INVALID                                         ghosted_boundaries_inflation   = INVALID                                         isObjectAction                 = 1                                               second_order                   = 0                                               skip_partitioning              = 0                                               type                           = GeneratedMesh                                   uniform_refine                 = 0                                               allow_renumbering              = 1                                               bias_x                         = 1                                               bias_y                         = 1                                               bias_z                         = 1                                               centroid_partitioner_direction = INVALID                                         construct_node_list_from_side_list = 1                                           control_tags                   = (no_default)                                    dim                            = 1                                               elem_type                      = INVALID                                         enable                         = 1                                               gauss_lobatto_grid             = 0                                               ghosting_patch_size            = INVALID                                         max_leaf_size                  = 10                                              nemesis                        = 0                                               nx                             = 50                                              ny                             = 1                                               nz                             = 1                                               parallel_type                  = DEFAULT                                         partitioner                    = default                                         patch_size                     = 40                                              patch_update_strategy          = never                                           xmax                           = 100                                             xmin                           = 0                                               ymax                           = 1                                               ymin                           = 0                                               zmax                           = 1                                               zmin                           = 0                                             []                                                                                                                                                                [Mesh]                                                                           []                                                                                                                                                                [Mesh]                                                                           []                                                                                                                                                                [Outputs]                                                                          append_date                    = 0                                               append_date_format             = INVALID                                         checkpoint                     = 0                                               color                          = 1                                               console                        = 1                                               controls                       = 0                                               csv                            = 0                                               dofmap                         = 0                                               execute_on                     = 'INITIAL TIMESTEP_END'                          exodus                         = 1                                               file_base                      = INVALID                                         gmv                            = 0                                               gnuplot                        = 0                                               hide                           = INVALID                                         inactive                       = (no_default)                                    interval                       = 1                                               nemesis                        = 0                                               output_if_base_contains        = INVALID                                         perf_graph                     = 0                                               print_linear_residuals         = 1                                               print_mesh_changed_info        = 0                                               print_perf_log                 = 0                                               show                           = INVALID                                         solution_history               = 0                                               sync_times                     = (no_default)                                    tecplot                        = 0                                               vtk                            = 0                                               xda                            = 0                                               xdr                            = 0                                             []                                                                                                                                                                [Preconditioning]                                                                                                                                                   [./pn1]                                                                            inactive                     = (no_default)                                      isObjectAction               = 1                                                 type                         = SMP                                               control_tags                 = Preconditioning                                   coupled_groups               = INVALID                                           enable                       = 1                                                 full                         = 1                                                 ksp_norm                     = unpreconditioned                                  mffd_type                    = wp                                                off_diag_column              = INVALID                                           off_diag_row                 = INVALID                                           pc_side                      = default                                           petsc_options                = INVALID                                           petsc_options_iname          = '-pc_type -sub_pc_type -sub_pc_factor_shif... t_type -snes_type -snes_linesearch_type'                                             petsc_options_value          = 'bjacobi ilu NONZERO newtonls basic'              solve_type                   = INVALID                                         [../]                                                                          []                                                                                                                                                                [UserObjects]                                                                                                                                                       [./eos]                                                                            inactive                     = (no_default)                                      isObjectAction               = 1                                                 type                         = MoskitoEOS1P_IdealFluid                           allow_duplicate_execution_on_initial = 0                                         bulk_modulus                 = 2.15e+09                                          control_tags                 = UserObjects                                       enable                       = 1                                                 execute_on                   = TIMESTEP_END                                      force_preaux                 = 0                                                 reference_density            = 998.29                                            reference_enthalpy           = 83950                                             reference_pressure           = 101325                                            reference_temperature        = 293.15                                            specific_heat                = 4200                                              thermal_conductivity         = 0.6                                               thermal_expansion_0          = 0.0004                                            thermal_expansion_1          = 0                                                 use_displaced_mesh           = 0                                               [../]                                                                                                                                                             [./viscosity]                                                                      inactive                     = (no_default)                                      isObjectAction               = 1                                                 type                         = MoskitoViscosityWaterSmith                        allow_duplicate_execution_on_initial = 0                                         control_tags                 = UserObjects                                       enable                       = 1                                                 execute_on                   = TIMESTEP_END                                      force_preaux                 = 0                                                 use_displaced_mesh           = 0                                               [../]                                                                          []                                                                                                                                                                [Variables]                                                                                                                                                         [./T]                                                                              family                       = LAGRANGE                                          inactive                     = (no_default)                                      isObjectAction               = 1                                                 order                        = FIRST                                             scaling                      = INVALID                                           type                         = MooseVariableBase                                 initial_from_file_timestep   = LATEST                                            initial_from_file_var        = INVALID                                           block                        = INVALID                                           components                   = 1                                                 control_tags                 = Variables                                         eigen                        = 0                                                 enable                       = 1                                                 initial_condition            = 300                                               outputs                      = INVALID                                         [../]                                                                                                                                                             [./p]                                                                              family                       = LAGRANGE                                          inactive                     = (no_default)                                      isObjectAction               = 1                                                 order                        = FIRST                                             scaling                      = INVALID                                           type                         = MooseVariableBase                                 initial_from_file_timestep   = LATEST                                            initial_from_file_var        = INVALID                                           block                        = INVALID                                           components                   = 1                                                 control_tags                 = Variables                                         eigen                        = 0                                                 enable                       = 1                                                 initial_condition            = 1e+06                                             outputs                      = INVALID                                         [../]                                                                                                                                                             [./q]                                                                              family                       = LAGRANGE                                          inactive                     = (no_default)                                      isObjectAction               = 1                                                 order                        = FIRST                                             scaling                      = INVALID                                           type                         = MooseVariableBase                                 initial_from_file_timestep   = LATEST                                            initial_from_file_var        = INVALID                                           block                        = INVALID                                           components                   = 1                                                 control_tags                 = Variables                                         eigen                        = 0                                                 enable                       = 1                                                 initial_condition            = 0.01                                              outputs                      = INVALID                                         [../]                                                                          []                                                                                       @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    ?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�      @r�     @r��H�8?@r�ؑ5��@r����
�@r��"u��@r��k�x@r�����Q@r�u�g�e@r�bE��@r�N���~@r�:�q��@r�'#�@r�g٥L@r����@r���K�0@r��B8�@r�Ċ� $@r��Ӊt�@r��ND!@r��e�y@r�u�ޗ@r�a���@r�N?x�@r�:�I�d@r�&�i�@r����@r��b���@r�뫦�@r���x�@r��=d'@r���G@r���+�@r���p@r�u`�r�@r�a��}�@r�M��5s@r�:;�G�@r�&���@r�Ͷ 0@r�����@r��_��@r�ר��u@r�����@r��:���@r����?@r��̺��@r�u��@r�a^��\@r�M��7b@r�9��"@r�&:
g�A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    A.��    ?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{?�z�G�{