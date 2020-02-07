## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ---- eval=F-------------------------------------------------------------
#  sftp jiq4001@aristotle.med.cornell.edu << EOF
#  > get /home/jiq4001/angsd/hw_wk4/ERR458495_fastqc.zip ./ERR458495_fastqc.zip
#  > get /home/jiq4001/angsd/hw_wk4/ERR458495_fastqc.zip ./ERR458495_fastqc.zip
#  > get /home/jiq4001/angsd/hw_wk4/ERR458500_fastqc.zip ./ERR458500_fastqc.zip
#  > get /home/jiq4001/angsd/hw_wk4/ERR458502_fastqc.zip ./ERR458502_fastqc.zip
#  > EOF

## ---- eval=F-------------------------------------------------------------
#  unzip -p ERR458493_fastqc.zip \*/fastqc_data.txt | sed -n -e "13,/>>END_MODULE/p" | grep -v '>>'

## ------------------------------------------------------------------------
input.file.list <- c("ERR458502_fastqc.zip", "ERR458500_fastqc.zip", 
                     "ERR458493_fastqc.zip", "ERR458495_fastqc.zip")
input.file.list <- system.file("extdata", input.file.list, package = "FastqcPool", mustWork = TRUE)
input.file.list

## ------------------------------------------------------------------------
# Build--Install and Restart the package
library(FastqcPool)

## ------------------------------------------------------------------------

rename.list <- c("SNF2_1_ERR458502", "SNF2_1_ERR458500", "WT_1_ERR458493", "WT_1_ERR458495")

combined_df <- read_in(input = input.file.list, rename = rename.list)
head(combined_df)
colnames(combined_df)

## ---- eval=F-------------------------------------------------------------
#  save(combined_df, file = "../data/combined_df.RData")
#  ## place the saved combined_df.RData in /data directory under the package root directory
#  load("combined_df.RData")
#  ## to load the dataframe

## ------------------------------------------------------------------------
# function returns the updated dataframe 
update.df <- idx_gen(combined_df, sep = "_", col.names = c("Sample", "Biorep", "Run"))
head(update.df)

## ---- fig.width= 7, fig.height= 4----------------------------------------
plotpool_error(update.df, panel = "Sample", col = "Run")

