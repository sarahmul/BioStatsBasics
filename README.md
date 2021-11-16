# BioStatsBasics

# Fall 2021

## How to open command line [instructions](https://towardsdatascience.com/a-quick-guide-to-using-command-line-terminal-96815b97b955)

## Setup Option 1
* R & RStudio
    * [Download](https://cloud.r-project.org/) and install R
    * [Download](https://www.rstudio.com/products/rstudio/download/#download) and install RStudio, an Integrated Development Environment (IDE) for R
* Anaconda Python
    * [Download](https://www.anaconda.com/download/) and install Python 3.8 Anaconda
* Jupyter Notebooks
    * Automatically installed as part of Anaconda. More information at [Project Jupyter](http://jupyter.org/).
    * To start the notebook server from the command line/command prompt type 'jupyter notebook' 
    * If this doesn't work, you can type in the command line/command prompt 'conda install jupyter'
* Download R kernel for Juptyer notebook
    * [Download](https://irkernel.github.io/installation/) and make available the kernel to Jupyter

## Setup Option 2
* Anaconda Python
    * [Download](https://www.anaconda.com/download/) and install Python 3.8 Anaconda
* Open the command line (Mac) or command prompt (Windows) type in:
   *  'conda create -n R_class r-essentials r-base r-irkernel jupyter r-ggplot2 r-dplyr r-gtools'
   *  'conda activate R_class'
   *  'conda list' (this will list all of the packages you just installed)


## Random variables, distributions, and sampling
* iPython notebook (RVDistSamp.ipynb) describes:
    * Random Variables: Discrete and Continuous Analysis
    * Cumulative Probability Distributions, Cumulative Density Functions, Probability Density Functions, and Probability Mass Functions
    * The Law of Large Numbers
    * Central Limit Theorem

* Note: There is an equivalent R/R-studio file (RVDistSamp.R)

## Intro to Inferential Statistics:Parametric and Non-Parametric
*  iPython notebook (InferentialStats.ipynb) describes:
    * One Sample, Two Sample, and Paired Tests for Continuous and Discrete data
      - Parametric
      - Non-parametric

* Note: There is an equivalent R/R-studio file (InferentialStats.R)
