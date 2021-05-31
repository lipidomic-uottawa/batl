################################################################################
## ANNOTATING LIPID IDENTITIES AND ARTIFACTS/ISOTOPES - EXAMPLE                #
## Author: Justin Chitpin                                                      #
## Date: 31 May 2021                                                           #
## Description: Assign lipid identities to targeted lipidomics peak file base  #
## on the training set from batl_train_model.R                                 #
## Modify the USER PARAMETERS section starting on line 14 to substitute your   #
## own data.                                                                   #
################################################################################

## Clear environment
rm(list=ls())

## PARAMETERS ##################################################################
filenames <- system.file("extdata", "Example_peak_file_1.txt", package = "batl")
#filenames <- c("/path/to/your/file_1.txt", "/path/to/your/file_2.txt")
model_filename <- "Test_model.txt"
savenames <- c("Example_peak_file_1_labelled.txt")
category <- "SP" # 'SP' for sphingolipids
retention_tolerance <- 2 # Number of significant figures after decimal place
deartifact_tolerance <- 0.5 # Q1 tolerance for deisotoping/artifacting
qstandard <- "C16-D31 Ceramide" # internal standard present in all files above
qstandard_col <- "Component Name" # Column name where the qstandard is located
subtract_constant <- 100 # if subtracted RT is used; same value as training set
exceptions <- c("TIC", "ADC") # rows to avoid barcoding from Mass Info column
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

if (model_filename == "Test_model.txt" && !file.exists("Test_model.txt")) {
  stop("Model Test_model.txt not found. Run batl_train_model.R script first.")
}
if (length(filenames) != length(savenames)) {
  stop("Length of filenames must equal length of savenames.")
}

## Assign lipid annotations to files
labelled_files <- nb_label_peaks(
    filenames = filenames,
    model_filename = model_filename,
    qstandard = qstandard,
    qstandard_col = qstandard_col,
    subtract_constant = subtract_constant,
    exceptions = exceptions)

## In-source artifacts/isotopes
deartifacted_files <- deartifact_peaks(
    filenames = labelled_files,
    category = category,
    Q1_tolerance = deartifact_tolerance,
    retention_tolerance = retention_tolerance,
    exceptions = exceptions)

## Export
for (i in seq_along(labelled_files)) {
    nb_export_labelled_file(
        labelled_file = labelled_files[[i]], filename = savenames[i])
}
message("End of training BATL peak labelling.")
################################################################################
