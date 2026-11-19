#---------------------------------------------------------
# File:   mit18_05_s22_studio7.r 
# Authors: Jeremy Orloff and Jennifer French
#
# MIT OpenCourseWare: https://ocw.mit.edu
# 18.05 Introduction to Probability and Statistics
# Spring 2022
# For information about citing these materials or our Terms of Use, visit:
# https://ocw.mit.edu/terms}.
#
#---------------------------------------------------------
# Studio 7  ----

# 1. Be sure to read the instructions file!

# 2. The test answers file gives sample output and the functions we ran to get it. You should use this to verify your code is giving correct output in the format asked for.

# 3. The handouts section (right side) of our MITx course page has a link for uploading you work.

#--------------------------------------
# Problem 1: Significance and power/type 1 and type 2 errors
# See instructions for this studio

studio7_problem_1 = function(theta_HA, alpha, n_tosses) {
  cat("----------------------------------\n")
  cat("Problem 1: Rejection region, actual significance, power\n")

  # **** Be careful to avoid an 'off by 1 error' here.

  # Arguments:
  #   theta_HA = the probability of heads in the alternate hypothesis
  #   alpha = significance level for our significance test
  #   n_tosess = the number of tosses in one trial

  theta_H0 = 0.5 # probability of heads in the null hypothesis

  # Enforce theta_HA > theta_H0
  if (theta_HA < theta_H0) {
    warning("Problem 1: We require theta_HA > theta_H0", immediate.=TRUE)
    return()
  }

  
  # Do not change the above code.
  # ********* YOUR CODE HERE ***********
critical_right= qbinom(1-alpha,n_tosses,theta_H0)+1
rejection_region=critical_right:n_tosses
significance= sum(dbinom(rejection_region,n_tosses,theta_H0))
power= sum(dbinom(rejection_region,n_tosses,theta_HA))
  cat("  Rejection region: ", rejection_region,"\n")
  cat("  True significance=", significance,'\n')
  cat("  Power=", power,'\n')
}


#--------------------
# Problem 2: Simulation with a known prior.
# See instructions for this studio

studio7_problem_2 = function(theta_HA, alpha, n_tosses, n_trials, secret_prior) {
  cat("----------------------------------\n")
  cat("Problem 2: Simulation with a mixture of coins\n")

  # Arguments:
  #   theta_HA = the probability of heads in the alternate hypothesis
  #   alpha = significance level for our significance test
  #   n_tosses = the number of tosses in one trial
  #   n_trials = the number of trials in the simulation
  #   secret_prior = the secret prior used to pick the type of coin for each trial = c(prob. of H0, prob of HA)

  theta_H0 = 0.5

  # Enforce theta_HA > theta_H0
  if (theta_HA < theta_H0) {
    warning("Problem 1: We require theta_HA > theta_H0", immediate.=TRUE)
    return()
  }
  range = c(theta_H0,theta_HA)
  critical_right_H0=qbinom(1-alpha,n_tosses,theta_H0)+1
  rejection_region_H0=critical_right_H0:n_tosses
  

  # Do not change the above code.
  # ********* YOUR CODE HERE ***********
  h0_reject_h0=0
  h0_nonreject_h0=0
  ha_reject_ha=0
  ha_nonreject_ha=0
for(j in 1:n_trials){
  x = sample(range, 1, prob=secret_prior)
  xm= rbinom(1,n_tosses,x)
  if(xm %in% rejection_region_H0){
    if(x== theta_H0){
      h0_reject_h0=h0_reject_h0+1
      
    }else{
      ha_nonreject_ha=ha_nonreject_ha+1
    }
    
  }
  else{
    if(x== theta_H0){
      h0_nonreject_h0=h0_nonreject_h0+1
      
    }else{
      ha_reject_ha=ha_reject_ha+1
    }
  }
  
  
  
  
  
  
}

  n0=h0_reject_h0+h0_nonreject_h0
  nA=ha_reject_ha+ha_nonreject_ha
  nreject=h0_reject_h0+ ha_reject_ha
  cat("  theta_HA=", theta_HA, ", alpha=", alpha, '\n', sep='')
  cat("  n_tosses=", n_tosses, ", n_trials=", n_trials, '\n', sep='')
  cat("  secret_prior=", secret_prior, '\n')
  cat("  Number of rejections: ", nreject, '\n')
  cat("  Number of type 1: ",h0_reject_h0 , '\n')
  cat("  Number of type 2: ",ha_reject_ha , '\n')
  cat("  P(rejection | H0): ",h0_reject_h0/n0 , '\n')
  cat("  P(H0 | rejection): ",(h0_reject_h0)/(h0_reject_h0+ha_reject_ha) , '\n')
  cat("  P(rejection | HA): ",ha_reject_ha/nA , '\n')
  cat("  P(HA | rejection): ",(ha_reject_ha)/(h0_reject_h0+ha_reject_ha) , '\n')
  cat("  P(rejection): ",(h0_reject_h0+ha_reject_ha)/(n0+nA) , '\n')
}

#--------------------
# Problem 3: Simulation with only fair coins
# See instructions for this studio

studio7_problem_3a = function(theta_HA, alpha, n_tosses, n_trials) {
  cat("----------------------------------\n")
  cat("3a: Simulation with all fair coins: explain results\n")

  secret_prior = c(1.0, 0) # Prob of H0, prob of HA
  cat("----\n")
  cat("# Problem 2 called from problem 3a\n")
  studio7_problem_2(theta_HA, alpha, n_tosses, n_trials, secret_prior)
  cat("----\n")

  # Do not change the above code.
  # ********* YOUR CODE HERE ***********

  cat("  P(rejection | H0) = significance and we saw the simulated probability was approximately the true significance given in problem 1.", "\n\n")
  cat("  P(H0 | rejection) = 1 because we (being omniscient) know the coin is fair, so all rejections are incorrect, i.e. type 1 errors.", "\n\n")
  cat("  HA is never true, so   P(HA | rejection) = 0   and   P(rejection | HA) is undefined.", "\n")
}

studio7_problem_3b = function(theta_HA, alpha, n_tosses, n_trials) {
  cat("-----\n")
  cat("3b: Simulation with all unfair coins: explain results\n")

  secret_prior = c(0.0, 1.0) # Prob of H0, prob of HA
  cat("----\n")
  cat("# Problem 2 called from problem 3b\n")
  studio7_problem_2(theta_HA, alpha, n_tosses, n_trials, secret_prior)
  cat("----\n")

  # Do not change the above code.
  # ********* YOUR CODE HERE ***********
  cat("  H0 is never true, so P(H0 | rejection) = 0   and P(rejection | H0) is undefined.", "\n\n")
  cat("  P(rejection | HA) = power and we saw the simulated probability was approximately the true power given in 1b.", "\n\n")
  cat("  P(HA | rejection) = 1 because we (being omniscient) know the coin is always HA, so all rejections are correct.", "\n")

}

studio7_problem_3c = function() {
  cat("-----\n")
  cat("3c: Explain difference between P(H0 | rejection) and significance\n")


  # Do not change the above code.
  # ********* YOUR CODE HERE ***********

  cat("  Significance is P(rejection | H0), which does not depend on the prior probabilities of H0 and HA. We know that this is not the same as P(H0 | rejection), which does depend on the prior probabilites. Frequentists (unless they are omniscient) don't have such priors. Problems 3a and 3b show that P(H0 | rejection) can be anywhere between 0 and 1.", '\n')
}

studio7_problem_3d = function() {
  cat("-----\n")
  cat("3d: Shout it out!\n")

  # Do not change the above code.
  # ********* YOUR CODE HERE ***********

  for(i in 1:5){cat("  THE SIGNIFICANCE IS NOT THE PROBABILITY OF AN ERROR GIVEN REJECTION! \n\n")}
  cat("  It is the probability of rejection given H0. Frequentists don’t compute P(Error | rejection)")
}


#--------------------
# OPTIONAL Problem 4: Use Bayes theorem
# See instructions for this studio

studio7_problem_4 = function(theta_HA, alpha, n_tosses, secret_prior) {
  cat("----------------------------------\n")
  cat("OPTIONAL 4: Use Bayes theorem\n")

  theta_H0 = 0.5
  n_trials=1000

  # Enforce theta_HA > theta_H0
  if (theta_HA < theta_H0) {
    warning("Problem 1: We require theta_HA > theta_H0", immediate.=TRUE)
    return()
  }

  # Do not change the above code.
  # ********* YOUR CODE HERE ***********
  theta_H0 = 0.5
  
  # Enforce theta_HA > theta_H0
  if (theta_HA < theta_H0) {
    warning("Problem 1: We require theta_HA > theta_H0", immediate.=TRUE)
    return()
  }
  range = c(theta_H0,theta_HA)
  critical_right_H0=qbinom(1-alpha,n_tosses,theta_H0)+1
  rejection_region_H0=critical_right_H0:n_tosses
  
  
  # Do not change the above code.
  # ********* YOUR CODE HERE ***********
  h0_reject_h0=0
  h0_nonreject_h0=0
  ha_reject_ha=0
  ha_nonreject_ha=0
  for(j in 1:n_trials){
    x = sample(range, 1, prob=secret_prior)
    xm= rbinom(1,n_tosses,x)
    if(xm %in% rejection_region_H0){
      if(x== theta_H0){
        h0_reject_h0=h0_reject_h0+1
        
      }else{
        ha_nonreject_ha=ha_nonreject_ha+1
      }
      
    }
    else{
      if(x== theta_H0){
        h0_nonreject_h0=h0_nonreject_h0+1
        
      }else{
        ha_reject_ha=ha_reject_ha+1
      }
    }
    
    
    
    
    
    
  }
  
  n0=h0_reject_h0+h0_nonreject_h0
  nA=ha_reject_ha+ha_nonreject_ha
  nreject=h0_reject_h0+ ha_reject_ha
  cat("  theta_HA=", theta_HA, ", alpha=", alpha, '\n', sep='')
  cat("  n_tosses=", n_tosses, ", n_trials=", n_trials, '\n', sep='')
  cat("  secret_prior=", secret_prior, '\n')
  cat("  Number of rejections: ", nreject, '\n')
  cat("  Number of type 1: ",h0_reject_h0 , '\n')
  cat("  Number of type 2: ",ha_reject_ha , '\n')
  cat("  P(rejection | H0): ",h0_reject_h0/n0 , '\n')
  cat("  P(H0 | rejection): ",(h0_reject_h0)/(h0_reject_h0+ha_reject_ha) , '\n')
  cat("  P(rejection | HA): ",ha_reject_ha/nA , '\n')
  cat("  P(HA | rejection): ",(ha_reject_ha)/(h0_reject_h0+ha_reject_ha) , '\n')
  cat("  P(rejection): ",(h0_reject_h0+ha_reject_ha)/(n0+nA) , '\n')
  
  bayesh0=(prior[1]*h0_reject_h0/n0)/((prior[1]*h0_reject_h0/n0)+(prior[2]*ha_reject_ha/nA))
  bayesha=(prior[2]*ha_reject_ha/nA)/((prior[1]*h0_reject_h0/n0)+(prior[2]*ha_reject_ha/nA))

  cat("  true P(H0 | rejection): ", bayesh0, '\n')
  cat("  true P(HA | rejection): ", bayesha, '\n')
}
