# MIT 18.05 Studios 1–4

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
