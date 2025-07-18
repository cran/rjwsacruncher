## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, size = "small")
library(knitr)
library(rjwsacruncher)

## ----eval = FALSE-------------------------------------------------------------
# library(rjwsacruncher)
# # Directory where to save the JWSACruncher:
# directory <- tempdir()
# download_cruncher(directory)
# # for JDemetra+ 3.x.y versions :
# download_cruncher(directory, v3 = TRUE)

## ----echo=FALSE---------------------------------------------------------------
refresh_policy <- data.frame(`Option on JDemetra+` = c(
  "Current[AO]: fixed model + AO for new data",
  "Fixed model", 
"Estimate regression coefficients", 
"Estimate regression coefficients + MA parameters of the ARIMA model", 
"Estimate regression coefficients + Arima parameters", 
"Estimate regression coefficients + Last outliers", 
"Estimate regression coefficients + all outliers", 
"Estimate regression coefficients + Arima model", 
"Concurrent"), 
`Option for the JWSACruncher` = c(
  "current", "fixed", "fixedparameters",  "fixedarparameters",
"parameters (by default)", "lastoutliers", "outliers", 
"stochastic", "complete (or concurrent)"),
`Short name` = c(
  "n", "f", "fp", "farp", "p", "l", "o", "s", "c"
),
Description = c(
   "The ARIMA model, outliers and other regression parameters are not re-identified and the values of all parameters are fixed. The transformation type remains unchanged. An additive outlier (AO) is added for new data. (since v.2.2.3)",
  "The ARIMA model, outliers and other regression parameters are not re-identified and the values of all parameters are fixed. The transformation type remains unchanged. (since v.2.2.3)", 
"The ARIMA model, outliers and other regression parameters are not re-identified. The coefficients of the ARIMA model are fixed, other coefficients are re-estimated. The transformation type remains unchanged.", 
"The ARIMA model, outliers and other regression parameters are not re-identified. The AR coefficients of the ARIMA model are fixed, other coefficients are re-estimated (MA coefficients + regressors). The transformation type remains unchanged. (since v.3.4.0)", 
"The ARIMA model, outliers and other regression parameters are not re-identified. All parameters of the RegARIMA model are re-estimated. The transformation type remains unchanged.", 
"The ARIMA model, outliers (except from the outliers in the last year of the sample) and other regression parameters are not re-identified. All parameters of the RegARIMA model are re-estimated. The outliers in the last year of the sample are re-identified. The transformation type remains unchanged.", 
"The ARIMA model and regression parameters, except from outliers) are not re-identified. All parameters of the RegARIMA model are re-estimated. All outliers are re-identified. The transformation type remains unchanged.", 
"Re-identification of the ARIMA model, outliers and regression variables, except from the calendar variables. The transformation type remains unchanged.", 
"Re-identification of the whole RegARIMA model."), 
check.names = FALSE
)

refresh_policy[-c(1, nrow(refresh_policy)), 1] <-  paste("Partial concurrent adjustment ->", refresh_policy[-c(1, nrow(refresh_policy)), 1])
kable(refresh_policy, caption = "Refresh policies",
      booktabs = TRUE)

## ----eval = FALSE-------------------------------------------------------------
# # To get the default parameters
# getOption("default_matrix_item")
# # To change the default parameters to, for example, only export
# # the information criteria:
# options(default_matrix_item = c("likelihood.aic",
#                                 "likelihood.aicc",
#                                 "likelihood.bic",
#                                 "likelihood.bicc"))

## ----eval = FALSE-------------------------------------------------------------
# # To get the default parameters
# getOption("default_tsmatrix_series")
# # To change the default parameters to, for example, only export
# # the seasonally adjusted series and its forecasts:
# options(default_tsmatrix_series = c("sa", "sa_f"))

## ----eval = TRUE--------------------------------------------------------------
export_dir <- tempdir()
# To create the file parameters.params in the directory export_dir with
# the refresh policy "lastoutliers" and the others default parameters:
create_param_file(dir_file_param = export_dir,
                  policy = "lastoutliers")

# If the options "default_matrix_item" and "default_tsmatrix_series" were
# changed to only export the information criteria, the seasonally adjusted series and its forecasts, the previous code is equivalent to:
create_param_file(dir_file_param = export_dir,
                  policy = "lastoutliers",
                  matrix_item = c("likelihood.aic", "likelihood.aicc",
                                  "likelihood.bic", "likelihood.bicc"),
                  tsmatrix_series = c("sa", "sa_f"))

## ----eval = TRUE--------------------------------------------------------------
param_f <- read_param_file(file.path(export_dir, "parameters.param"))
str(param_f)

## ----eval = FALSE-------------------------------------------------------------
# options(cruncher_bin_directory = "D:/jdemetra-cli-2.2.2/bin/")

## ----eval = FALSE-------------------------------------------------------------
# # The following code updates the workspace "workspace", that is under the folder D:/,
# # with the refresh policy "lastoutliers". Others parameters are the default ones of create_param_file().
# # In particular, the exported parameters are those of the options
# # "default_matrix_item" options and "default_tsmatrix_series" and the results
# # will be under D:/workspace/Output/.
# cruncher_and_param(workspace = "D:/workspace.xml",
#                    policy = "lastoutliers")
# 
# # Use the parameter "outpout" to change the folder that will contains the results
# cruncher_and_param(workspace = "D:/workspace.xml",
#                    output = "D:/Results/",
#                    policy = "lastoutliers")
# 
# # To change the names of the folders containing the outputs so that they are equal
# # to the names of the multi-documents displayed in JDemetra+, use the parameter
# # "rename_multi_documents = TRUE". The parameter "delete_existing_file = TRUE"
# # allows to delete any existing folders with the same name as the multi-documents.
# cruncher_and_param(workspace = "D:/workspace.xml",
#                    rename_multi_documents = TRUE,
#                    delete_existing_file = TRUE,
#                    policy = "lastoutliers")
# 
# # To see the other parameters:
# ?cruncher_and_param

