% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Cruncher.R
\encoding{UTF-8}
\name{cruncher_and_param}
\alias{cruncher_and_param}
\title{Run quickly the 'JWSACruncher'}
\usage{
cruncher_and_param(
  workspace = NULL,
  output = NULL,
  rename_multi_documents = FALSE,
  delete_existing_file = FALSE,
  log_file = NULL,
  cruncher_bin_directory = getOption("cruncher_bin_directory"),
  ...
)
}
\arguments{
\item{workspace}{Path to the workspace. By default a dialog box opens to choose the workspace.}

\item{output}{Full path of the output folder. By default (\code{output = NULL}) a folder is create in the path to the workspace ([workspace]/Output).}

\item{rename_multi_documents}{Boolean indicating whether to rename the folders
containing the outputs according to the names of the multi-documents of the workspace.
By default \code{rename_multi_documents = FALSE}: the names of the XML files of the multi-documents are used.}

\item{delete_existing_file}{Only used if \code{rename_multi_documents = TRUE}. Boolean indicating whether to
delete existing folders when renaming them. By default (\code{delete_existing_file = FALSE}) they are not deleted.}

\item{log_file}{Name of the log file of 'JWSACruncher'. By default the log isn't exported.}

\item{cruncher_bin_directory}{Path to the "bin" directory of the 'JWSACruncher'. By default
the value of the option \code{"cruncher_bin_directory"} is used.}

\item{...}{Other parameters of \code{\link[=create_param_file]{create_param_file()}}.}
}
\value{
Path to the workspace.
}
\description{
Function to run the 'JWSACruncher' on a workspace while creating the parameter file.
}
\seealso{
\code{\link[=cruncher]{cruncher()}}, \code{\link[=update_workspace]{update_workspace()}}, \code{\link[=create_param_file]{create_param_file()}}, \code{\link[=multiprocessing_names]{multiprocessing_names()}}.
}
