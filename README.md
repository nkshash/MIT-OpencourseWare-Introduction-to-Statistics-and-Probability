# MIT 18.05 — Introduction to Probability & Statistics

A study-focused repository documenting my work through **MIT OpenCourseWare 18.05: Introduction to Probability and Statistics (Spring 2022)**. It combines concise concept notes with R simulations and visualizations to connect probability models, statistical inference, and computational experiments.

> **Study approach:** understand the mathematical idea, implement or run a simulation, compare the empirical result with the theoretical result, and record what the experiment demonstrates.

---

## Course and study status

| Item | Details |
|---|---|
| Course | MIT 18.05 — Introduction to Probability and Statistics |
| Offering | Spring 2022 |
| Platform | MIT OpenCourseWare |
| Main language | R |
| Course lecture sequence | Completed |
| R tutorials | Completed |
| Studio work represented here | Studios 1–10 |

*Studio completion is tracked separately from lecture and R-tutorial completion.*

## What this repository covers

- **Probability foundations:** sample spaces, events, counting, conditional probability, independence, and Bayes' theorem.
- **Random variables and distributions:** expectation, variance, joint distributions, covariance, and correlation.
- **Limit theorems and simulation:** the Law of Large Numbers, Central Limit Theorem, Monte Carlo-style experiments, and empirical versus theoretical results.
- **Statistical inference:** estimation, likelihood, Bayesian updating, confidence intervals, and hypothesis testing.
- **Resampling and regression:** bootstrap intervals, least squares, linear models, residuals, and model fit.

## Learning map

### Probability foundations

| Topic | Key ideas |
|---|---|
| Experiments and events | Experiment, sample space, event, union, intersection, complement |
| Counting | Product rule, permutations, combinations |
| Conditional probability | Conditional probability, independence, Bayes' theorem |
| Random variables | Discrete and continuous distributions, expectation, variance |
| Multiple variables | Joint distributions, covariance, correlation |
| Asymptotic behaviour | Law of Large Numbers, Central Limit Theorem |
| Computational probability | Simulation and comparison with exact probabilities |

### Statistics and inference

| Topic | Key ideas |
|---|---|
| Statistical practice | Experimental design, data collection, descriptive and inferential statistics |
| Estimation | Statistics, parameters, point estimates, interval estimates |
| Likelihood | Parametric models, likelihood, log-likelihood, maximum likelihood estimation |
| Bayesian inference | Priors, likelihoods, posteriors, odds, Bayes factors, predictive probabilities |
| Confidence intervals | Normal, Student's *t*, and chi-square intervals |
| Hypothesis testing | Null and alternative hypotheses, test statistics, significance, Type I error, power |
| Resampling | Empirical distributions, nonparametric and parametric bootstrap |
| Regression | Least squares, simple and multiple linear regression, polynomial regression, residuals, $R^2$, overfitting |

---


### Probability distributions

The course studies discrete and continuous probability distributions, along with joint models and sampling distributions used in statistical inference.

#### Discrete distributions

| Distribution | Typical use / interpretation |
|---|---|
| **Bernoulli** | Models one trial with two outcomes, usually success or failure. |
| **Binomial** | Counts the number of successes in a fixed number of independent Bernoulli trials with a common success probability. |
| **Geometric** | Models the number of trials required to obtain the first success. |
| **Negative Binomial** | Models the number of trials, or failures before a specified number of successes, depending on the parameterization. |
| **Hypergeometric** | Counts successes in draws made without replacement from a finite population. |
| **Poisson** | Models event counts over a fixed interval when events occur at a constant average rate under the model's assumptions. |
| **Discrete Uniform** | Assigns equal probability to each value in a finite set. |

#### Continuous distributions

| Distribution | Typical use / interpretation |
|---|---|
| **Continuous Uniform** | Models a value equally likely to fall anywhere within a specified interval. |
| **Exponential** | Models waiting times between events in a Poisson process; its rate parameter is $\lambda$. |
| **Normal (Gaussian)** | A symmetric, bell-shaped distribution used widely in probability and statistical inference. |
| **Gamma** | A family of positive-valued distributions that includes the exponential distribution as a special case. |
| **Beta** | A distribution on $[0,1]$, often used to model probabilities and as a prior for a Bernoulli or binomial probability. |
| **Chi-square ($\chi^2$)** | Used in inference for normal-population variance and in several goodness-of-fit and independence tests. |
| **Student's *t*** | Used for inference about a normal-population mean when the population variance is unknown. |
| **F-distribution** | Used in variance-ratio procedures and analysis of variance (ANOVA). |

#### Joint and sampling distributions

- **Bivariate Normal:** A joint distribution for two normally distributed random variables, allowing their dependence to be represented through covariance or correlation.
- **Multinomial:** A generalization of the binomial model for counts across more than two categories in a fixed number of trials.
- **Sampling distributions:** Distributions of statistics calculated from repeated samples, such as the sample mean $\bar{x}$ and sample variance $s^2$. These distributions underpin confidence intervals and hypothesis tests.

#### Test distributions and common test statistics

| Test distribution | Test statistic | Common use |
|---|---|---|
| **Standard Normal (Z)** | $z = \dfrac{\bar{x}-\mu_0}{\sigma/\sqrt{n}}$ | Testing a population mean when the population standard deviation $\sigma$ is known; normal approximations are also used for large-sample proportions. |
| **Student's *t*** | $t = \dfrac{\bar{x}-\mu_0}{s/\sqrt{n}}$, with $df=n-1$ | Testing a population mean when the population standard deviation is unknown and is estimated using the sample standard deviation $s$. |
| **Chi-square ($\chi^2$)** | $\chi^2 = \sum_i \dfrac{(O_i-E_i)^2}{E_i}$ | Goodness-of-fit tests and tests of independence in contingency tables. |
| **Binomial** | $X$ is the number of successes, with $X\sim\mathrm{Bin}(n,p_0)$ under the null hypothesis | Exact tests for a small sample of binary outcomes, without relying on a normal approximation. |
| **F** | For a two-variance comparison, $F=\dfrac{s_1^2}{s_2^2}$, with appropriate degrees of freedom | Comparing variances of independent normal populations. In ANOVA, an F statistic compares between-group variation with within-group variation. |

*Notation:* $\bar{x}$ is the sample mean, $\mu_0$ is the hypothesized population mean, $\sigma$ is the known population standard deviation, $s$ is the sample standard deviation, $n$ is the sample size, and $O_i$ and $E_i$ are observed and expected counts. The exact reference distribution and degrees of freedom depend on the test and its assumptions.

## Studio work

The R scripts in this repository implement simulations and visualizations for Studios 1–10. Each studio is intended to be studied alongside its corresponding MIT OCW instructions.

### Probability and simulation

#### Studio 1 — Birthday matching and derangements([tutorial_r/mit18_05_s22_studio1_done.r](tutorial_r/mit18_05_s22_studio1_r_t1.r))

Simulates birthdays assigned independently and uniformly across the days of a year. Each simulated room is one trial; the estimated probability of a shared birthday is the fraction of rooms containing at least one match. The optional derangement simulation estimates the probability that a random permutation leaves no item in its original position.

**Study focus:** sample spaces, simulation, pair counts, and empirical probability.

#### Studio 2 — Binomial probabilities and expected payoff([tutorial_r/mit18_05_s22_studio2_done.r](tutorial_r/mit18_05_s22_studio2_done.r))

Models the number of heads in a fixed number of independent coin tosses with a binomial distribution. Simulated probabilities are compared with exact binomial probabilities. The gambling-game payoff for $k$ heads is $k^2 - 7k$, and its expected value is calculated as a probability-weighted average.

**Study focus:** binomial distributions, cumulative probabilities, expectation, and decision-making under uncertainty.

#### Studio 3 — Exponential distributions and averages([tutorial_r/mit18_05_s22_studio3_done.r](tutorial_r/mit18_05_s22_studio3_done.r))

Uses exponential waiting-time samples with rate parameter $\lambda$, for which the mean is $1/\lambda$. Histograms compare individual observations with sample averages. The standard deviation of the average of $n$ independent observations is $1/(\lambda\sqrt{n})$.

**Study focus:** continuous distributions, sampling distributions, variability of averages, and the Central Limit Theorem.

#### Studio 4 — Covariance, correlation, and the Central Limit Theorem([tutorial_r/mit18_05_s22_studio4_done.r](tutorial_r/mit18_05_s22_studio4_done.r))

Simulates roulette winnings. A one-dollar bet on red earns $+1$ with probability $18/38$ and $-1$ with probability $20/38$. Shared games create covariance between two players' winnings; additional independent games increase one player's variance and tend to reduce the correlation. A final simulation compares sums of roulette outcomes with a normal curve.

**Study focus:** covariance, correlation, dependence, and normal approximation.

### Statistics and inference

#### Studio 5 — Bayesian updating with dice([tutorial_r/mit18_05_s22_studio5_done.r](tutorial_r/mit18_05_s22_studio5_done.r))

Treats five dice with 4, 6, 8, 12, or 20 sides as competing hypotheses. Each roll updates prior probabilities using the likelihood of the observed result. The optional censored-data exercise uses only whether a roll is a 1. A zero-prior example demonstrates that Bayesian updating cannot assign positive posterior probability to a hypothesis whose prior probability is zero.

**Study focus:** hypotheses, likelihood, prior and posterior distributions, and sequential evidence.

#### Studio 6 — Cauchy distributions and the lighthouse problem([tutorial_r/mit18_05_s22_studio6_done.r](tutorial_r/mit18_05_s22_studio6_done.r))

Compares normal and Cauchy distributions, with emphasis on the effect of heavy tails on sample averages. The lighthouse exercise estimates an unknown location from observed landing positions by evaluating a Cauchy likelihood over a grid, updating a uniform prior, and plotting posterior distributions and maximum a posteriori (MAP) estimates.

**Study focus:** heavy-tailed distributions, likelihood, Bayesian inference, and MAP estimation.

#### Studio 7 — Significance, power, and testing decisions([tutorial_r/mit18_05_s22_studio7_done.r](tutorial_r/mit18_05_s22_studio7_done.r))

Uses repeated coin tosses to study hypothesis testing. It constructs rejection regions for a selected significance level and evaluates Type I error and power under an alternative probability of heads. Simulations compare rejection frequencies across repeated experiments.

**Study focus:** significance level, rejection regions, Type I error, power, and testing trade-offs.

#### Studio 8 — Hypothesis tests and ANOVA([tutorial_r/mit18_05_s22_studio8_done.r](tutorial_r/mit18_05_s22_studio8_done.r))

Applies statistical tests to simulated and observed data. The problems use sample summaries to test population means, assess association in contingency tables, and compare average responses across three treatment groups using one-way ANOVA. The functions report test statistics and p-values.

**Study focus:** test selection, p-values, categorical association, and analysis of variance.

#### Studio 9 — Confidence intervals and Bayesian probabilities([tutorial_r/mit18_05_s22_studio9_done.r](tutorial_r/mit18_05_s22_studio9_done.r))

Uses repeated samples from normal distributions to examine the error rates of z-based and t-based confidence intervals for a mean. It also compares frequentist confidence intervals with Bayesian posterior probabilities and includes an optional polling exercise for binary responses.

**Study focus:** interval estimation, coverage, z and t procedures, and frequentist–Bayesian interpretation.

#### Studio 10 — Bootstrap confidence intervals ([tutorial_r/mit18_05_s22_studio10_done.r](tutorial_r/mit18_05_s22_studio10_done.r))

Resamples observations with replacement to estimate uncertainty in the mean, median, and standard deviation. It constructs percentile and basic bootstrap intervals and evaluates their performance across repeated datasets, including normal and log-normal data.

**Study focus:** bootstrap sampling, interval construction, sampling variability, and the effect of distribution shape.

---

## Probability concepts reference

- **Experiment:** A repeatable process with clearly defined possible outcomes.
- **Sample space:** The set of all possible outcomes of an experiment.
- **Event:** A subset of the sample space.
- **Probability:** A number from 0 to 1 measuring the likelihood of an event; the total probability over the sample space is 1.
- **Set operations:** Union means “A or B,” intersection means “A and B,” and complement means “not A.”
- **Counting principle:** The product rule counts multi-step outcomes by multiplying the number of choices at each step.
- **Permutations and combinations:** Arrangements where order matters, and selections where order does not matter, respectively.
- **Conditional probability:** The probability of an event given that another event has occurred.
- **Independence:** Two events are independent when learning that one occurred does not change the probability of the other.
- **Bayes' theorem:** A rule for updating the probability of a hypothesis using observed evidence.
- **Random variable:** A numerical value assigned to each outcome of a random experiment.
- **Probability distribution:** A description of the possible values of a random variable and their probabilities or density.
- **Expectation:** The probability-weighted average value of a random variable.
- **Variance and standard deviation:** Measures of spread around the expectation.
- **Joint distribution:** A probability model for two or more random variables together.
- **Covariance:** A measure of how two variables vary together in their original units.
- **Correlation:** A standardized measure of the direction and strength of a linear relationship.
- **Law of Large Numbers:** Under its assumptions, the sample average approaches the expected value as the number of independent repetitions grows.
- **Central Limit Theorem:** Under suitable conditions, standardized sums or averages of many independent variables are approximately normal.
- **Simulation:** Repeated computer-generated trials used to estimate probabilities and explore random behaviour.

## Statistics concepts reference

### Statistical practice and estimation

- **Experimental design:** Planning data collection so it can answer a question reliably and fairly.
- **Data collection:** Gathering observations through experiments, surveys, or other systematic procedures.
- **Descriptive statistics:** Summaries and visualizations such as the mean, median, interquartile range, histogram, and empirical CDF.
- **Inferential statistics:** Using sample data and a statistical model to draw conclusions about a broader process or population.
- **Statistic and parameter:** A statistic is computed from data; a parameter describes a population or model and is often unknown.
- **Point and interval estimates:** A single estimated value, or a range of plausible values, for an unknown parameter.
- **Likelihood and log-likelihood:** The probability or density of observed data under a model, viewed as a function of its unknown parameter; the log-likelihood is often easier to work with.
- **Maximum likelihood estimate (MLE):** The parameter value that maximizes the likelihood of the observed data.

### Bayesian inference

- **Prior:** Probability assigned to a hypothesis or parameter before considering the current data.
- **Likelihood:** How probable the observed data are under a hypothesis or parameter value.
- **Posterior:** The updated probability after combining the prior and likelihood using Bayes' theorem.
- **Bayesian updating:** Revising prior beliefs as evidence is observed.
- **Predictive probability:** The probability assigned to a future observation while accounting for uncertainty in the model or its parameters.
- **Odds:** The ratio of the probability of an event to the probability of its complement.
- **Likelihood ratio / Bayes factor:** A ratio comparing how well observed data support competing hypotheses.
- **Base-rate fallacy:** Overlooking how common a hypothesis was before observing the evidence.

### Confidence intervals and hypothesis testing

- **Confidence interval:** An interval-producing method that, under its assumptions and over repeated samples, contains the fixed true parameter at its stated rate.
- **Normal confidence interval:** An interval based on the normal distribution.
- **Student's *t* interval:** A mean interval using the *t* distribution, commonly used when the population standard deviation is unknown and estimated from the sample.
- **Chi-square interval:** An interval for a normal population variance based on the chi-square distribution.
- **Null and alternative hypotheses:** The reference claim and the competing claim assessed by a test.
- **Test statistic:** A quantity calculated from data to measure compatibility with the null hypothesis.
- **Significance level:** The chosen maximum probability of rejecting a true null hypothesis under the test assumptions.
- **Rejection region:** The set of test-statistic values for which the test rejects the null hypothesis.
- **Type I error:** Rejecting the null hypothesis when it is true.
- **Confidence interval and testing:** For many standard procedures, values excluded by a matching confidence interval are also rejected by the corresponding two-sided test.

### Bootstrap and resampling

- **Resampling:** Repeatedly drawing samples from observed data or a fitted model to study the variability of a statistic.
- **Empirical distribution:** A distribution that assigns equal probability to each observed data point, including repeats.
- **Nonparametric bootstrap:** Sampling with replacement from observed data without specifying a parametric population model.
- **Parametric bootstrap:** Simulating data from a fitted parametric model and recalculating a statistic.
- **Bootstrap confidence interval:** An interval estimated from the distribution of resampled statistic values.
- **Percentile interval:** An interval formed from selected quantiles of bootstrap estimates.
- **Basic interval:** An interval formed by reflecting bootstrap quantiles around the original estimate.

### Regression

- **Regression:** Modeling the relationship between a response variable and one or more predictors.
- **Least squares:** Choosing coefficients to minimize the sum of squared differences between observed and predicted responses.
- **Simple linear regression:** A straight-line model with one predictor.
- **Polynomial regression:** A model using powers of a predictor to represent a curved relationship while remaining linear in its coefficients.
- **Residual:** The difference between an observed response and its predicted value.
- **Homoscedasticity:** The assumption that residual variance is roughly constant across predictor values; changing variance is heteroscedasticity.
- **Overfitting:** Fitting observed data, including noise, so closely that performance on new data may be poor.
- **Coefficient of determination ($R^2$):** A measure, in common regression settings, of the proportion of response variability accounted for by the fitted model.
- **Multiple linear regression:** A linear model with multiple predictors.
- **Regression to the mean:** The tendency for unusually high or low measurements to be followed, on average, by measurements closer to the population mean when measurements are imperfectly correlated.

---

## Setup

### Requirements

- R
- RStudio (recommended, but not required)
- `matrixStats` for the optimized bootstrap implementation in Studio 10

Install the package with:

```r
install.packages("matrixStats")
```

Studio 10 also contains a loop-based bootstrap implementation. The script can be configured to use `run_bootstrap_loop` instead of `run_bootstrap_matrixStats`; note that the supplied script still loads `matrixStats` at the top.

### Running a studio

1. Open R or RStudio.
2. Set the working directory to the folder containing the studio scripts and any required data/helper files.
3. Source the relevant script.
4. Call the function for the problem you want to run.

Example — source Studio 5 and simulate 20 rolls under a uniform prior:

```r
source("mit18_05_s22_studio5_done.r")

studio5_problem_1b(
  prior = rep(1 / 5, 5),
  nrolls = 20
)
```

The prior entries correspond, in order, to D4, D6, D8, D12, and D20. Function arguments are documented in comments above the corresponding function definitions.

### Functions that read external data

Examples:

```r
studio6_problem_2a("lighthouse_data.csv")
studio6_problem_2b("lighthouse_data.csv")
studio8_problem_3("contingency_data.txt", alpha = 0.05)
```

Use the filenames and formats expected by the functions. The Studio 6 lighthouse CSV is expected to contain `X` and `position` columns. Studio 8 Problem 3 reads a table with `read.table()`.

### Dependencies and helper files

- Studio 6, Problem 0 and Problem 1d, source additional helper scripts: `mit18_05_s22_studio6_problem0_draw_plot.r` and `mit18_05_s22_studio6_problem_1d.r`.
- Keep those helper files at the paths expected by the script, or update the relevant `source()` calls.
- Studio 6's script contains a machine-specific `setwd()` call. Update or remove it if your local folder structure differs.
- Data files are needed by Studio 6 Problems 2a/2b and Studio 8 Problem 3. Supply the appropriate file paths when calling those functions.

---

## Suggested study workflow

For each topic or studio:

1. **Review the concept:** write down the definition, assumptions, and key formulae.
2. **Work through the course material:** attempt the problem before looking at a completed implementation.
3. **Run the R code:** vary inputs such as sample size, number of trials, or model parameters.
4. **Check the theory:** compare simulated results with exact probabilities or theoretical expectations where available.
5. **Interpret the output:** explain what the numerical result or plot demonstrates, including any limitations.
6. **Record takeaways:** add a short note on mistakes, useful identities, and questions to revisit.

## Reproducibility notes

- Simulation and bootstrap results vary between runs. Use `set.seed(...)` before a function call when you need reproducible results.
- These scripts are educational studio work, not a packaged R library.
- Run the corresponding MIT OCW studio instructions alongside the code for the full problem context and interpretation.
- Some functions print numerical summaries; others also draw plots in R's graphics device.

## Course materials and attribution

Course: [MIT OpenCourseWare — 18.05 Introduction to Probability and Statistics, Spring 2022](https://ocw.mit.edu/courses/18-05-introduction-to-probability-and-statistics-spring-2022/)

Studio materials were authored by Jeremy Orloff and Jennifer French. Refer to [MIT OpenCourseWare's Terms of Use](https://ocw.mit.edu/terms/) when reusing or sharing course materials.

---

*This README is a learning log and technical guide. It is intended to make the concepts, experiments, and execution steps easy to review as the repository develops.*
