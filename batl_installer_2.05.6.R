################################################################################
## INSTALL BATL                                                                #
## Author: Justin Chitpin                                                      #
## Date: 01 June 2021                                                          #
## Description: Install BATL and dependencies if not already installed.        #
################################################################################

## Clear environment
rm(list=ls())

## Download the latest BATL version
message("Downloading BATL from lipidomics-uottawa/batl")
current_dir <- getwd()
batl_name <- "batl_2.05.6.tar.gz"
download.file(
  paste0("https://github.com/lipidomic-uottawa/batl/raw/main/", batl_name),
  destfile = batl_name,
  method = "auto")

## BATL dependencies to install if not already installed
message("Installing BATL dependencies")
batl_deps <- c(
  "data.table",
  "doFuture",
  "future",
  "foreach",
  "igraph",
  "openxlsx",
  "progressr")
to_install <- batl_deps[!(batl_deps %in% installed.packages()[,"Package"])]
if (length(to_install) > 0) {
  install.packages(to_install)
}

## Install BATL package and remove installer
message("Installing BATL package")
install.packages(batl_name, repos = NULL, type="source", dependencies = TRUE)
if (file.exists(batl_name)) {
  message("Deleting BATL package installer")
  file.remove(batl_name)
}
message("End of installation script.")
################################################################################
