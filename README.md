# Getting-Cleaning-Data
---
title: "README"
author: "Nir Basanchik"
date: "December 26, 2015"
output: html_document
---

*The repo includes two files:* 

1. run_analysis.R - a script which reads in the data for the assignment and tidys the data (for more info see CodeBook.Rmd).
2. CodeBook.Rmd - An R-markdown file which explains how the script run_analysis.R works and       describes the data set used by run_analysis.R 

**Results of the script**

* The merged data for stage 1 (including the activity labels from stage 3) is stored in the object *combined.data*.
* The data on the means and standard deviations (including the activity labels from stage 3) of the features is stored in a data frame called *extracted.data*
* The data for stage 5 is stored in the data frame *means.data*.
