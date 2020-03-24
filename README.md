
<!-- README.md is generated from README.Rmd. Please edit that file -->

# simhelpers

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/meghapsimatrix/simhelpers.svg?branch=master)](https://travis-ci.org/meghapsimatrix/simhelpers)
[![Codecov test
coverage](https://codecov.io/gh/meghapsimatrix/simhelpers/branch/master/graph/badge.svg)](https://codecov.io/gh/meghapsimatrix/simhelpers?branch=master)
<!-- badges: end -->

Simulations are experiments designed to study the performance of
statistical methods under known data-generating conditions (Morris,
White & Crowther, 2018). Methodologists examine questions like: (1) how
does ordinary least squares (OLS) regression perform if errors are
heteroskedastic? (2) how does the presence of missing data affect
treatment effect estimates from a propensity score analysis? (3) how
does cluster robust variance estimation perform when the number of
clusters is small? To answer such questions, we conduct experiments by
simulating thousands of datasets from pseudo-random sampling (Morris et
al., 2018).

The goal of `simhelpers` is to assist in running simulation studies.
This package provides a set of functions that calculates various
performance measures like bias, root mean squared error, rejection
rates, and also calculates the associated Monte Carlo standard errors
(MCSE). These functions are divided into three major categories of
performance criteria: absolute criteria, relative criteria, and criteria
to evaluate hypothesis testing. The functions are created to work with
the [`tidyeval`](https://tidyeval.tidyverse.org/index.html) practice.

In addition to the set of functions that calculates performance measures
and MCSE, the package also includes a function, `create_skeleton()`,
that generates a skeleton outline of a simulation study. Another
function, `evaluate_by_row()`, runs the simulation for each combination
of conditions row by row and implements the
[`future_pmap()`](https://davisvaughan.github.io/furrr/reference/future_map2.html)
function from the [`furrr`](https://davisvaughan.github.io/furrr/)
package to run the simulation in parallel. The package also contains
several datasets that contain results from example simulation studies.

<img src="man/figures/workflow.png" />

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("meghapsimatrix/simhelpers")
```

## Related Work

The explanation of MCSE formulas and simulation workflow is based on
Morris et al. (2018). We want to recognize other R packages that offer
functions related to simulation studies. The
[`rsimsum`](https://cran.r-project.org/web/packages/rsimsum/index.html)
package (which has a lovely name that makes me hungry) also calculates
Monte Carlo standard errors. The
[`SimDesign`](https://cran.r-project.org/web/packages/SimDesign/index.html)
package offers generate-analyze-summarize skeleton of functions, ways to
deal with errors when running simulations, and parallel computing.

In contrast to the two packages mentioned above, our package works with
the [`tidyeval`](https://tidyeval.tidyverse.org/index.html) workflow and
outputs tibbles from the functions that can be used with
[`dplyr`](https://dplyr.tidyverse.org/index.html),
[`tidyr`](https://tidyr.tidyverse.org/) and
[`purrr`](https://purrr.tidyverse.org/) syntax easily. The functions
that calulate MCSEs are easy to run on grouped data which might be
useful as we would want to run performance summaries on combinations of
design parameters. For parallel computing, we use the
[`furrr`](https://davisvaughan.github.io/furrr/) and
[`future`](https://rstudio.github.io/promises/articles/futures.html)
packages. Moreover, compared to the `rsimsum` and `SimDesign` packages,
`simhelpers` provides jacknife MCSE for variance estimators. It also
provides jacknife MCSE estimates for root mean squared error.

The [`DeclareDesign`](https://declaredesign.org/) package allows users
to declare and diagnose research designs, fabricate mock data, and
explore tradeoffs between different designs. This package has very
different, although related, aims compared to our package as it focuses
more on research design and less on Monte Carlo simulations.

### References for Related Work

Bien J. (2016). The simulator: An Engine to Streamline Simulations.
<http://faculty.bscb.cornell.edu/~bien/simulator.pdf> CRAN:
<https://cran.r-project.org/web/packages/simulator/index.html>

Chan, T. J. (2014). ezsim: provide an easy to use framework to conduct
simulation. R package version 0.5.5.
<https://CRAN.R-project.org/package=ezsim>

Epskamp, S. (2019). parSim: Parallel Simulation Studies. R package
version 0.1.1. <https://CRAN.R-project.org/package=parSim>

Gasparini, A. (2018). rsimsum: Summarise results from Monte Carlo
simulation studies. Journal of Open Source Software, 3(26), 739,
<https://doi.org/10.21105/joss.00739> CRAN:
<https://cran.r-project.org/web/packages/rsimsum/index.html>

Goldfeld, K. (2019). simstudy: Simulation of Study Data. R package
version 0.1.15. <https://CRAN.R-project.org/package=simstudy>

Graeme B., Jasper C., Alexander C., and Macartan H. (2019). Declaring
and Diagnosing Research Designs. American Poliitcal Science Review
113(3): 838-859. URL <http://declaredesign.org/paper.pdf> CRAN:
<https://cran.r-project.org/web/packages/DeclareDesign/index.html>

Gorjanc G (2012). simSummary: Simulation summary. R package version
0.1.0. <https://cran.r-project.org/web/packages/simSummary/index.html>

Hofert M., & Maechler, M (2016). Parallel and Other Simulations in R
Made Easy: An End-to-End Study. Journal of Statistical Software, 69(4),
1-44. <doi:10.18637/jss.v069.i04> CRANL
<https://cran.r-project.org/web/packages/simsalapar/index.html>

Leschinski, C. H. (2019). MonteCarlo: Automatic Parallelized Monte Carlo
Simulations. R package version 1.0.6.
<https://CRAN.R-project.org/package=MonteCarlo>

Morris, T. P., White, I. R., & Crowther, M. J. (2019). Using simulation
studies to evaluate statistical methods. Statistics in medicine, 38(11),
2074-2102. <http://doi.org/10.1002/sim.8086>

Scheer, M. (2020). simTool: Conduct Simulation Studies with a Minimal
Amount of Source Code. R package version 1.1.5.
<https://CRAN.R-project.org/package=simTool>

Scott, E. (2019). holodeck: A Tidy Interface for Simulating Multivariate
Data. R package version 0.2.0.
<https://CRAN.R-project.org/package=holodeck>

## Acknowledgments

We are extremely thankful for the feedback provided by [Sangdon
Lim](https://sdlim.com/) and Man Chen.
