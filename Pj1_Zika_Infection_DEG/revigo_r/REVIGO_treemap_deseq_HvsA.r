

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
revigo.data <- rbind(c("GO:0001817","regulation of cytokine production",3.387,19.0348,0.782,0.000,"regulation of cytokine production"),
c("GO:0032760","positive regulation of tumor necrosis factor production",0.329,4.7447,0.784,0.695,"regulation of cytokine production"),
c("GO:0032757","positive regulation of interleukin-8 production",0.254,5.6596,0.788,0.676,"regulation of cytokine production"),
c("GO:0051241","negative regulation of multicellular organismal process",5.741,6.2700,0.846,0.596,"regulation of cytokine production"),
c("GO:0051240","positive regulation of multicellular organismal process",8.327,10.2495,0.800,0.542,"regulation of cytokine production"),
c("GO:0051239","regulation of multicellular organismal process",15.268,11.7570,0.895,0.199,"regulation of cytokine production"),
c("GO:0034344","regulation of type III interferon production",0.017,4.9626,0.859,0.525,"regulation of cytokine production"),
c("GO:0034343","type III interferon production",0.017,4.9626,0.883,0.525,"regulation of cytokine production"),
c("GO:0050793","regulation of developmental process",12.949,4.6556,0.916,0.247,"regulation of cytokine production"),
c("GO:0001816","cytokine production",3.745,20.8125,0.939,0.204,"regulation of cytokine production"),
c("GO:0035239","tube morphogenesis",1.973,4.4498,0.931,0.444,"regulation of cytokine production"),
c("GO:0030154","cell differentiation",22.095,4.2118,0.949,0.401,"regulation of cytokine production"),
c("GO:0048869","cellular developmental process",23.093,4.4413,0.949,0.489,"regulation of cytokine production"),
c("GO:0001525","angiogenesis",2.389,5.1209,0.922,0.191,"regulation of cytokine production"),
c("GO:0048646","anatomical structure formation involved in morphogenesis",5.591,4.3595,0.972,0.514,"regulation of cytokine production"),
c("GO:0001906","cell killing",0.629,7.6904,0.994,0.000,"cell killing"),
c("GO:0002376","immune system process",16.463,28.8601,0.995,0.000,"immune system process"),
c("GO:0008150","biological_process",100.000,16.0851,1.000,0.000,"biological_process"),
c("GO:0008152","metabolic process",64.841,7.6757,0.998,0.000,"metabolism"),
c("GO:0009987","cellular process",90.329,16.2111,0.999,0.000,"cellular process"),
c("GO:0016567","protein ubiquitination",4.737,5.6108,0.920,0.000,"protein ubiquitination"),
c("GO:0006807","nitrogen compound metabolic process",40.081,9.1701,0.958,0.148,"protein ubiquitination"),
c("GO:0051247","positive regulation of protein metabolic process",8.840,4.9172,0.796,0.689,"protein ubiquitination"),
c("GO:0044237","cellular metabolic process",59.486,7.8477,0.949,0.297,"protein ubiquitination"),
c("GO:0044238","primary metabolic process",60.306,9.0696,0.952,0.215,"protein ubiquitination"),
c("GO:0044260","cellular macromolecule metabolic process",48.748,7.2388,0.931,0.316,"protein ubiquitination"),
c("GO:0009058","biosynthetic process",36.924,4.4191,0.959,0.159,"protein ubiquitination"),
c("GO:0070647","protein modification by small protein conjugation or removal",6.399,6.1209,0.921,0.542,"protein ubiquitination"),
c("GO:0043170","macromolecule metabolic process",53.306,7.6289,0.951,0.268,"protein ubiquitination"),
c("GO:0044267","cellular protein metabolic process",28.505,8.2168,0.907,0.566,"protein ubiquitination"),
c("GO:0071704","organic substance metabolic process",62.701,8.2284,0.951,0.313,"protein ubiquitination"),
c("GO:0042107","cytokine metabolic process",0.635,5.5591,0.953,0.191,"protein ubiquitination"),
c("GO:0031399","regulation of protein modification process",9.683,5.9172,0.839,0.601,"protein ubiquitination"),
c("GO:0031401","positive regulation of protein modification process",6.636,5.6289,0.788,0.679,"protein ubiquitination"),
c("GO:0032020","ISG15-protein conjugation",0.035,4.3768,0.957,0.208,"protein ubiquitination"),
c("GO:0019538","protein metabolic process",31.991,9.5901,0.944,0.140,"protein ubiquitination"),
c("GO:0043412","macromolecule modification",24.172,8.0353,0.949,0.230,"protein ubiquitination"),
c("GO:0006464","cellular protein modification process",22.683,7.8356,0.899,0.506,"protein ubiquitination"),
c("GO:0006508","proteolysis",10.294,5.3840,0.930,0.291,"protein ubiquitination"),
c("GO:0023052","signaling",36.613,18.3429,0.996,0.000,"signaling"),
c("GO:0032501","multicellular organismal process",41.143,7.5272,0.997,0.000,"multicellular organismal process"),
c("GO:0034097","response to cytokine",4.714,25.2197,0.901,0.000,"response to cytokine"),
c("GO:0002480","antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-independent",0.052,6.5003,0.840,0.554,"response to cytokine"),
c("GO:0002475","antigen processing and presentation via MHC class Ib",0.058,5.5784,0.843,0.567,"response to cytokine"),
c("GO:0048522","positive regulation of cellular process",27.732,11.9101,0.837,0.479,"response to cytokine"),
c("GO:0002460","adaptive immune response based on somatic recombination of immune receptors built from immunoglobulin superfamily domains",1.881,8.9586,0.761,0.531,"response to cytokine"),
c("GO:0002449","lymphocyte mediated immunity",1.864,10.5302,0.793,0.426,"response to cytokine"),
c("GO:0050900","leukocyte migration",2.649,4.8447,0.766,0.448,"response to cytokine"),
c("GO:0051716","cellular response to stimulus",40.358,17.4634,0.906,0.292,"response to cytokine"),
c("GO:0045824","negative regulation of innate immune response",0.225,5.3840,0.721,0.681,"response to cytokine"),
c("GO:0051707","response to other organism",4.853,24.2503,0.873,0.118,"response to cytokine"),
c("GO:0002440","production of molecular mediator of immune response",1.333,7.0645,0.831,0.406,"response to cytokine"),
c("GO:0031347","regulation of defense response",3.964,15.1824,0.803,0.380,"response to cytokine"),
c("GO:0031348","negative regulation of defense response",0.877,4.2197,0.816,0.596,"response to cytokine"),
c("GO:0002428","antigen processing and presentation of peptide antigen via MHC class Ib",0.017,6.5003,0.853,0.256,"response to cytokine"),
c("GO:1901224","positive regulation of NIK/NF-kappaB signaling",0.225,4.9066,0.826,0.523,"response to cytokine"),
c("GO:0048584","positive regulation of response to stimulus",12.268,14.0419,0.778,0.462,"response to cytokine"),
c("GO:0048583","regulation of response to stimulus",21.610,15.1379,0.872,0.294,"response to cytokine"),
c("GO:0048585","negative regulation of response to stimulus",8.003,5.7305,0.822,0.519,"response to cytokine"),
c("GO:0002520","immune system development",4.605,4.9469,0.758,0.488,"response to cytokine"),
c("GO:0034340","response to type I interferon",0.485,14.4949,0.748,0.665,"response to cytokine"),
c("GO:0050830","defense response to Gram-positive bacterium",0.265,4.5622,0.866,0.642,"response to cytokine"),
c("GO:0044249","cellular biosynthetic process",35.955,4.6253,0.931,0.214,"response to cytokine"),
c("GO:0019221","cytokine-mediated signaling pathway",3.260,26.1688,0.826,0.464,"response to cytokine"),
c("GO:0050790","regulation of catalytic activity",13.993,5.4056,0.935,0.696,"response to cytokine"),
c("GO:1901576","organic substance biosynthetic process",36.451,4.5129,0.936,0.618,"response to cytokine"),
c("GO:0050777","negative regulation of immune response",0.721,6.4737,0.717,0.668,"response to cytokine"),
c("GO:0042110","T cell activation",2.637,5.6840,0.776,0.447,"response to cytokine"),
c("GO:0050778","positive regulation of immune response",4.501,18.0846,0.630,0.116,"response to cytokine"),
c("GO:0070887","cellular response to chemical stimulus",15.701,16.7932,0.885,0.594,"response to cytokine"),
c("GO:0019438","aromatic compound biosynthetic process",25.793,4.5670,0.934,0.529,"response to cytokine"),
c("GO:0009597","detection of virus",0.029,4.2716,0.919,0.515,"response to cytokine"),
c("GO:0043123","positive regulation of I-kappaB kinase/NF-kappaB signaling",1.044,8.7496,0.798,0.480,"response to cytokine"),
c("GO:0009607","response to biotic stimulus",5.107,23.8356,0.935,0.120,"response to cytokine"),
c("GO:0009605","response to external stimulus",12.043,18.7773,0.926,0.196,"response to cytokine"),
c("GO:0019883","antigen processing and presentation of endogenous antigen",0.069,5.1169,0.841,0.578,"response to cytokine"),
c("GO:0019882","antigen processing and presentation",1.339,6.7852,0.831,0.407,"response to cytokine"),
c("GO:0019885","antigen processing and presentation of endogenous peptide antigen via MHC class I",0.046,5.6819,0.837,0.677,"response to cytokine"),
c("GO:0044093","positive regulation of molecular function",10.998,5.4295,0.938,0.481,"response to cytokine"),
c("GO:0071310","cellular response to organic substance",12.977,19.3270,0.875,0.590,"response to cytokine"),
c("GO:0042221","response to chemical",23.993,15.9508,0.917,0.307,"response to cytokine"),
c("GO:0010033","response to organic substance",16.515,17.6253,0.895,0.447,"response to cytokine"),
c("GO:0098586","cellular response to virus",0.225,5.5751,0.904,0.631,"response to cytokine"),
c("GO:0030097","hemopoiesis",4.108,5.3316,0.755,0.479,"response to cytokine"),
c("GO:0002687","positive regulation of leukocyte migration",0.664,5.4486,0.688,0.650,"response to cytokine"),
c("GO:0046643","regulation of gamma-delta T cell activation",0.040,4.1726,0.801,0.618,"response to cytokine"),
c("GO:0002683","negative regulation of immune system process",2.152,5.7352,0.742,0.656,"response to cytokine"),
c("GO:0002682","regulation of immune system process",8.344,20.9666,0.751,0.653,"response to cytokine"),
c("GO:0018130","heterocycle biosynthetic process",25.770,4.5800,0.934,0.528,"response to cytokine"),
c("GO:0002699","positive regulation of immune effector process",0.958,12.6198,0.705,0.680,"response to cytokine"),
c("GO:0002697","regulation of immune effector process",1.922,15.1681,0.743,0.646,"response to cytokine"),
c("GO:0002252","immune effector process",6.896,23.0904,0.796,0.627,"response to cytokine"),
c("GO:0002250","adaptive immune response",2.845,10.8794,0.768,0.564,"response to cytokine"),
c("GO:0002753","cytoplasmic pattern recognition receptor signaling pathway",0.335,5.2993,0.676,0.610,"response to cytokine"),
c("GO:0032101","regulation of response to external stimulus",3.976,6.4449,0.820,0.596,"response to cytokine"),
c("GO:0032103","positive regulation of response to external stimulus",1.518,4.6108,0.790,0.516,"response to cytokine"),
c("GO:1903506","regulation of nucleic acid-templated transcription",21.073,4.1818,0.836,0.687,"response to cytokine"),
c("GO:0051090","regulation of sequence-specific DNA binding transcription factor activity",2.164,4.8697,0.885,0.334,"response to cytokine"),
c("GO:0051092","positive regulation of NF-kappaB transcription factor activity",0.785,7.9393,0.857,0.204,"response to cytokine"),
c("GO:0060337","type I interferon signaling pathway",0.462,14.6840,0.711,0.692,"response to cytokine"),
c("GO:1901362","organic cyclic compound biosynthetic process",26.549,4.3546,0.939,0.535,"response to cytokine"),
c("GO:0009967","positive regulation of signal transduction",8.309,8.9031,0.746,0.659,"response to cytokine"),
c("GO:0006952","defense response",8.904,31.0434,0.895,0.431,"response to cytokine"),
c("GO:0006950","response to stress",21.310,21.5017,0.919,0.159,"response to cytokine"),
c("GO:0006955","immune response",11.858,29.3143,0.742,0.579,"response to cytokine"),
c("GO:0006954","inflammatory response",3.785,9.8962,0.875,0.678,"response to cytokine"),
c("GO:0070555","response to interleukin-1",0.664,4.4634,0.902,0.690,"response to cytokine"),
c("GO:0080134","regulation of response to stress",7.657,13.2111,0.820,0.515,"response to cytokine"),
c("GO:0034654","nucleobase-containing compound biosynthetic process",25.378,4.6737,0.924,0.525,"response to cytokine"),
c("GO:0044419","interspecies interaction between organisms",4.334,12.1512,0.955,0.000,"interspecies interaction between organisms"),
c("GO:0016032","viral process",4.091,10.6655,0.939,0.659,"interspecies interaction between organisms"),
c("GO:0043900","regulation of multi-organism process",1.379,11.0278,0.919,0.562,"interspecies interaction between organisms"),
c("GO:0050896","response to stimulus",49.302,21.0168,0.997,0.000,"response to stimulus"),
c("GO:0051179","localization",36.018,10.1198,0.996,0.000,"localization"),
c("GO:0051704","multi-organism process",9.873,17.0696,0.995,0.000,"multi-organism process"),
c("GO:0065007","biological regulation",67.069,14.8182,0.998,0.000,"biological regulation"),
c("GO:0071840","cellular component organization or biogenesis",36.532,4.9872,0.996,0.000,"cellular component organization or biogenesis"),
c("GO:0007154","cell communication",36.705,19.1018,0.992,0.005,"cell communication"),
c("GO:0009306","protein secretion",2.856,9.0953,0.864,0.015,"protein secretion"),
c("GO:0051234","establishment of localization",29.960,9.5735,0.921,0.536,"protein secretion"),
c("GO:0006810","transport",29.215,9.8447,0.905,0.389,"protein secretion"),
c("GO:0051223","regulation of protein transport",4.310,6.2890,0.821,0.590,"protein secretion"),
c("GO:0016043","cellular component organization",35.684,4.7399,0.985,0.234,"protein secretion"),
c("GO:0032880","regulation of protein localization",5.603,4.8601,0.846,0.646,"protein secretion"),
c("GO:0032879","regulation of localization",14.409,7.5719,0.879,0.412,"protein secretion"),
c("GO:0071702","organic substance transport",15.586,8.4522,0.913,0.547,"protein secretion"),
c("GO:0071705","nitrogen compound transport",4.472,6.0000,0.928,0.261,"protein secretion"),
c("GO:0046903","secretion",8.892,9.9031,0.895,0.463,"protein secretion"),
c("GO:0016192","vesicle-mediated transport",11.385,4.8601,0.918,0.496,"protein secretion"),
c("GO:0060627","regulation of vesicle-mediated transport",2.683,5.2716,0.849,0.596,"protein secretion"),
c("GO:0065003","macromolecular complex assembly",9.977,4.3686,0.986,0.383,"protein secretion"),
c("GO:0030100","regulation of endocytosis",1.200,4.9508,0.858,0.218,"protein secretion"),
c("GO:0033036","macromolecule localization",16.624,8.2907,0.929,0.432,"protein secretion"),
c("GO:0002790","peptide secretion",1.414,8.8239,0.877,0.564,"protein secretion"),
c("GO:0051047","positive regulation of secretion",2.106,7.0521,0.784,0.595,"protein secretion"),
c("GO:0051046","regulation of secretion",4.033,5.6676,0.826,0.652,"protein secretion"),
c("GO:0051050","positive regulation of transport",5.349,8.5702,0.792,0.664,"protein secretion"),
c("GO:0051049","regulation of transport",10.519,9.0132,0.836,0.615,"protein secretion"),
c("GO:0051128","regulation of cellular component organization",13.335,4.4001,0.922,0.420,"protein secretion"),
c("GO:0008283","cell proliferation",11.321,4.2248,0.983,0.019,"cell proliferation"),
c("GO:0001910","regulation of leukocyte mediated cytotoxicity",0.289,6.5143,0.940,0.036,"regulation of leukocyte mediated cytotoxicity"),
c("GO:0070265","necrotic cell death",0.289,5.4660,0.966,0.037,"necrotic cell death"),
c("GO:0070266","necroptotic process",0.214,6.0200,0.960,0.313,"necrotic cell death"),
c("GO:0012501","programmed cell death",11.246,5.2262,0.951,0.571,"necrotic cell death"),
c("GO:0097191","extrinsic apoptotic signaling pathway",1.246,4.2581,0.870,0.368,"necrotic cell death"),
c("GO:0008285","negative regulation of cell proliferation",3.716,4.2510,0.917,0.050,"negative regulation of cell proliferation"),
c("GO:0048523","negative regulation of cellular process",24.951,8.9508,0.898,0.411,"negative regulation of cell proliferation"),
c("GO:0042127","regulation of cell proliferation",8.898,4.3363,0.925,0.676,"negative regulation of cell proliferation"),
c("GO:1901565","organonitrogen compound catabolic process",2.129,5.4078,0.962,0.050,"organonitrogen compound catabolism"),
c("GO:0080090","regulation of primary metabolic process",33.566,6.0835,0.858,0.538,"organonitrogen compound catabolism"),
c("GO:0031323","regulation of cellular metabolic process",33.837,5.8962,0.851,0.608,"organonitrogen compound catabolism"),
c("GO:0051246","regulation of protein metabolic process",14.651,5.5391,0.856,0.402,"organonitrogen compound catabolism"),
c("GO:1901564","organonitrogen compound metabolic process",13.324,10.2277,0.957,0.187,"organonitrogen compound catabolism"),
c("GO:0060255","regulation of macromolecule metabolic process",33.630,5.0726,0.851,0.609,"organonitrogen compound catabolism"),
c("GO:0051603","proteolysis involved in cellular protein catabolic process",3.710,4.3458,0.928,0.554,"organonitrogen compound catabolism"),
c("GO:0051171","regulation of nitrogen compound metabolic process",25.470,6.3420,0.866,0.324,"organonitrogen compound catabolism"),
c("GO:0001775","cell activation",7.900,8.4908,0.973,0.057,"cell activation"),
c("GO:0008219","cell death",11.881,5.5768,0.971,0.075,"cell death"),
c("GO:0050794","regulation of cellular process",60.427,17.7595,0.907,0.088,"regulation of cellular process"),
c("GO:0048519","negative regulation of biological process",26.855,11.3116,0.925,0.183,"regulation of cellular process"),
c("GO:0048518","positive regulation of biological process",30.969,14.5850,0.923,0.198,"regulation of cellular process"),
c("GO:0019222","regulation of metabolic process",35.730,5.3799,0.899,0.217,"regulation of cellular process"),
c("GO:0050789","regulation of biological process",63.456,16.0004,0.926,0.274,"regulation of cellular process"),
c("GO:0065009","regulation of molecular function",17.288,7.8729,0.944,0.116,"regulation of cellular process"),
c("GO:0007249","I-kappaB kinase/NF-kappaB signaling",1.535,7.4763,0.879,0.099,"I-kappaB kinase/NF-kappaB signaling"),
c("GO:0023051","regulation of signaling",17.946,9.1331,0.903,0.454,"I-kappaB kinase/NF-kappaB signaling"),
c("GO:0023056","positive regulation of signaling",9.100,9.1024,0.839,0.337,"I-kappaB kinase/NF-kappaB signaling"),
c("GO:0031325","positive regulation of cellular metabolic process",16.590,4.5850,0.798,0.604,"I-kappaB kinase/NF-kappaB signaling"),
c("GO:0016310","phosphorylation",13.018,4.6021,0.930,0.620,"I-kappaB kinase/NF-kappaB signaling"),
c("GO:0035556","intracellular signal transduction",15.101,6.5654,0.846,0.388,"I-kappaB kinase/NF-kappaB signaling"),
c("GO:0010646","regulation of cell communication",17.651,9.2684,0.898,0.449,"I-kappaB kinase/NF-kappaB signaling"),
c("GO:0010647","positive regulation of cell communication",9.054,9.1261,0.837,0.299,"I-kappaB kinase/NF-kappaB signaling"),
c("GO:0007166","cell surface receptor signaling pathway",15.868,20.0467,0.844,0.241,"I-kappaB kinase/NF-kappaB signaling"),
c("GO:0007165","signal transduction",33.618,18.0137,0.824,0.436,"I-kappaB kinase/NF-kappaB signaling"),
c("GO:0042327","positive regulation of phosphorylation",5.384,5.4377,0.807,0.348,"I-kappaB kinase/NF-kappaB signaling"),
c("GO:1902531","regulation of intracellular signal transduction",10.006,5.6459,0.794,0.690,"I-kappaB kinase/NF-kappaB signaling"),
c("GO:0000165","MAPK cascade",5.032,5.0395,0.780,0.600,"I-kappaB kinase/NF-kappaB signaling"),
c("GO:0038061","NIK/NF-kappaB signaling",0.716,6.0650,0.889,0.352,"I-kappaB kinase/NF-kappaB signaling"),
c("GO:0009966","regulation of signal transduction",15.915,8.8153,0.785,0.674,"I-kappaB kinase/NF-kappaB signaling"),
c("GO:0006468","protein phosphorylation",10.854,4.9066,0.887,0.690,"I-kappaB kinase/NF-kappaB signaling"),
c("GO:0051174","regulation of phosphorus metabolic process",9.492,4.6517,0.865,0.517,"I-kappaB kinase/NF-kappaB signaling"),
c("GO:0023014","signal transduction by protein phosphorylation",5.239,4.9957,0.791,0.667,"I-kappaB kinase/NF-kappaB signaling"));

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
