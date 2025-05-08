########################################

# Define Input Parameters for the Markov Model

input <- data.frame(
  # Transition Probabilities (from diagram and table)
  p_R_R  = 0.79032,  # R -> R
  p_R_M  = 0.124,   # R -> M
  p_R_S  =  0.085,   # R -> S
  p_R_OD  = 0.00068,  # R -> OD
  p_R_D  = 0,   # R -> D
  
  p_M_M  = 0.7706,  # M -> M
  p_M_R  = 0.1033,   # M -> R
  p_M_OD  = 0.0011,  # M -> OD
  p_M_S  = 0.125,   # M -> S
  p_M_D = 0,  # M -> D
  
  p_S_S = 0.8223,  # S -> S
  p_S_M = 0.103,  # S -> M
  p_S_R = 0.053,   # S -> R
  p_S_OD = 0.0217,  # S -> OD
  p_S_D = 0,  # S -> D
  
  p_OD_OD = 1,  # OD -> OD
  p_OD_D = 0,  # OD -> D
  
  p_D_D = 1,        # D -> D (absorbing)
  
  #Death Hazard Ratios
  hr_M_D = 3.70,
  hr_S_D = 7.15,
  hr_OD_D = 12.94,
  
  # Population Characteristics
  mod_population_size = 44236,  # African-American women with moderate/severe SLE
  severe_ratio = .65, # African-American women with moderate SLE
  moderate_ratio = .35, # African-American women with severe SLE
    
  mean_age = 31.4,          # Mean age at diagnosis
  
  
  # Cost Data (Some values here are placeholders)
  cost_belimumab = 20325.3,  # Cost of Belimumab per cycle (Monthly BENLYSTA 200MG PREFILLED SYR) 3387.55*6
  cost_anifrolumab = 22430.46,  # Cost of Anifrolumab per cycle (Monthly SAPHNELO 150ML/ML INJ, SOLN)3738.41*6
  c_low_dose_steriod_reduction = 644.07, #Cost reduction with low-dose steroids per cycle
  cost_death = 7327.06,  # Cost of end-of-life care
  c_R = 20239.96, # Cost of Remission/Mild SLE per Cycle
  c_M = 24317.58, # Cost of Moderate SLE per Cycle
  c_S = 36857.11, # Cost of Severe SLE per Cycle
  c_OD = 161209.52, #Cost of End Stage Renal Disease per Cycle

  
  # Utility Values for QALY Calculations
  u.remission = 0.705,  # Utility value for Remission state (based on research)
  u.active = 0.42,  # Utility value for Active Disease state (based on research)
  u.severe = 0.37,  # Utility value for Severe Disease state (based on research)
  u.organ_damage = 0.28,  # Utility value for Organ Damage state (based on research)
  u.death = 0,  # Utility value for Death state
  
  # Time Horizon and Cycle Length
  cycle_length = 6,  # Cycle length in months
  time_horizon_years = 100,  # Lifetime time horizon (assuming up to 100 years for the cohort)
  num_cycles = 100 * 12 / 6, # Total number of cycles
  
  ## Adjustments to transition probabilities in other strategies
  hr_progression_bel = 0.77, # Hazard ratio for transition from lower to higher SLEDAI with Belimumab
  or_improvement_bel = 1.40, # Odds ratio for transition from higher to lower SLEDAI with Belimumab
  
  rr_progression_anif = .67,  # Hazard ratio for transition from lower to higher SLEDAI with Anifrolumab
  or_improvement_anif = 2.7,  # Hazard ratio for transition from lower to higher SLEDAI with Anifrolumab
  
  ### Additive Intervention Utilities
  u_R_M_trt = 0.03,  # added utility to Remission & Moderate state when treated with treatment for one cycle
  d_c = .0149, # equal discount of costs and QALYs by 3%
  d_e = .0149 # equal discount of costs and QALYs by 3%
  )

# Print input data to check
print(input)
