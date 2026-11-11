#---------------------------------------------------------
# File:   mit18_05_s22_studio4.r 
# Authors: Jeremy Orloff and Jennifer French
#
# MIT OpenCourseWare: https://ocw.mit.edu
# 18.05 Introduction to Probability and Statistics
# Spring 2022
# For information about citing these materials or our Terms of Use, visit:
# https://ocw.mit.edu/terms.
#
#---------------------------------------------------------
# Studio 4 ----

# 1. Be sure to read the instructions file!

# 2. The instruction file gives instructions for testing your code. You can see the output of the tests in studio4-test-answers.html. You should use this to verify your code is giving correct output in the format asked for.

# 3. The handouts section (right side) of our MITx course page has a link for uploading you work.

#---------------------------------
# Problem 1: Barto and Axel simulated covariance and correlation. ----
# See the instructions for this studio.

# 1a: Simulated covariance and correlation.
studio4_problem_1a = function(n_together, n_Barto_alone, ntrials) {
  cat("\n----------------------------------\n")
  cat("Problem 1a. Barto and Axel simulated covariance and correlation.\n")

  # Arguments:
  #   n_together = number of games Axel and Barto play together
  #   n_Barto_alone = number of games Barto plays after playing with Axel
  #   ntrials = number of trials to run in one simulation.

  # Do not change the above code.
  # ********* YOUR CODE BELOW HERE ***********
  n_alone=n_Barto_alone
  values = c(-1, 1)   # 4 possible value
  probs = c(0.5263158,0.4736842)  # corresponding probabilities
  
  # Draw nSamples with replacement
  x_tog = sample(values, n_together* ntrials , replace=TRUE, prob=probs)
  x_alone = sample(values, n_alone* ntrials , replace=TRUE, prob=probs)
  x_tog_mat=matrix(x_tog,nrow= n_together)
  together= colSums(x_tog_mat)
  x_alone_mat=matrix(x_alone,nrow= n_alone)
  alone= colSums(x_alone_mat)
  alexwin=together
  bartowin=together+alone
  a_mean=mean(alexwin)
  b_mean=mean(bartowin)
  a_var=var(alexwin)
  b_var=var(bartowin)
  c_a_b= cov(alexwin,bartowin)
  c2_a_b= cor(alexwin,bartowin)
  
  

  
  #------
  # Use the cat statements below to print your results. You will need to insert your variables names where indicated.
  cat("For n_together =", n_together, " and n_Barto_alone =", n_Barto_alone, "we have\n")
  cat("Axel's sample mean is", a_mean, '\n')
  cat("Barto's sample mean is", b_mean, '\n')
  cat("Axel's sample variance is",a_var , '\n')
  cat("Barto's sample variance is",b_var , '\n')
  cat("Their sample covariance is",c_a_b , '\n')
  cat("Their sample correlation is",c2_a_b , '\n')
}


# 1b. Print your description of what happens as n_Barto_alone increases
studio4_problem_1b = function() {
  cat("-----\n")
  cat("1b. Describe behavior as n_Barto_alone increases\n")

  # Do not change the above code.
  # ********* YOUR CODE BELOW HERE ***********
  
  cat('As n_Barto_alone increases, the covariance, remain same. \n')
  cat('As n_Barto_alone increases, the correlation, decreases. \n')
}

#-------------------------------------
# Problem 2: Simulated central limit theorem. ----
# This is cool and shouldn't take a lot of code.
studio4_problem_2 = function(n_bets_per_trial, ntrials) {
  cat("\n----------------------------------\n")
  cat("Problem 2. Simulated central limit theorem.\n")

  # Arguments:
  #   n_bets_per_trial = the number of bets in each trial
  #   n_trials = number of trials

  # Do not change the above code.
  # ********* YOUR CODE HERE ***********
  
  values = c(-1, 1)   # 4 possible value
  probs = c(0.5263158,0.4736842)  # corresponding probabilities
  
  # Draw nSamples with replacement
  x = sample(values, n_bets_per_trial* ntrials , replace=TRUE, prob=probs)
  x_matrix= matrix(x,nrow=n_bets_per_trial)
  w= colSums(x_matrix)
  hist(w, col='orange',freq= FALSE)
  
  one_bet_mean = sum(values*probs)
  one_bet_var = sum(probs*(values - one_bet_mean)^2)
  
  # Computing the theoretical mean and variance of a trial is easy
  trial_mean = n_bets_per_trial*one_bet_mean
  trial_var = n_bets_per_trial*one_bet_var
  trial_sigma = sqrt(trial_var)
  
  # Now plot the normal curve
  x = seq(min(w), max(w), 0.01)
  y = dnorm(x, trial_mean, trial_sigma)
  lines(x, y, col='blue', lwd=2)


  #------
  cat('See plot\n')
}
