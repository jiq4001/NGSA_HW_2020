

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
revigo.data <- rbind(c("GO:0002376","immune system process",16.463,10.1561,0.983,0.000,"immune system process"),
c("GO:0002446","neutrophil mediated immunity",2.879,6.1851,0.710,0.000,"neutrophil mediated immunity"),
c("GO:0002682","regulation of immune system process",8.344,4.9626,0.697,0.653,"neutrophil mediated immunity"),
c("GO:0048535","lymph node development",0.098,4.3969,0.809,0.288,"neutrophil mediated immunity"),
c("GO:0002252","immune effector process",6.896,5.4486,0.727,0.627,"neutrophil mediated immunity"),
c("GO:0036230","granulocyte activation",2.851,5.3010,0.690,0.424,"neutrophil mediated immunity"),
c("GO:0002764","immune response-regulating signaling pathway",3.589,4.0830,0.628,0.508,"neutrophil mediated immunity"),
c("GO:0006959","humoral immune response",1.702,5.2668,0.712,0.396,"neutrophil mediated immunity"),
c("GO:0006955","immune response",11.858,10.5884,0.662,0.552,"neutrophil mediated immunity"),
c("GO:0008150","biological_process",100.000,300.0000,1.000,0.000,"biological_process"),
c("GO:0008152","metabolic process",64.841,4.6162,0.993,0.000,"metabolism"),
c("GO:0009987","cellular process",90.329,9.2933,0.998,0.000,"cellular process"),
c("GO:0010951","negative regulation of endopeptidase activity",1.368,7.3449,0.813,0.000,"negative regulation of endopeptidase activity"),
c("GO:0030162","regulation of proteolysis",4.178,3.6440,0.875,0.546,"negative regulation of endopeptidase activity"),
c("GO:0044267","cellular protein metabolic process",28.505,3.9245,0.917,0.279,"negative regulation of endopeptidase activity"),
c("GO:0050790","regulation of catalytic activity",13.993,4.2457,0.874,0.645,"negative regulation of endopeptidase activity"),
c("GO:0051336","regulation of hydrolase activity",7.934,4.7144,0.873,0.496,"negative regulation of endopeptidase activity"),
c("GO:0044092","negative regulation of molecular function",6.434,3.6757,0.885,0.550,"negative regulation of endopeptidase activity"),
c("GO:0023052","signaling",36.613,4.0778,0.987,0.000,"signaling"),
c("GO:0032501","multicellular organismal process",41.143,5.7570,0.988,0.000,"multicellular organismal process"),
c("GO:0032502","developmental process",33.982,3.9469,0.987,0.000,"developmental process"),
c("GO:0040011","locomotion",9.452,4.5986,0.982,0.000,"locomotion"),
c("GO:0050896","response to stimulus",49.302,6.1986,0.990,0.000,"response to stimulus"),
c("GO:0051179","localization",36.018,6.2676,0.987,0.000,"localization"),
c("GO:0065007","biological regulation",67.069,5.9469,0.993,0.000,"biological regulation"),
c("GO:0060326","cell chemotaxis",1.460,5.3820,0.782,0.002,"cell chemotaxis"),
c("GO:0050918","positive chemotaxis",0.323,3.8041,0.855,0.669,"cell chemotaxis"),
c("GO:0051234","establishment of localization",29.960,5.4685,0.909,0.536,"cell chemotaxis"),
c("GO:0006810","transport",29.215,5.7496,0.900,0.399,"cell chemotaxis"),
c("GO:0042330","taxis",3.203,4.7852,0.839,0.557,"cell chemotaxis"),
c("GO:0019730","antimicrobial humoral response",0.387,5.3420,0.730,0.381,"cell chemotaxis"),
c("GO:0010876","lipid localization",2.043,3.6819,0.933,0.161,"cell chemotaxis"),
c("GO:0006887","exocytosis",4.986,3.5086,0.877,0.190,"cell chemotaxis"),
c("GO:0019221","cytokine-mediated signaling pathway",3.260,4.1549,0.854,0.408,"cell chemotaxis"),
c("GO:0046903","secretion",8.892,3.8697,0.894,0.497,"cell chemotaxis"),
c("GO:0016192","vesicle-mediated transport",11.385,3.7747,0.910,0.496,"cell chemotaxis"),
c("GO:0051674","localization of cell",8.257,4.3925,0.922,0.238,"cell chemotaxis"),
c("GO:0007154","cell communication",36.705,4.0414,0.983,0.004,"cell communication"),
c("GO:0001895","retina homeostasis",0.404,3.6576,0.953,0.027,"retina homeostasis"),
c("GO:0006665","sphingolipid metabolic process",0.831,4.3143,0.895,0.046,"sphingolipid metabolism"),
c("GO:0016266","O-glycan processing",0.340,3.9245,0.915,0.203,"sphingolipid metabolism"),
c("GO:0006643","membrane lipid metabolic process",1.131,3.7100,0.909,0.559,"sphingolipid metabolism"),
c("GO:1901564","organonitrogen compound metabolic process",13.324,7.1543,0.953,0.161,"sphingolipid metabolism"),
c("GO:0001775","cell activation",7.900,6.8894,0.950,0.051,"cell activation"),
c("GO:0071704","organic substance metabolic process",62.701,4.5591,0.952,0.064,"organic substance metabolism"),
c("GO:0019538","protein metabolic process",31.991,4.2757,0.944,0.190,"organic substance metabolism"),
c("GO:0006807","nitrogen compound metabolic process",40.081,4.3615,0.954,0.221,"organic substance metabolism"),
c("GO:0044237","cellular metabolic process",59.486,3.8697,0.948,0.309,"organic substance metabolism"),
c("GO:0044238","primary metabolic process",60.306,4.3478,0.952,0.313,"organic substance metabolism"),
c("GO:0050794","regulation of cellular process",60.427,5.7305,0.928,0.069,"regulation of cellular process"),
c("GO:0048518","positive regulation of biological process",30.969,3.7167,0.937,0.198,"regulation of cellular process"),
c("GO:0051716","cellular response to stimulus",40.358,5.4023,0.863,0.359,"regulation of cellular process"),
c("GO:0048583","regulation of response to stimulus",21.610,3.5735,0.854,0.273,"regulation of cellular process"),
c("GO:0050789","regulation of biological process",63.456,4.3439,0.941,0.274,"regulation of cellular process"),
c("GO:0009605","response to external stimulus",12.043,4.9706,0.889,0.224,"regulation of cellular process"),
c("GO:0006950","response to stress",21.310,4.2062,0.879,0.272,"regulation of cellular process"),
c("GO:0065009","regulation of molecular function",17.288,4.7033,0.948,0.116,"regulation of cellular process"),
c("GO:0007166","cell surface receptor signaling pathway",15.868,4.8041,0.837,0.436,"regulation of cellular process"),
c("GO:0007165","signal transduction",33.618,5.0013,0.816,0.209,"regulation of cellular process"),
c("GO:0042221","response to chemical",23.993,4.1007,0.876,0.285,"regulation of cellular process"),
c("GO:0030154","cell differentiation",22.095,4.7011,0.926,0.086,"cell differentiation"),
c("GO:0048856","anatomical structure development",31.558,3.9547,0.961,0.544,"cell differentiation"),
c("GO:0048869","cellular developmental process",23.093,4.2865,0.925,0.489,"cell differentiation"),
c("GO:0031349","positive regulation of defense response",2.441,5.1343,0.780,0.090,"positive regulation of defense response"),
c("GO:0031347","regulation of defense response",3.964,4.5528,0.788,0.684,"positive regulation of defense response"),
c("GO:0009607","response to biotic stimulus",5.107,3.8386,0.901,0.107,"positive regulation of defense response"),
c("GO:0006952","defense response",8.904,5.6383,0.850,0.397,"positive regulation of defense response"),
c("GO:0006954","inflammatory response",3.785,4.1681,0.829,0.631,"positive regulation of defense response"),
c("GO:0006928","movement of cell or subcellular component",10.987,3.8239,0.949,0.094,"movement of cell or subcellular component"));

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
