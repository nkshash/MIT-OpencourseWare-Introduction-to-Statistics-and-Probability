#---------------------------------------------------------
# File:   mit18_05_s22_studio9.r 
# Authors: Jeremy Orloff and Jennifer French
#
# MIT OpenCourseWare: https://ocw.mit.edu
# 18.05 Introduction to Probability and Statistics
# Spring 2022
# For information about citing these materials or our Terms of Use, visit:
# https://ocw.mit.edu/terms.
#
#---------------------------------------------------------
# Studio 9 ----

# 1. Be sure to read the instructions file!

# 2. The test answers file gives sample output and the functions we ran to get it. You should use this to verify your code is giving correct output in the format asked for.

# 3. The handouts section (right side) of our MITx course page has a link for uploading you work.

#--------------------------------------
# Problem 1: Simulated confidence intervals for normal data
# See instructions for this studio

# Problem 1a: Simulated type 1 CI error rate for z-confidence intervals
studio9_problem_1a = function(theta_vals, theta_prior, sigma, n_data, confidence, n_trials) { 
  cat("\n----------------------------------\n")
  cat("Problem 1a: Simulated type 1 CI error rate for z-confidence intervals \n")

  # Arguments:
  #  theta_vals = possible values for the mean of the normal distribution
  #  theta_prior = probabilities for choosing a theta from theta_vals
  #  sigma = standard deviation of the normal distribution
  #  n_data = the number of data values in each trial
  #  confidence = the confidence level, e.g. 0.95, 0.9 etc
  #  n_trials = number of trials in the simulation


  # Do not change the above code.
  # ********* YOUR CODE HERE ***********
  res=0
  for(i in 1:n_trials){
  theta=sample(theta_vals,1,prob = theta_prior)
  x= rnorm(n_data,mean=theta,sd=sigma)
  alpha=1-confidence
  zalpha=qnorm(1-alpha/2,0,1)
  xmean=mean(x)
  error=(zalpha*sigma)/sqrt(n_data)
  zleft=xmean-error
  zright=xmean+error
  
  if(abs(xmean-theta)>=error){
    res=res+1
  }}
  
  cat('z-left ',zleft,'z-right ',zright,'\n')
    
  
  cat('type 1 error',res/n_trials)

}


# Problem 1b: Simulated type 1 CI error rate for t-confidence intervals
studio9_problem_1b = function(theta_vals, theta_prior, sigma, n_data, confidence, n_trials) { 
  cat("\n----------------------------------\n")
  cat("Problem 1b: Simulated type 1 CI error rate for t-confidence intervals \n")

  # Arguments:
  #  theta_vals = possible values for the mean of the normal distribution
  #  theta_prior = probabilities for choosing a theta from theta_vals
  #  sigma = standard deviation of the normal distribution
  #  n_data = the number of data values in each trial
  #  confidence = the confidence level, e.g. 0.95, 0.9 etc
  #  n_trials = number of trials in the simulation

  # Remember: in this problem, you use sigma to generate the data, but not in computing the confidence interval.
  
  # Do not change the above code.
  # ********* YOUR CODE HERE ***********
  res=0
  for(i in 1:n_trials){
    theta=sample(theta_vals,1,prob = theta_prior)
    x= rnorm(n_data,mean=theta,sd=sigma)
    alpha=1-confidence
    zalpha=qt(1 - alpha / 2, df = n_data - 1)
    xmean=mean(x)
    sdx=sd(x)
    error=(zalpha*sdx)/sqrt(n_data)
    zleft=xmean-error
    zright=xmean+error
    
    if(abs(xmean-theta)>=error){
      res=res+1
    }}
  
  cat('t-left ',zleft,'t-right ',zright,'\n')
  
  
  cat('type 1 error',res/n_trials)
  

}


# Problem 1c: Bayesian updating and probability of hypotheses
studio9_problem_1c = function(theta_vals, theta_prior, sigma, n_data, confidence, xbar) { 
  cat("\n----------------------------------\n")
  cat("Problem 1c: Bayesian updating and probability of hypotheses\n")

  # Arguments:
  #  theta_vals = possible values for the mean of the normal distribution
  #  theta_prior = probabilities for choosing a theta from theta_vals
  #  sigma = standard deviation of the normal distribution
  #  n_data = the number of data values in each trial
  #  confidence = the confidence level, e.g. 0.95, 0.9 etc
  #  xbar = the mean of the data

  # Do not change the above code.
  # ********* YOUR CODE HERE ***********
  likelihood= dnorm(xbar,mean=theta_vals, sigma/sqrt(n_data))
  bayesian= theta_prior*likelihood
  posterior=bayesian/sum(bayesian)
  
  alpha=1-confidence
  zalpha=qnorm(1-alpha/2,0,1)
  error=(zalpha*sigma)/sqrt(n_data)
  zleft=xbar-error
  zright=xbar+error
  res1=0
  res2=0
  
  for (i in  1:length(theta_vals)){
    if(abs(xbar-theta_vals[i])<=error){
      res1=res1+theta_prior[i]
      res2=res2+posterior[i]
    }
  }
  
  cat('prior', theta_prior,'\n')
  cat('posterior', posterior,'\n')
  cat('z interval [', zleft,'] [',zright,']','\n')
  cat('prior probability', res1,'\n')
  cat('posterior probability', res2,'\n')

}


#---------------------------
# OPTIONAL Problem 2: Simulated polling confidence intervals
# See instructions for this studio

studio9_problem_2 = function(true_theta, n) { 
  cat("\n----------------------------------\n")
  cat("Problem 2: Simulated polling confidence interval\n")

  # Arguments
  # true_theta = true proportion who prefer Lincoln. Use this to generate your simulated polling data
  # n = size of the sample

  
  # Do not change the above code.
  # ********* YOUR CODE HERE ***********
  data = rbinom(n, 1, true_theta)
  estimated_theta = mean(data)
  margin_of_error = 1/sqrt(n)
  
  # Print the confidence interval
  cat('Confidence interval: ', estimated_theta, 'plus or minus', margin_of_error, '\n')
    
}
