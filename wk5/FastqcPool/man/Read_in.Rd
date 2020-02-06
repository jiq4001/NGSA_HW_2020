\name{Read_in}
\alias{Read_in}
\title{
Extract the base quality score from "fastqc_data.txt" in one or a list of standard FastQC output zip files to a combined R dataframe
}
\description{
This function extract the base quality score from "fastqc_data.txt" in one or a list of standard FastQC output zip files to a combined R dataframe
}
\usage{
read_in(input, rename=input, test = "Per base sequence quality")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{input}{
a vector of list of strings that specifies the path to an individual FastQC zip output. (typically in c("fastqc1.zip", "fastqc2.zip",...) format)
}
  \item{test}{
a string Indicate which test results should be extracted. Default: "Per base sequence quality".
Other options are: for example, "Per tile sequence quality", "Per sequence quality score" etc.
}
  \item{rename}{
a string that offers the option to rename the SampleID, which presents as the key column in the output dataframe. (defalt is same as the filepath input)
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
a dataframe with the value of a single FastQC test result
}

\examples{
res <- read_in(filepath = c("fastqc1.zip", "fastqc2.zip"))
}
