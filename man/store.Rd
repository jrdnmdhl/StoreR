% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/eval.R
\name{store}
\alias{store}
\title{Create a data store}
\usage{
store(path)
}
\arguments{
\item{path}{the path to the store folder}
}
\value{
A function which can be used to save to or read from
the data store.
}
\description{
Creates a data store in the form of a function which can
be used to save arbitrary r objects to or read them from
a directory.
}
