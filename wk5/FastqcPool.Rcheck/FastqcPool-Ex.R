pkgname <- "FastqcPool"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
base::assign(".ExTimings", "FastqcPool-Ex.timings", pos = 'CheckExEnv')
base::cat("name\tuser\tsystem\telapsed\n", file=base::get(".ExTimings", pos = 'CheckExEnv'))
base::assign(".format_ptime",
function(x) {
  if(!is.na(x[4L])) x[1L] <- x[1L] + x[4L]
  if(!is.na(x[5L])) x[2L] <- x[2L] + x[5L]
  options(OutDec = '.')
  format(x[1L:3L], digits = 7L)
},
pos = 'CheckExEnv')

### * </HEADER>
library('FastqcPool')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("Read_in")
### * Read_in

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: Read_in
### Title: Extract the base quality score from "fastqc_data.txt" in one or
###   a list of standard FastQC output zip files to a combined R dataframe
### Aliases: Read_in

### ** Examples

## Not run: 
##D input.file.list <- c("ERR458502_fastqc.zip", "ERR458500_fastqc.zip",
##D                      "ERR458493_fastqc.zip", "ERR458495_fastqc.zip")
##D input.file.list <- system.file("extdata", input.file.list, package = "FastqcPool", mustWork = TRUE)
##D rename.list <- c("SNF2_1_ERR458502", "SNF2_1_ERR458500", "WT_1_ERR458493", "WT_1_ERR458495")
##D 
##D df <- read_in(input = input.file.list, rename = rename.list)
## End(Not run)




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("Read_in", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("Read_one")
### * Read_one

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: Read_one
### Title: Extract the base quality score from "fastqc_data.txt" in a
###   standard FastQC output zip output to a R dataframe
### Aliases: Read_one

### ** Examples

## Not run: 
##D res <- read_one(filepath)
## End(Not run)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("Read_one", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("combined_df.RData")
### * combined_df.RData

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: combined_df.RData
### Title: The combined data.frame from the output of Read_in()
### Aliases: combined_df.RData
### Keywords: combined_df.RData

### ** Examples

## Not run: 
##D data(combined_df.RData)
## End(Not run)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("combined_df.RData", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("extdata")
### * extdata

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: extdata
### Title: Directory of Raw Fastqc.zip files from fastqc output in linux
###   command
### Aliases: extdata

### ** Examples

## Not run: 
##D system.file("extdata", package = "FastqcPool")
## End(Not run)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("extdata", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("idx_gen")
### * idx_gen

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: idx_gen
### Title: Expand key columns from user specified sample_id input
### Aliases: idx_gen

### ** Examples

## Not run: 
##D idx_gen(combined_df, sep = "_", col.names = c("Sample", "Biorep", "Techrep"))
## End(Not run)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("idx_gen", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("plotpool_error")
### * plotpool_error

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: plotpool_error
### Title: Plot error bar plot of the Per base Quality Score in ggplot with
###   color and size coding.
### Aliases: plotpool_error

### ** Examples

## Not run: 
##D plot(dataframe)
## End(Not run)




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("plotpool_error", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
