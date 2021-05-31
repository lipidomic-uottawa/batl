################################################################################
## TRAINING BATL - EXAMPLE                                                     #
## Author: Justin Chitpin                                                      #
## Date: 31 May 2021                                                           #
## Description: Example script to train the BATL model on some toy data using  #
## a single combination of features.                                           #
## Modify the USER PARAMETERS section starting on line 14 to substitute your   #
## own data.                                                                   #
################################################################################

## Clear environment
rm(list=ls())

## USER PARAMETERS TO CHANGE ###################################################
saved_model_name <- "Test_model.txt"
training_set <- batl::srm_tc # use the line below to load your own training set
#training_set <- nb_import_library("/path/to/your/training_set.txt") # load tab-delimited training set
features <- c(
  "Retention Time",
  "Area",
  "Height",
  "Width at 50%",
  "Tailing Factor",
  "Asymmetry Factor",
  "Relative RT",
  "Subtracted RT")
standard <- c("SPH000001") # Standard in each sample for normalizing features
tolerance <- 0.5 # Machine tolerance for Q1 and Q3 of Mass.Info

## Leave on out cross validation (as many folds as there are samples)
folds <- nrow(unique(training_set, by = c("Filename", "Sample.Name")))
################################################################################

##DO NOT EDIT ##################################################################
## Load packages including BATL. An error indicates BATL needs to be installed
packs <- c(
  "data.table",
  "doFuture",
  "future",
  "foreach",
  "igraph",
  "openxlsx",
  "progressr",
  "batl")
to_install <- packs[!(packs %in% installed.packages()[,"Package"])]
if (length(to_install) > 0) {
  stop("BATL and/or dependency packages not installed. Run batl_installer.R")
}
library("batl")       # targeted lipid annotation package
library("data.table") # data table manipulation for this vignette
library("progressr")  # extra functionality for progress bar (optional)

## Train BATL model with the specified features
progressr::handlers("progress")
nb_model <- nb_build_model(
    library = training_set,
    folds = folds,
    features = features,
    exhaustive = FALSE,
    decision = "MWBM",
    tolerance = tolerance,
    parallel_cores = 1,
    full_output = FALSE)

nb_export_model(
  nb_model = nb_model$model[[1]], # exports first model assuming exhaustive = FALSE
  filename = saved_model_name)
message("End of training BATL model.")
################################################################################
