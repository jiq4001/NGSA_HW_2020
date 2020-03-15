

# A plotting R script produced by the REVIGO server at http://revigo.irb.hr/
# If you found REVIGO useful in your work, please cite the following reference:
# Supek F et al. "REVIGO summarizes and visualizes long lists of Gene Ontology
# terms" PLoS ONE 2011. doi:10.1371/journal.pone.0021800


# --------------------------------------------------------------------------
# If you don't have the ggplot2 package installed, uncomment the following line:
# install.packages( "ggplot2" );
library( ggplot2 );
# --------------------------------------------------------------------------
# If you don't have the scales package installed, uncomment the following line:
# install.packages( "scales" );
library( scales );


# --------------------------------------------------------------------------
# Here is your data from REVIGO. Scroll down for plot configuration options.

revigo.names <- c("term_ID","description","frequency_%","plot_X","plot_Y","plot_size","log10_p_value","uniqueness","dispensability");
revigo.data <- rbind(c("GO:0000087","mitotic M phase", 0.004,-3.289,-1.488, 2.672,-22.0000,0.962,0.000),
c("GO:0002252","immune effector process", 0.185,-5.131,-3.132, 4.375,-5.0000,0.864,0.000),
c("GO:0009141","nucleoside triphosphate metabolic process", 1.605, 2.051, 6.169, 5.314,-300.0000,0.689,0.000),
c("GO:0009635","response to herbicide", 0.003,-5.255, 2.051, 2.567,-31.0000,0.892,0.000),
c("GO:0032505","reproduction of a single-celled organism", 0.181,-5.589,-4.587, 4.366,-14.0000,0.955,0.000),
c("GO:0034220","ion transmembrane transport", 3.528, 2.619,-4.626, 5.656,-300.0000,0.912,0.000),
c("GO:0042273","ribosomal large subunit biogenesis", 0.151,-1.654,-6.629, 4.287,-297.0000,0.887,0.000),
c("GO:0052126","movement in host environment", 0.022,-0.944,-0.691, 3.450,-8.0000,0.891,0.000),
c("GO:0042026","protein refolding", 0.069,-6.614,-3.124, 3.949,-204.0000,0.957,0.029),
c("GO:0009853","photorespiration", 0.005,-0.139, 1.942, 2.793,-11.0000,0.927,0.042),
c("GO:0019684","photosynthesis, light reaction", 0.069, 2.673,-0.736, 3.947,-86.0000,0.852,0.052),
c("GO:0006808","regulation of nitrogen utilization", 0.079, 6.604,-1.900, 4.005,-88.0000,0.890,0.072),
c("GO:0019740","nitrogen utilization", 0.085,-2.438,-3.026, 4.038,-88.0000,0.934,0.073),
c("GO:0006414","translational elongation", 0.777, 5.446, 4.567, 4.999,-300.0000,0.836,0.157),
c("GO:0006879","cellular iron ion homeostasis", 0.110, 5.683, 1.289, 4.148,-84.0000,0.808,0.180),
c("GO:0009268","response to pH", 0.011,-6.735, 1.852, 3.133,-14.0000,0.860,0.188),
c("GO:0022402","cell cycle process", 1.053, 1.308, 4.811, 5.131,-22.0000,0.798,0.215),
c("GO:0009615","response to virus", 0.117,-5.270, 4.175, 4.175,-8.0000,0.857,0.232),
c("GO:0010608","posttranscriptional regulation of gene expression", 0.719, 6.891, 0.747, 4.965,-124.0000,0.887,0.267),
c("GO:0006523","alanine biosynthetic process", 0.050, 3.870, 5.964, 3.804,-26.0000,0.791,0.273),
c("GO:0006102","isocitrate metabolic process", 0.022, 1.504, 7.433, 3.446,-10.0000,0.839,0.276),
c("GO:0006662","glycerol ether metabolic process", 0.122, 0.888, 7.539, 4.193,-142.0000,0.847,0.295),
c("GO:0006021","inositol biosynthetic process", 0.016, 2.910, 6.974, 3.322,-10.0000,0.817,0.331),
c("GO:0006954","inflammatory response", 0.110,-5.765, 2.811, 4.151,-6.0000,0.851,0.341),
c("GO:0034728","nucleosome organization", 0.129,-1.639,-6.315, 4.219,-31.0000,0.859,0.342),
c("GO:0006818","hydrogen transport", 1.149, 3.118,-5.173, 5.168,-300.0000,0.866,0.366),
c("GO:0015797","mannitol transport", 0.005, 2.694,-5.303, 2.828,-11.0000,0.903,0.377),
c("GO:0030388","fructose 1,6-bisphosphate metabolic process", 0.014,-1.037, 7.412, 3.249,-25.0000,0.836,0.402),
c("GO:0030255","protein secretion by the type IV secretion system", 0.013, 3.438,-4.050, 3.237,-18.0000,0.848,0.404),
c("GO:0009611","response to wounding", 0.127,-5.431, 2.893, 4.212,-5.0000,0.872,0.437),
c("GO:0050821","protein stabilization", 0.045, 6.199,-0.809, 3.763,-7.0000,0.919,0.450),
c("GO:0031647","regulation of protein stability", 0.070, 6.228,-0.235, 3.951,-7.0000,0.917,0.464),
c("GO:0055085","transmembrane transport", 8.916, 1.727,-4.528, 6.058,-300.0000,0.932,0.497),
c("GO:0043467","regulation of generation of precursor metabolites and energy", 0.030, 6.482,-0.586, 3.578,-9.0000,0.859,0.502),
c("GO:0019646","aerobic electron transport chain", 0.042, 2.536, 1.961, 3.726,-14.0000,0.829,0.513),
c("GO:0006183","GTP biosynthetic process", 0.053, 2.951, 5.976, 3.833,-144.0000,0.670,0.520),
c("GO:0010447","response to acidic pH", 0.006,-6.824, 2.234, 2.912,-14.0000,0.863,0.546),
c("GO:0006417","regulation of translation", 0.692, 5.859, 2.747, 4.948,-119.0000,0.786,0.550),
c("GO:0031326","regulation of cellular biosynthetic process",10.816, 6.173, 1.894, 6.142,-113.0000,0.808,0.551),
c("GO:0009581","detection of external stimulus", 0.057,-5.473, 4.426, 3.861,-5.0000,0.850,0.595),
c("GO:0009597","detection of virus", 0.001,-4.657, 4.455, 2.079,-8.0000,0.884,0.632),
c("GO:0042255","ribosome assembly", 0.164,-1.280,-6.647, 4.322,-297.0000,0.833,0.649),
c("GO:0051259","protein oligomerization", 0.188,-0.999,-6.653, 4.382,-83.0000,0.852,0.652),
c("GO:0051262","protein tetramerization", 0.044,-1.137,-6.533, 3.749,-84.0000,0.864,0.657),
c("GO:0009416","response to light stimulus", 0.157,-6.392, 2.247, 4.304,-5.0000,0.836,0.658),
c("GO:0002526","acute inflammatory response", 0.016,-6.117, 3.315, 3.318,-6.0000,0.852,0.662),
c("GO:0009142","nucleoside triphosphate biosynthetic process", 0.651, 2.902, 5.623, 4.922,-300.0000,0.646,0.662),
c("GO:0009595","detection of biotic stimulus", 0.005,-4.970, 4.705, 2.775,-8.0000,0.861,0.676));

one.data <- data.frame(revigo.data);
names(one.data) <- revigo.names;
one.data <- one.data [(one.data$plot_X != "null" & one.data$plot_Y != "null"), ];
one.data$plot_X <- as.numeric( as.character(one.data$plot_X) );
one.data$plot_Y <- as.numeric( as.character(one.data$plot_Y) );
one.data$plot_size <- as.numeric( as.character(one.data$plot_size) );
one.data$log10_p_value <- as.numeric( as.character(one.data$log10_p_value) );
one.data$frequency <- as.numeric( as.character(one.data$frequency) );
one.data$uniqueness <- as.numeric( as.character(one.data$uniqueness) );
one.data$dispensability <- as.numeric( as.character(one.data$dispensability) );
#head(one.data);


# --------------------------------------------------------------------------
# Names of the axes, sizes of the numbers and letters, names of the columns,
# etc. can be changed below

p1 <- ggplot( data = one.data );
p1 <- p1 + geom_point( aes( plot_X, plot_Y, colour = log10_p_value, size = plot_size), alpha = I(0.6) ) + scale_size_area();
p1 <- p1 + scale_colour_gradientn( colours = c("blue", "green", "yellow", "red"), limits = c( min(one.data$log10_p_value), 0) );
p1 <- p1 + geom_point( aes(plot_X, plot_Y, size = plot_size), shape = 21, fill = "transparent", colour = I (alpha ("black", 0.6) )) + scale_size_area();
p1 <- p1 + scale_size( range=c(5, 30)) + theme_bw(); # + scale_fill_gradientn(colours = heat_hcl(7), limits = c(-300, 0) );
ex <- one.data [ one.data$dispensability < 0.15, ]; 
p1 <- p1 + geom_text( data = ex, aes(plot_X, plot_Y, label = description), colour = I(alpha("black", 0.85)), size = 3 );
p1 <- p1 + labs (y = "semantic space x", x = "semantic space y");
p1 <- p1 + theme(legend.key = element_blank()) ;
one.x_range = max(one.data$plot_X) - min(one.data$plot_X);
one.y_range = max(one.data$plot_Y) - min(one.data$plot_Y);
p1 <- p1 + xlim(min(one.data$plot_X)-one.x_range/10,max(one.data$plot_X)+one.x_range/10);
p1 <- p1 + ylim(min(one.data$plot_Y)-one.y_range/10,max(one.data$plot_Y)+one.y_range/10);



# --------------------------------------------------------------------------
# Output the plot to screen

p1;

# Uncomment the line below to also save the plot to a file.
# The file type depends on the extension (default=pdf).

# ggsave("C:/Users/path_to_your_file/revigo-plot.pdf");
