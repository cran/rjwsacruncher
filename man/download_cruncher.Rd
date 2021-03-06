% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/download_cruncher.R
\encoding{UTF-8}
\name{download_cruncher}
\alias{download_cruncher}
\title{Dowload the 'JWSACruncher'}
\usage{
download_cruncher(directory, cruncher_version)
}
\arguments{
\item{directory}{directory where to save the 'JWSACruncher'. In Windows, a dialog box opens
by default to select the directory.}

\item{cruncher_version}{character of the version of the 'JWSACruncher' to download ("X.Y.Z" format). By default the last version is downloaded.}
}
\description{
Function to download the ZIP file of the 'JWSACruncher'
}
\details{
The 'JWSACruncher' is downloaded from \url{https://github.com/jdemetra/jwsacruncher/releases}. To use it, it has to be unzip.
}
\examples{
\dontrun{
# On Windows opens a dialog box to choose the directory where to
# download the last version of the 'JWSACruncher'
download_cruncher()

dir <- tempdir()
# To download the last release:
download_cruncher(dir)

# To download the release of the version 2.2.2:
download_cruncher(dir, "2.2.2")
}
}
\seealso{
\code{\link{configure_jwsacruncher}}.
}
