plotpool_error <- function(dataframe){
  dataframe %>%
    ggplot(aes(as.numeric(`#Base`), Mean, color = sample_id))+
    geom_point(position = "jitter")+
    geom_errorbar(aes(ymin = `Lower Quartile`, ymax = `Upper Quartile`),position = "jitter")+
    scale_x_continuous()+
    scale_y_continuous(labels = scales::percent)+
    theme(plot.title = element_text(hjust = 0.5))+
    labs(x = "# Base", title = "Per Base Sequence Quality Errorbar Plot")+
    guides(color = guide_legend(title="Sample ID"))
}
