

# A treemap R script produced by the REVIGO server at http://revigo.irb.hr/
# If you found REVIGO useful in your work, please cite the following reference:
# Supek F et al. "REVIGO summarizes and visualizes long lists of Gene Ontology
# terms" PLoS ONE 2011. doi:10.1371/journal.pone.0021800

# author: Anton Kratz <anton.kratz@gmail.com>, RIKEN Omics Science Center, Functional Genomics Technology Team, Japan
# created: Fri, Nov 02, 2012  7:25:52 PM
# last change: Fri, Nov 09, 2012  3:20:01 PM

# -----------------------------------------------------------------------------
# If you don't have the treemap package installed, uncomment the following line:
# install.packages( "treemap" );
library(treemap) 								# treemap package by Martijn Tennekes

# Set the working directory if necessary
# setwd("C:/Users/username/workingdir");

# --------------------------------------------------------------------------
# Here is your data from REVIGO. Scroll down for plot configuration options.

revigo.names <- c("term_ID","description","freqInDbPercent","abslog10pvalue","uniqueness","dispensability","representative");
revigo.data <- rbind(c("GO:0001816","cytokine production",3.745,5.4895,0.944,0.000,"cytokine production"),
c("GO:0002376","immune system process",16.463,18.9469,0.986,0.000,"immune system process"),
c("GO:0008150","biological_process",100.000,5.7721,1.000,0.000,"biological_process"),
c("GO:0009987","cellular process",90.329,4.6055,0.998,0.000,"cellular process"),
c("GO:0023052","signaling",36.613,6.2366,0.989,0.000,"signaling"),
c("GO:0032020","ISG15-protein conjugation",0.035,6.9626,0.968,0.000,"ISG15-protein conjugation"),
c("GO:0032269","negative regulation of cellular protein metabolic process",5.886,3.5186,0.898,0.322,"ISG15-protein conjugation"),
c("GO:0070213","protein auto-ADP-ribosylation",0.023,3.6073,0.957,0.542,"ISG15-protein conjugation"),
c("GO:0070647","protein modification by small protein conjugation or removal",6.399,4.0867,0.963,0.249,"ISG15-protein conjugation"),
c("GO:0006471","protein ADP-ribosylation",0.156,6.2291,0.954,0.159,"ISG15-protein conjugation"),
c("GO:0043901","negative regulation of multi-organism process",0.600,300.0000,0.798,0.000,"negative regulation of multi-organism process"),
c("GO:0043900","regulation of multi-organism process",1.379,19.0391,0.840,0.558,"negative regulation of multi-organism process"),
c("GO:0072641","type I interferon secretion",0.017,3.5498,0.847,0.677,"negative regulation of multi-organism process"),
c("GO:0016032","viral process",4.091,300.0000,0.816,0.502,"negative regulation of multi-organism process"),
c("GO:0044419","interspecies interaction between organisms",4.334,300.0000,0.856,0.659,"negative regulation of multi-organism process"),
c("GO:0034344","regulation of type III interferon production",0.017,4.7100,0.858,0.448,"negative regulation of multi-organism process"),
c("GO:0034343","type III interferon production",0.017,4.7100,0.878,0.433,"negative regulation of multi-organism process"),
c("GO:0044764","multi-organism cellular process",4.120,3.9547,0.855,0.660,"negative regulation of multi-organism process"),
c("GO:0032606","type I interferon production",0.687,6.5072,0.848,0.578,"negative regulation of multi-organism process"),
c("GO:0032480","negative regulation of type I interferon production",0.260,7.2684,0.791,0.174,"negative regulation of multi-organism process"),
c("GO:0050896","response to stimulus",49.302,300.0000,0.991,0.000,"response to stimulus"),
c("GO:0051704","multi-organism process",9.873,21.1451,0.984,0.000,"multi-organism process"),
c("GO:0051707","response to other organism",4.853,300.0000,0.762,0.000,"response to other organism"),
c("GO:0098586","cellular response to virus",0.225,5.3799,0.803,0.631,"response to other organism"),
c("GO:0051716","cellular response to stimulus",40.358,6.6556,0.838,0.307,"response to other organism"),
c("GO:0048583","regulation of response to stimulus",21.610,4.2328,0.827,0.242,"response to other organism"),
c("GO:0032101","regulation of response to external stimulus",3.976,3.5361,0.747,0.596,"response to other organism"),
c("GO:0009597","detection of virus",0.029,4.0846,0.830,0.515,"response to other organism"),
c("GO:0009607","response to biotic stimulus",5.107,300.0000,0.883,0.120,"response to other organism"),
c("GO:0009605","response to external stimulus",12.043,300.0000,0.869,0.141,"response to other organism"),
c("GO:0006950","response to stress",21.310,15.7878,0.857,0.196,"response to other organism"),
c("GO:0007166","cell surface receptor signaling pathway",15.868,8.1952,0.811,0.212,"response to other organism"),
c("GO:0007165","signal transduction",33.618,6.4660,0.787,0.436,"response to other organism"),
c("GO:0042221","response to chemical",23.993,9.0846,0.854,0.241,"response to other organism"),
c("GO:0039528","cytoplasmic pattern recognition receptor signaling pathway in response to virus",0.144,4.7235,0.547,0.602,"response to other organism"),
c("GO:0050691","regulation of defense response to virus by host",0.179,4.1355,0.656,0.663,"response to other organism"),
c("GO:0065007","biological regulation",67.069,4.4584,0.994,0.000,"biological regulation"),
c("GO:0007154","cell communication",36.705,6.2020,0.986,0.002,"cell communication"),
c("GO:0003374","dynamin family protein polymerization involved in mitochondrial fission",0.052,4.5528,0.940,0.010,"dynamin family protein polymerization involved in mitochondrial fission"),
c("GO:0061025","membrane fusion",1.425,3.5003,0.953,0.424,"dynamin family protein polymerization involved in mitochondrial fission"),
c("GO:0034058","endosomal vesicle fusion",0.058,3.6440,0.940,0.367,"dynamin family protein polymerization involved in mitochondrial fission"),
c("GO:0090148","membrane fission",0.075,3.5834,0.950,0.377,"dynamin family protein polymerization involved in mitochondrial fission"),
c("GO:0060700","regulation of ribonuclease activity",0.035,6.2757,0.942,0.046,"regulation of ribonuclease activity"),
c("GO:0032069","regulation of nuclease activity",0.156,4.9957,0.938,0.323,"regulation of ribonuclease activity"),
c("GO:0035563","positive regulation of chromatin binding",0.069,3.4647,0.955,0.190,"regulation of ribonuclease activity"),
c("GO:0048519","negative regulation of biological process",26.855,6.6055,0.927,0.052,"negative regulation of biological process"),
c("GO:0048518","positive regulation of biological process",30.969,3.6615,0.926,0.198,"negative regulation of biological process"),
c("GO:0050794","regulation of cellular process",60.427,5.0862,0.917,0.183,"negative regulation of biological process"),
c("GO:0050789","regulation of biological process",63.456,5.1925,0.932,0.274,"negative regulation of biological process"),
c("GO:0060337","type I interferon signaling pathway",0.462,300.0000,0.633,0.085,"type I interferon signaling pathway"),
c("GO:0002682","regulation of immune system process",8.344,8.2984,0.782,0.653,"type I interferon signaling pathway"),
c("GO:0035457","cellular response to interferon-alpha",0.058,3.5834,0.814,0.474,"type I interferon signaling pathway"),
c("GO:0035456","response to interferon-beta",0.133,8.7212,0.809,0.485,"type I interferon signaling pathway"),
c("GO:0035455","response to interferon-alpha",0.115,12.1752,0.811,0.479,"type I interferon signaling pathway"),
c("GO:0031347","regulation of defense response",3.964,7.0778,0.695,0.512,"type I interferon signaling pathway"),
c("GO:0002697","regulation of immune effector process",1.922,5.9281,0.776,0.323,"type I interferon signaling pathway"),
c("GO:0034341","response to interferon-gamma",0.935,300.0000,0.638,0.579,"type I interferon signaling pathway"),
c("GO:0048584","positive regulation of response to stimulus",12.268,4.1630,0.761,0.515,"type I interferon signaling pathway"),
c("GO:0045088","regulation of innate immune response",2.279,6.4921,0.631,0.677,"type I interferon signaling pathway"),
c("GO:0060759","regulation of response to cytokine stimulus",0.877,4.3799,0.711,0.619,"type I interferon signaling pathway"),
c("GO:0060760","positive regulation of response to cytokine stimulus",0.208,5.0899,0.728,0.504,"type I interferon signaling pathway"),
c("GO:0002252","immune effector process",6.896,21.0429,0.819,0.627,"type I interferon signaling pathway"),
c("GO:0034097","response to cytokine",4.714,20.4413,0.794,0.357,"type I interferon signaling pathway"),
c("GO:0034340","response to type I interferon",0.485,300.0000,0.659,0.582,"type I interferon signaling pathway"),
c("GO:0071359","cellular response to dsRNA",0.300,4.7122,0.811,0.318,"type I interferon signaling pathway"),
c("GO:0070887","cellular response to chemical stimulus",15.701,9.8477,0.785,0.594,"type I interferon signaling pathway"),
c("GO:0050776","regulation of immune response",5.799,7.1858,0.661,0.687,"type I interferon signaling pathway"),
c("GO:0060333","interferon-gamma-mediated signaling pathway",0.496,9.7670,0.632,0.620,"type I interferon signaling pathway"),
c("GO:0043331","response to dsRNA",0.485,3.6946,0.827,0.499,"type I interferon signaling pathway"),
c("GO:0006952","defense response",8.904,300.0000,0.797,0.312,"type I interferon signaling pathway"),
c("GO:0006955","immune response",11.858,300.0000,0.732,0.495,"type I interferon signaling pathway"),
c("GO:0080134","regulation of response to stress",7.657,4.8447,0.744,0.488,"type I interferon signaling pathway"),
c("GO:0071310","cellular response to organic substance",12.977,11.6904,0.757,0.590,"type I interferon signaling pathway"),
c("GO:0010033","response to organic substance",16.515,11.4609,0.790,0.447,"type I interferon signaling pathway"),
c("GO:0065009","regulation of molecular function",17.288,4.1175,0.942,0.086,"regulation of molecular function"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$abslog10pvalue <- as.numeric( as.character(stuff$abslog10pvalue) );
stuff$freqInDbPercent <- as.numeric( as.character(stuff$freqInDbPercent) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

# by default, outputs to a PDF file
pdf( file="revigo_treemap.pdf", width=16, height=9 ) # width and height are in inches

# check the tmPlot command documentation for all possible parameters - there are a lot more
tmPlot(
	stuff,
	index = c("representative","description"),
	vSize = "abslog10pvalue",
	type = "categorical",
	vColor = "representative",
	title = "REVIGO Gene Ontology treemap",
	inflate.labels = FALSE,      # set this to TRUE for space-filling group labels - good for posters
	lowerbound.cex.labels = 0,   # try to draw as many labels as possible (still, some small squares may not get a label)
	bg.labels = "#CCCCCCAA",     # define background color of group labels
												       # "#CCCCCC00" is fully transparent, "#CCCCCCAA" is semi-transparent grey, NA is opaque
	position.legend = "none"
)

dev.off()
