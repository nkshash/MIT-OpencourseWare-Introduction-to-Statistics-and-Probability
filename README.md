# MIT 18.05 

# Probability Concepts I Learned


## Core concepts

- **Experiment:** A repeatable process with clearly defined possible outcomes.
- **Sample space:** The set of every possible outcome of an experiment.
- **Event:** A subset of the sample space representing an outcome or group of outcomes of interest.
- **Probability:** A number from 0 to 1 that measures how likely an event is, with total probability 1 across the sample space.
- **Set operations:** Union means “A or B,” intersection means “A and B,” and complement means “not A.”
- **Counting principle:** The product rule counts multi-step outcomes by multiplying the number of choices at each step.
- **Permutations:** Arrangements of selected items where order matters.
- **Combinations:** Selections of items where order does not matter.
- **Conditional probability:** The probability of an event after restricting attention to information that another event occurred.
- **Independence:** Two events are independent when learning that one occurred does not change the probability of the other.
- **Bayes’ theorem:** A rule for updating the probability of a hypothesis using observed evidence.
- **Random variable:** A numerical value assigned to each outcome of a random experiment.
- **Probability distribution:** A description of the possible values of a random variable and their probabilities or density.
- **Expectation:** The probability-weighted average value of a random variable over many repetitions.
- **Variance and standard deviation:** Measures of how far a random variable's values typically spread around its expectation.
- **Joint distribution:** A probability model describing two or more random variables together.
- **Covariance:** A measure of whether two variables tend to vary together in their original units.
- **Correlation:** A standardized measure of the direction and strength of the linear relationship between two variables.
- **Law of Large Numbers:** As the number of independent repetitions grows, the sample average tends to approach the expected value.
- **Central Limit Theorem:** Sums or averages of many independent, similarly distributed variables are often approximately normal after standardization.
- **Simulation:** Repeated computer-generated trials used to estimate probabilities and explore random behavior.

This repository contains R simulations and visualizations for Studios 1–4 of MIT OpenCourseWare's **18.05 Introduction to Probability and Statistics** (Spring 2022). The work uses simulation to connect probability models with observed outcomes, and compares empirical results with exact probabilities or theoretical distributions.

## Probability concepts

### Studio 1: Matching birthdays and derangements

The birthday simulation models each person's birthday as an independent, uniformly selected day of the year. Each simulated room is one trial; the estimated probability of a match is the fraction of rooms in which at least two people share a birthday. This illustrates how the number of possible pairs grows as the room gets larger, so a match becomes likely with far fewer than 365 people. The optional derangement simulation samples random permutations and estimates the probability that no item remains in its original position.

### Studio 2: Binomial probabilities and expected payoff

The number of heads in a fixed number of independent coin tosses follows a binomial distribution. The script estimates probabilities such as \(P(Y=k)\) and \(P(Y\leq k)\) by simulation, then compares a simulated probability with the exact binomial probability. For the gambling game, the payoff for \(k\) heads is \(k^2-7k\). Its expected value is the probability-weighted average payoff over all possible head counts. A positive expected payoff favors the player over many repetitions; a negative expected payoff favors the house.

### Studio 3: Exponential distributions and averages

The samples model waiting times with an exponential distribution, whose rate parameter \(\lambda\) gives mean waiting time \(1/\lambda\). Histograms show the distribution of simulated observations and averages. Averaging independent exponential observations reduces variability: the mean remains \(1/\lambda\), while the standard deviation of the average is \(1/(\lambda\sqrt{n})\). As the number averaged grows, the distribution of the average becomes more nearly normal, illustrating the Central Limit Theorem.

### Studio 4: Covariance, correlation, and the Central Limit Theorem

On each roulette spin, a one-dollar bet on red earns \(+1\) with probability \(18/38\) and loses \(-1\) with probability \(20/38\). Axel and Barto share the outcomes of the games they play together, so those shared winnings create their covariance. Barto's additional games are independent of Axel's winnings: adding them increases the variability of Barto's total without changing the expected covariance with Axel. As a result, the correlation tends to decrease as Barto plays more games alone. The final simulation sums many roulette outcomes and compares their histogram with a normal curve, illustrating the Central Limit Theorem.
## Additional statistics topics in the course notes

The supplied MIT 18.05 statistics notes extend beyond the probability and simulation topics above. They introduce the main stages of statistical practice: experimental design and data collection, descriptive statistics, and inference from data.

### Statistical practice and estimation

- **Experimental design:** Planning how data will be collected so that it can answer a question reliably and fairly.
- **Data collection:** Gathering observations through experiments, surveys, or other systematic procedures.
- **Descriptive statistics:** Numerical summaries and visualizations that organize and describe observed data, such as the mean, median, interquartile range, histogram, and empirical cumulative distribution function (CDF).
- **Inferential statistics:** Using data from a sample and a statistical model to draw conclusions about a broader process or population.
- **Statistic:** Any quantity computed from collected data, such as a sample mean or count.
- **Parameter:** A fixed but usually unknown quantity describing a statistical model or population, such as a population mean or probability.
- **Point estimate:** A single value calculated from data to estimate an unknown parameter.
- **Interval estimate:** A range calculated from data to express plausible values for an unknown parameter.
- **Parametric model:** A family of probability distributions described by one or more parameters.
- **Likelihood:** For observed data, its probability (or density) under a model, viewed as a function of the unknown parameter.
- **Log-likelihood:** The logarithm of the likelihood; it has the same maximizing parameter value and is often easier to work with.
- **Maximum likelihood estimate (MLE):** The parameter value that makes the observed data most likely under the model.

### Bayesian inference

- **Prior probability or distribution:** The probability assigned to a hypothesis or parameter value before considering the current data.
- **Likelihood (in Bayesian updating):** How probable the observed data are under each hypothesis or parameter value.
- **Posterior probability or distribution:** The updated probability of a hypothesis or parameter value after combining the prior with the observed data using Bayes' theorem.
- **Bayesian updating:** Revising prior probabilities into posterior probabilities as evidence is observed.
- **Predictive probability:** The probability assigned to a future observation, averaging over uncertainty about the model or its parameters.
- **Odds:** The ratio of the probability of an event to the probability of its complement (or to a specified alternative event).
- **Likelihood ratio / Bayes factor:** A ratio comparing how well the observed data support two competing hypotheses; values above or below 1 favor one hypothesis or the other, depending on the ratio's order.
- **Base-rate fallacy:** The error of judging a hypothesis from the evidence alone while overlooking how common the hypothesis was before the evidence.

### Confidence intervals and hypothesis testing

- **Confidence interval:** A data-based interval produced by a method that, over repeated samples under its assumptions, contains the fixed true parameter at a specified rate. The notes discuss intervals for means, proportions, and variance.
- **Normal confidence interval:** An interval based on the normal distribution, often used when the population standard deviation is known or a large-sample approximation is suitable.
- **Student's *t* interval:** A mean interval using the *t* distribution, commonly used for normally distributed data when the population standard deviation is unknown and estimated from the sample.
- **Chi-square interval:** An interval for a normal population variance based on the chi-square distribution.
- **Null hypothesis:** The reference claim or parameter value assessed by a statistical test.
- **Alternative hypothesis:** The competing claim considered when the null hypothesis is not supported by the data.
- **Test statistic:** A quantity calculated from data and used to measure how compatible the data are with the null hypothesis.
- **Significance level:** The chosen maximum probability of rejecting a true null hypothesis under the test's assumptions.
- **Rejection region:** The set of test-statistic values for which the test rejects the null hypothesis at the chosen significance level.
- **Type I error:** Rejecting the null hypothesis when it is true.
- **Confidence interval and testing connection:** For many standard procedures, parameter values excluded by a matching confidence interval are also rejected by the corresponding two-sided test at the associated significance level.

### Bootstrap and resampling

- **Resampling:** Repeatedly drawing samples from observed data or a fitted model to study how a statistic varies.
- **Empirical distribution:** The probability distribution that places equal probability on each observed data point (including repeats).
- **Nonparametric bootstrap:** Resampling with replacement from the observed data to approximate the sampling variability of a statistic without specifying a parametric population model.
- **Parametric bootstrap:** Simulating new data from a fitted parametric model and recalculating a statistic to approximate its variability.
- **Bootstrap confidence interval:** An interval estimated from the distribution of resampled statistic values. The notes describe percentile and basic methods.
- **Percentile interval:** A bootstrap interval formed from selected lower and upper quantiles of the bootstrap estimates.
- **Basic interval:** A bootstrap interval that reflects bootstrap quantiles around the original estimate to form endpoints on the opposite sides of that estimate.

### Regression

- **Regression:** Modeling the relationship between a response variable and one or more predictor variables, often to describe or predict the response.
- **Least squares:** A fitting method that chooses model coefficients to minimize the sum of squared differences between observed and predicted responses.
- **Simple linear regression:** Regression of one response on one predictor using a straight-line model.
- **Polynomial regression:** Regression using powers of a predictor, such as a quadratic term, to model a curved relationship while remaining linear in the coefficients.
- **Residual:** The difference between an observed response and the value predicted by the fitted model.
- **Homoscedasticity:** The assumption that residuals have roughly the same variance across predictor values; changing variance is called heteroscedasticity.
- **Overfitting:** Fitting a model so closely to the observed data, including its random noise, that predictions on new data may be poor.
- **Coefficient of determination (R²):** A measure, in common regression settings, of the proportion of observed response variability accounted for by the fitted model.
- **Multiple linear regression:** A linear model that uses multiple predictor variables to explain or predict a response.
- **Regression to the mean:** The tendency for unusually high or low measurements to be followed, on average, by measurements closer to the population mean when the measurements are imperfectly correlated.

## Statistics concepts

### Studio 5: Bayesian updating with dice

Five dice with 4, 6, 8, 12, or 20 sides are treated as competing hypotheses about which die was selected. Each roll supplies evidence: the likelihood of that result under each die updates the prior probabilities into a posterior distribution. The script plots how those probabilities change as rolls accumulate, and an optional censored-data exercise repeats the process when only whether the roll was a 1 is recorded. The zero-prior example shows that evidence cannot revive a hypothesis that was assigned probability zero.

### Studio 6: Cauchy distributions and the lighthouse problem

The first problems compare normal and Cauchy distributions, highlighting how the Cauchy distribution's heavier tails make its sample average behave differently. The lighthouse exercise uses observed landing positions to estimate an unknown lighthouse location. It evaluates the Cauchy likelihood over a grid of possible locations, updates a uniform prior after each observation, and plots the evolving posterior and maximum a posteriori (MAP) estimates.

### Studio 7: Significance, power, and testing decisions

This studio studies repeated coin tosses as a hypothesis-testing problem. It finds rejection regions for a chosen significance level, then calculates the actual Type I error rate and the power under an alternative probability of heads. Simulations examine how often tests reject across repeated experiments and how the choice of prior or testing strategy affects the conclusions. The examples illustrate the tradeoff between false alarms and detecting a real effect.

### Studio 8: Hypothesis tests and ANOVA

The problems apply statistical tests to simulated and observed data. They use sample summaries to test claims about population means, assess whether categories in a contingency table are associated, and compare the average response across three treatment groups with one-way ANOVA. The functions report test statistics and p-values so the results can be interpreted at a selected significance level.

### Studio 9: Confidence intervals and Bayesian probabilities

Repeated samples from normal distributions are used to estimate the error rate of z-based and t-based confidence intervals for a mean. Another problem compares the prior and posterior probability assigned to parameter values inside a confidence interval, showing how frequentist intervals and Bayesian probabilities answer different questions. An optional polling exercise simulates binary responses and reports an approximate margin of error for the estimated proportion.

### Studio 10: Bootstrap confidence intervals

Bootstrap samples are drawn with replacement from each observed dataset to estimate uncertainty in the mean, median, and standard deviation. The script constructs both percentile and basic bootstrap confidence intervals, then repeats the procedure across many simulated datasets to estimate how often each interval misses the true value. It compares results for normal and log-normal data, illustrating how interval performance can depend on the shape of the distribution.

The scripts define functions; run a function by sourcing its studio file and calling it with the arguments described in the code. Some functions print numerical summaries, and others also draw plots in R's graphics device.

## Requirements

- R (base R is used for Studios 5–9).
- The `matrixStats` package for the optimized bootstrap implementation in Studio 10:

  ```r
  install.packages("matrixStats")
  ```

  Studio 10 also includes a loop-based bootstrap implementation that can be selected by changing `run_bootstrap = run_bootstrap_matrixStats` to `run_bootstrap = run_bootstrap_loop`; the package is still loaded at the top of the supplied script.
- Studio 6, Problem 0 and Problem 1d, source additional course helper scripts (`mit18_05_s22_studio6_problem0_draw_plot.r` and `mit18_05_s22_studio6_problem_1d.r`). Keep those helper files available at the paths expected by the script, or adjust the `source()` calls.
- Data files are required by the data-driven functions in Studio 6 Problems 2a/2b and Studio 8 Problem 3. Pass the appropriate CSV or table file path to the function.

## Running the scripts

1. Open R or RStudio and set the working directory to the folder containing the scripts and any required data/helper files.
2. Source the script for the studio you want to use. For example:

   ```r
   source("mit18_05_s22_studio5_done.r")
   ```

3. Call a function from that studio. For example, Studio 5 simulates rolls of an eight-sided die and updates from a uniform prior:

   ```r
   studio5_problem_1b(prior = rep(1 / 5, 5), nrolls = 20)
   ```

   The Studio 5 prior entries correspond, in order, to D4, D6, D8, D12, and D20. Other functions document their arguments in comments above their definitions.

Example calls for functions that read data:

```r
studio6_problem_2a("lighthouse_data.csv")
studio6_problem_2b("lighthouse_data.csv")
studio8_problem_3("contingency_data.txt", alpha = 0.05)
```

Use the actual filenames and column/table format expected by your course data. Studio 6's provided functions expect the lighthouse CSV to include `X` and `position` columns. Studio 8 Problem 3 reads a table with `read.table()`.

## Notes

- Simulation and bootstrap results vary from run to run unless you set an R random seed with `set.seed(...)` before calling a function.
- Studio 6's script contains a machine-specific `setwd()` call. Update or remove it if the helper files are stored elsewhere; paths passed to `source()` and data-reading functions must also resolve from the working directory.
- These are educational studio solutions, not a packaged R library. Run the corresponding MIT OCW studio instructions alongside the code for full problem context and interpretation.

## Source and attribution

Course materials: [MIT OpenCourseWare — 18.05 Introduction to Probability and Statistics, Spring 2022](https://ocw.mit.edu/courses/18-05-introduction-to-probability-and-statistics-spring-2022/). Studio materials were authored by Jeremy Orloff and Jennifer French. Refer to MIT OCW's [terms of use](https://ocw.mit.edu/terms/) when reusing or sharing course materials.

