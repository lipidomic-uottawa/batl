# BATL - Bayesian annotations for targeted lipidomics

## Introduction
Bioinformatic tools capable of annotating, rapidly and reproducibly, large targeted lipidomic datasets are limited. Specifically, few programs enable high-throughput peak assessment of liquid chromatography-electrospray ionization tandem mass spectrometry (LC-ESI-MS/MS) data acquired in either selected or multiple reaction monitoring (SRM and MRM) modes. We present here Bayesian Annotations for Targeted Lipidomics (BATL), a Gaussian naïve Bayes classifier for targeted lipidomics, that annotates peak identities according to eight features related to retention time, intensity, and peak shape. Lipid identification is achieved by modelling distributions of these eight input features across biological conditions and maximizing the joint posterior probabilities of all peak identities at a given transition.

## News

Last edited 31-May-2021
- Check out the Wiki pages for extended documentation
- Check the R package NEWS section for changes.

## Requisite software

* Install [R](https://www.r-project.org/) version 3.6.0 or greater
* (Optional but recommended:) Install [RStudio](https://rstudio.com/)

## Installation (two ways)

* R novices can download the ``batl_installer.R`` script and run it in R to automatically download the batl_X.XX.X.tar.gz package in this repository and install it on their machine with any package dependencies
* Users familiar with R can download the batl_X.XX.X.tar.gz file and install it via ``install.packages("/path_to_file/batl_X.XX.X.tar.gz", repos = NULL, type = "source", dependencies = TRUE)``
  * If installation fails, install the package dependencies manually according to the error message
    
## Instructions

Check out the Wiki page tabs for an overview of R/RStudio and detailed vignettes on how to use BATL. Once BATL has been installed, documentation can also be accessed within R using the following commands:

Display general documentation:
* ``help(package = "batl") # opens BATL help panel in RStudio``

Open BATL vignette/tutorial:
* ``vignette(package = "batl", topic = "batl-Introduction")``

## Quickstart scripts

1. ``batl_installer.R``: automatically installs BATL and package dependencies.
2. ``batl_train_model.R``: trains the BATL model on some toy data.
3. ``batl_annotate_peaks.R``: applies the trained BATL model from ``batl_train_model.R`` to a toy dataset, assigning lipid barcodes and artifacts/isotopes.

## Citation

The pre-print is available at [https://www.biorxiv.org/content/10.1101/2021.03.18.435788v1](https://www.biorxiv.org/content/10.1101/2021.03.18.435788v1)

## Contact

BATL is developed and maintained by the [Bennett](http://www.med.uottawa.ca/lipidomics/) and [Perkins](https://www.perkinslab.ca/) labs at the University of Ottawa. Technical questions/issues can be posted on the [Issues](https://github.com/lipidomic-uottawa/batl/issues) page or emailed directly to [jchit069@uottawa.ca](mailto:jchit069@uottawa.ca)
