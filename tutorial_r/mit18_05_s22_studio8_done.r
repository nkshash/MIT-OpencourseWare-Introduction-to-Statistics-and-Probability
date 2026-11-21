#---------------------------------------------------------
# File:   mit18_05_s22_studio8.r 
# Authors: Jeremy Orloff and Jennifer French
#
# MIT OpenCourseWare: https://ocw.mit.edu
# 18.05 Introduction to Probability and Statistics
# Spring 2022
# For information about citing these materials or our Terms of Use, visit:
# https://ocw.mit.edu/terms.
#
#---------------------------------------------------------
# Studio 8  ----

# 1. Be sure to read the instructions file!

# 2. The test answers file gives sample output and the functions we ran to get it. You should use this to verify your code is giving correct output in the format asked for.

# 3. The handouts section (right side) of our MITx course page has a link for uploading you work.

#--------------------------------------
# Summary of questions
# 1. Simulation of the f-statistic: draw histogram and graph
# 2. z-test. Code by hand a z-test
# 3. Chi-square test for independence
# 4. ANOVA. using aov()

#--------------------------------------
# Problem 1: Simulate F statistic
# See instructions for this studio

studio8_problem_1 = function(n, m, mu, sigma, n_trials) {
  cat("----------------------------------\n")
  cat("Problem 1: Simulate F statistic\n")

  # Arguments
  # n = number of groups
  # m = number of data points in each group (same for all groups)
  # mu = common mean: same for each group
  # sigma = common standard deviation (same for each group)
  # n_trials = number of trials to run in the simulation
  

  # Do not change the above code.
  # ********* YOUR CODE HERE ***********

  ans=rep(0,n_trials)
  for(i in 1:n_trials){
  data=matrix(data=NA,nrow=m,ncol=n)
  for(j in 1:n){
    data[,j]=rnorm(m,mu,sigma)
  }
  data.mean=rep(0,n)
  data.var=rep(0,n)
  for(j in 1:n){
    data.mean[j]=mean(data[,j])
    data.var[j]=var(data[,j])
  }
  msw=mean(data.var)
  msb=m*var(data.mean)
  ans[i]=msb/msw}
  
  
  
  df1 = n-1
  df2=n*(m-1)
  x = seq(0, 8, 0.001)
  y = df(x, df1,df2)
  
  # Draw the density histogram (freq=FALSE) and graph
  y_max = max(y)  # Used to set plot range
  binwidth = 0.2
  breaks = seq(0,8,binwidth)
  hist(ans, breaks=breaks, freq=FALSE)
  lines(x, y, col='orange', lwd=2)
}

#--------------------------------------
# Problem 2: Code z-test by hand
# See instructions for this studio

studio8_problem_2 = function(data, mu0, known_sigma, alpha) {
  cat("----------------------------------\n")
  cat("Problem 2: Code z-test by hand\n")

  # Arguments
  # data = list of sample values
  # mu0 = hypothesized mean in the null hypothesis
  # known_sigma = known value of the standard deviation
  # alpha = significance for the test

  
  # Do not change the above code.
  # ********* YOUR CODE HERE ***********
  
  xmean=mean(data)
  z=(xmean-mu0)/(known_sigma/sqrt(length(data)))
  
  p_value = 2*(1-pnorm(abs(z)))
  cat('mean of data =', xmean,'\n')
  cat('z =', z, '\n')
  cat('p =', p_value, '\n')
  if (p_value <= alpha) {
    cat('we reject mu0 as mean')
  }
  else {
    cat('we do not reject mu0 as mean')
  }

}

#--------------------------------------
# Problem 3: Chi-square test for independence
# See instructions for this studio

studio8_problem_3 = function(data_table_file, alpha) {
  cat("----------------------------------\n")
  cat("Problem 3: Chi-square test for independence\n")

  # Arguments
  # data_table_file = data file containing a two-by-two contingency table
  # alpha = significance for the test
  
  contingency_tbl = read.table(data_table_file)
  print(contingency_tbl)

  # Do not change the above code.
  # ********* YOUR CODE HERE ***********
  sum_col1=sum(contingency_tbl[,'Married.once'])
  sum_col2=sum(contingency_tbl[,'Married.more'])
  sum_total=sum_col1+sum_col2
  fre=c(sum_col1/sum_total,sum_col2/sum_total)
  
  rows = rowSums(contingency_tbl)
  est_mat=matrix(NA,nrow=length(contingency_tbl[1,]),ncol=length(contingency_tbl[,1]))
  for (j in 1:length(contingency_tbl[1,]) ){
    est_mat[,j]=fre[j]*contingency_tbl[,j]
  }
  print(est_mat)
  chi.square=sum(((contingency_tbl-est_mat)^2)/est_mat)
  dfun=(length(contingency_tbl[1,])-1)*(length(contingency_tbl[,1])-1)
  
  p = 1- pchisq(chi.square, dfun)
  print(p)
  if(p<=alpha){
    print("they are related")
    
    
  }
  else{
    print("the are independent")
  }
  
  # ---- using function---
  results = chisq.test(contingency_tbl)
  print(results)
  p = results$p.value
  print(p)
  
  if(p<=alpha){
    print("they are related")
    
    
  }
  else{
    print("the are independent")
  }
  
  
  
}

#--------------------------------------
# Problem 4: ANOVA using aov()
# See instructions for this studio

studio8_problem_4 = function(T1, T2, T3, alpha) {
  cat("----------------------------------\n")
  cat("Problem 4: ANOVA using aov()\n")

  # Arguments
  # T1, T2, T3 = 3 sets of data. All the same length
  # alpha = significance of the test
  
  # Put the data into a data.frame.
  # Data frames are tables. We make columns for procedure and pain
  procedure = c(rep('T1',length(T1)),rep('T2',length(T2)),rep('T3',length(T3)))
  pain = c(T1,T2,T3)
  data_pain = data.frame(procedure, pain)

  #Look at the printout. Notice how the frame has columns procedure and pain. The ANOVA test will be to see if there is a difference between the average pain from each procedure.
  print(data_pain)

  # Do not change the above code.
  # ********* YOUR CODE HERE ***********
  print(procedure)
  print(pain)
  
  aov.data=aov(pain~procedure,data=data.pain)
  s=summary(aov.data)
  print(summary(aov.data))
  
  a = s[[1]]$'Pr(>F)'
  print(a)
  p_value = a[1]
  cat('\np-value:', p_value,'\n')
  
  if (p_value <= alpha) {
    cat('The p-value ', p_value, ' is less than or equal to ', alpha, '. So, at significance level ', alpha, ' we should reject H0 in favor of the alternative that the levels of pain in the different treatments are not all the same.\n')
  }
  else {
    cat('The p-value ', p_value, ' is greater than ', alpha, '. So, at significance level ', alpha, ' the data does not support rejecting H0, that the levels of pain in the different treatments are all the same.\n')
  }
  
  
}
