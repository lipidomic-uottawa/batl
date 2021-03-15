# BATL - Bayesian annotations for targeted lipidomics

## Introduction

Bioinformatic tools capable of annotating, rapidly and reproducibly, large targeted lipidomic datasets are limited. Specifically, few programs enable high-throughput assessment of liquid chromatography-electrospray ionization tandem mass spectrometry (LC-ESI-MS/MS) data acquired in either selected or multiple reaction monitoring (SRM and MRM) modes. Bayesian Annotations for Targeted Lipidomics (BATL) is a Gaussian naïve Bayes classifier for targeted lipidomics which describes peaks with eight features related to retention time, intensity, and peak shape. Lipid identification is achieved by modelling distributions of input features across biological conditions and maximizing the joint posterior probabilities of all peak identities at a given transition.

## News

Last edited 15-March-2021
- Check out the Wiki pages for extended documentation
- Check the R package NEWS section for changes.

## Installation

* Download the latest batl_X.XX.X.tar.gz 
* Install [R](https://www.r-project.org/) version 3.6.0 or greater
* (Optional:) Install [RStudio](https://rstudio.com/)
* In the R/RStudio console:
  * ``install.packages("/path_to_file/batl_X.XX.X.tar.gz", repos = NULL, type="source", dependencies = TRUE)``
  * If installation fails, install the package dependencies manually
  
## Instructions

* Check out the Wiki page tabs if you are unfamiliar with installing R packages
* Sample scripts to get started are provided here (TBD)

Display general documentation:  
* ``help(package = "batl") # Opens help panel in RStudio``

Open BATL vignette/tutorial:
* ``vignette(package = "batl", topic = "batl-Introduction")``
* The vignettes/documentation are also available on the Wiki page tabs.

## Citation

The pre-print is available at (TBD)

## Contact

BATL is developed and maintained by the [Bennett](http://www.med.uottawa.ca/lipidomics/) and [Perkins](https://www.perkinslab.ca/) labs at the University of Ottawa. Technical questions/issues can be posted on the [Issues](https://github.com/lipidomic-uottawa/batl/issues) page or emailed directly to [jchit069@uottawa.ca](mailto:jchit069@uottawa.ca)
