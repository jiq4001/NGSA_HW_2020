idx_gen <- function(dataframe, sep = "_", col.names = c("Sample", "Biorep", "Techrep")){
  key.df <- separate(dataframe[, "sample_id"], sample_id, into = col.names, sep = sep)
  if(complete.cases(key.df) != nrow(dataframe)){
    stop("check error in rename vector")
  }
  else{
    return(cbind.data.frame(key.df, dataframe[, -"sample_id"]))
  }
}
