#---------------------------------------------------------
# File:   mit18_05_s22_studio6.r 
# Authors: Jeremy Orloff and Jennifer French
#
# MIT OpenCourseWare: https://ocw.mit.edu
# 18.05 Introduction to Probability and Statistics
# Spring 2022
# For information about citing these materials or our Terms of Use, visit:
# https://ocw.mit.edu/terms.
#
#---------------------------------------------------------
# Studio 6 ----

# 1. Be sure to read the instructions file!

# 2. The test answers file gives sample output and the functions we ran to get it. You should use this to verify your code is giving correct output in the format asked for.

# 3. The handouts section (right side) of our MITx course page has a link for uploading you work.

#--------------------------------------
# Problem 0: Averaging normal distributions.
# See instructions for this studio
studio6_problem_0 = function() { 
  cat("\n----------------------------------\n")
  cat("Problem 0: Averaging normal distributions \n")

  setwd("C:/Users/mishr/Downloads/studios_mit18_05_s22_studio6")
  
  source('mit18_05_s22_studio6_problem0_draw_plot.r')
  studio6_problem0_draw_plot(10, 6, 9, 10000)

  # Do not change the above code.
  # ********* YOUR CODE HERE ***********

  cat('average plot is less narrow\n')
}

#---------------------------
# Problem 1: Cauchy distribution

# 1a. Formula for Cauchy pdf
studio6_problem_1a = function() {
  cat("\n----------------------------------\n")
  cat("Problem 1a. Formula for Cauchy pdf\n")


  # Do not change the above code.
  # ********* YOUR CODE HERE ***********
  

  cat("1/(pi*(1+(x-theta)^2)\n")
}


# Problem 1b: Plot pdfs
studio6_problem_1b = function() {
  cat("-----\n")
  cat("1b. Plot pdf of Cauchy and standard normal\n")


  # Do not change the above code.
  # ********* YOUR CODE HERE ***********
  theta_min=-10
  theta_max=10
  dtheta=0.01
  discrete_theta_range = seq(theta_min, theta_max, dtheta)
  cauchy_dist=1/(pi*(1+(discrete_theta_range)^2))
  normal_dist=dnorm(discrete_theta_range,0,1)
  
  plot(discrete_theta_range, normal_dist,
       type = "l", col = "orange", lwd = 2,
       xlab = expression(theta), ylab = "Density",
       main = "Standard Normal and Cauchy Densities")
  
  lines(discrete_theta_range, cauchy_dist,
        col = "blue", lwd = 2)
  
  legend("topright",
         legend = c("Standard normal", "Standard Cauchy"),
         col = c("orange", "blue"), lwd = 2)
  cat("1b. See plots\n")
}

# Problem 1c: Explain fat tails
studio6_problem_1c = function() {
  cat("-----\n")
  p= qcauchy(0.95,0,1)
  q= qnorm(0.95,0,1)
  trail_left_cauchy=pcauchy(-p,0,1)
  trail_left_normal=pcauchy(-q,0,1)
  trail_right_cauchy=1-pcauchy(p,0,1)
  trail_right_normal=1-pcauchy(q,0,1)
  cat('cauchy left',-p,'\n')
  cat('cauchy right',p,'\n')
  cat('normal left',-q,'\n')
  cat('normal right',q,'\n')
  
  

  
  # Do not change the above code.
  # ********* YOUR CODE HERE ***********

  cat("clearly left right of normal is much less then cauchy which justify fat tail of cauchy as compare to normal  \n")
}

# Problem 1d: Average of Cauchy
studio6_problem_1d = function() {
  cat("-----\n")
  cat("1d. Average of Cauchy distributions\n")

  # Be sure the working directory is set to source file location
  # No code to write. Just run this code
  source('mit18_05_s22_studio6_problem_1d.r')

 
  # Do not change the above code.
  # ********* YOUR CODE HERE ***********

  cat("Notice that averaging the Cauchy distribution does not change the spread of the histogram. Averaging does not help us estimate the location of the pdf!\n")
}

#--------------------------------------
# Problem 2: Cauchy's lighthouse ----

# 2a: Load and plot data
studio6_problem_2a = function(data_frame_csv) {
  cat("\n----------------------------------\n")
  cat("Problem 2a. Load and plot data.\n")

  # Be sure the working directory is set to source file location

  # Arguments:
  #  data_frame_csv = name of the data file. (The grader will use a different data file than the test scripts.)

  # Load the data
  studio6_data_frame = read.csv(data_frame_csv)
  print(head(studio6_data_frame))
  position_data = studio6_data_frame[,'position']

  # Do not change the above code.
  # ********* YOUR CODE BELOW HERE ***********
  plot(studio6_data_frame[,'X'],studio6_data_frame[,'position'],type='p', col="blue", pch = 19)


  cat("2a. See plot\n")
}

# Problem 2b:. Discretized Bayesian updates----
studio6_problem_2b = function(data_frame_csv) {
  cat("-----\n")
  cat("2b. Discretized Bayesian updates and MAP estimates.\n")

  # Arguments:
  #  data_frame_csv = name of the data file. (The grader will use a different data file than the test scripts.)

  # We give the unknown parameter theta a prior that follows a Uniform(theta_min, theta_max) distribution.
  # Use these values
  theta_min = -10
  theta_max = 10
  dtheta = 0.02 # Stepsize for discretizing the prior.

  # Load the data
  studio6_data_frame = read.csv(data_frame_csv)
  position_data = studio6_data_frame[,'position']

  # Do not change the above code.
  # ********* YOUR CODE FOR HERE***********
dseq= seq(theta_min,theta_max,dtheta)
prior= rep(1,length(dseq))
nprior=prior/sum(prior)
print(sum(nprior))
nposterior=nprior
posterior_mat= matrix(NA, nrow=length(dseq), ncol=length(position_data))

for( j in 1:length(position_data)){
  x=position_data[j]
  likelihood = dcauchy(x,dseq , 1)
  bayes_numerator = likelihood*nposterior
  posterior = bayes_numerator/(sum(bayes_numerator))
  nposterior=posterior
  posterior_mat[,j] = posterior}
  
ymax <- max(posterior_mat, na.rm = TRUE)
  
  plot(
    dseq, nprior,
    type = "l", col = "orange", lwd = 2,
    ylim = c(0, ymax),
    xlab = expression(theta),
    ylab = "Density",
    main = "Prior and posterior distributions"
  )

for(j in 1:length(position_data))
{lines(dseq, posterior_mat[,j],
       lwd = 2, col=j+1)}
  map.est <- numeric(length(position_data))
  
  for (j in seq_along(position_data)) {
    map.est[j] <- dseq[which.max(posterior_mat[, j])]
  }
  
  # MAP estimate versus posterior index
  plot(
    seq_along(map.est), map.est,
    type = "p", pch = 19,
    xlab = "Posterior index",
    ylab = expression("MAP estimate of " * theta),
    main = "MAP estimates"
  )
  final.posterior <- posterior_mat[, length(position_data)]
  final.map <- dseq[which.max(final.posterior)]
  
  plot(
    dseq, final.posterior,
    type = "l", col = "blue", lwd = 2,
    xlab = expression(theta),
    ylab = "Posterior probability",
    main = "Final posterior and MAP estimate"
  )
  abline(v = final.map, col = "red", lty = 2, lwd = 2)
  points(final.map, max(final.posterior), col = "red", pch = 19)

  # 2b(vi) Where to look
  cat("posterior is still less , we need to collect more data and keep updating\n")
}

# Problem 2c:. OPTIONAL Explanation ----
studio6_problem_2c = function() {
  cat("-----\n")
  cat("Problem 2c (OPTIONAL). Explanation\n")


  # Do not change the above code.
  # ********* YOUR CODE HERE***********

  fake_theta = 3
  x = 7
  plot_title = "2c. Explanatory diagram"
  plot(c(0,10), c(0,1.5), xlab="theta", ylab="", axes=F, type='n',
       main=plot_title)
  points(c(fake_theta), c(1.0), pch='*', col='blue', cex=4)
  numberline = c(-10, -8, -6, -4, -2, 0, 2, fake_theta, 7, 8, 10)
  labs = c(-10, -8, -6, -4, -2, 0, 2, expression(theta), "x", 8, 10)
  axis(1, at=numberline, labels=labs, pos=0)
  axis(2, at=c(0,1), pos=0, las=1)
  lines(c(fake_theta, fake_theta, x), c(0, 1, 0))
  text(5, 0, pos=3, expression(x-theta), cex=1.5)
  text(3.5, 0.75, expression(alpha), cex=1.5)
  text(fake_theta, 0.5, 1, cex=1.5, pos=2)
  text(5, 1/2, expression(sqrt(1+(x-theta)^2)), cex=1.5, pos=4)
  
  # Here is the explanation.
  cat("2c (OPTIONAL). Here is the explanation.\n\n")
  
  cat("Look at the explanatory diagram.\n")
  cat("The angle alpha is random and uniform between -pi/2 and pi/2.\n")
  cat("The figure shows that x-theta = tan(alpha)\n")
  cat("This is a transformation from alpha to x, so we can use it to find the pdf for x.\n")
  cat("As usual, we work with the cdf and take a derivative at the end\n")
  cat("\n")
  cat("Let X be the random variable whose values x are the random (in time) position meausrements. Let A be the random variable whose values alpha are the random (in time) angles.\n")
  cat("Then, F_X(x) is the cdf of X and F_A(alpha) is the cdf of A\n")
  cat("The figure shows that X-theta = tan(alpha)\n")
  cat("So, F(x|theta) = P(X < x | theta)\n")
  cat("       = P(tan(alpha) < x-theta | theta)\n")
  cat("       = P(alpha < arctan(x-theta) | theta)\n")
  cat("       = (1/pi)*arctan(x-theta)\n")
  cat("The last equality is because A is uniform on [-pi/2,pi/2]\n")
  cat("Now all we have to do is remember how to differentiate artctan in order to find f(x|theta):\n")
  cat("f(x|theta) = (1/pi)*1/(1+(x-theta)^2))  QED\n")
}
