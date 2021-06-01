################################################################################
## APPENDING BATL TRAINING SET - EXAMPLE                                       #
## Author: Justin Chitpin                                                      #
## Date: 01 June 2021                                                          #
## Description: Example script to append labelled peaks to the original BATL   #
## training set                                                                #
## Input: Modify the USER PARAMETERS section starting on line 15 to substitute #
## your own data (training set and labelled peak file(s))                      #
## Output: Updated BATL training set                                           #
################################################################################

## Clear environment
rm(list=ls())

## PARAMETERS ##################################################################
my_training_set <- batl::srm_tc
#my_training_set <- "/path/to/your/training_set.txt" # load your own tab-delimited training set
filenames <- system.file("extdata", "Example_peak_file_1.txt", package = "batl") # original unlabelled peak file
savename <- "Test_training_set_appended.txt"
my_labelled_files <- c("Example_peak_file_1_labelled.txt") # labelled peak file
barcode_decision <- "Barcode_MWBM" # Only allow Barcode MWBM to be merged
qstandard <- "C16-D31 Ceramide" # internal standard present in all files above
qstandard_col <- "Component Name" # Column name where the qstandard is located
subtract_constant <- 100 # if subtracted RT is used; same value as training set
exceptions <- c("TIC", "ADC")
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

if (my_model == "Test_model.txt" && !file.exists("Test_model.txt")) {
  stop("Model Test_model.txt not found. Run batl_train_model.R script first.")
}
if (length(filenames) != length(my_labelled_files)) {
  stop("Length of filenames must equal length of savenames.")
}
if (is.character(my_training_set)) {
  my_training_set <-  nb_import_library(my_training_set)
}

new_library <- nb_append_library(
  library = my_training_set, # importing stored training set
  labelled_files = nb_import_labelled_file_list(my_labelled_files), # importing stored labelled peak files
  filenames = filenames,
  qstandard = qstandard,
  qstandard_col = qstandard_col,
  subtract_constant = subtract_constant,
  barcode_decision = barcode_decision,
  exceptions = exceptions)

nb_export_library(
  library = new_library,
  filename = savename)
################################################################################
