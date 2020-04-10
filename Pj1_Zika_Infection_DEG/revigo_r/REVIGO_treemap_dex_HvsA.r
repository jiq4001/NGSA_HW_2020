

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
revigo.data <- rbind(c("GO:0000003","reproduction",7.871,7.5157,1.000,0.000,"reproduction"),
c("GO:0002376","immune system process",16.463,15.0809,0.995,0.000,"immune system process"),
c("GO:0002443","leukocyte mediated immunity",4.859,6.8794,0.951,0.000,"leukocyte mediated immunity"),
c("GO:0048534","hematopoietic or lymphoid organ development",4.339,6.1409,0.891,0.489,"leukocyte mediated immunity"),
c("GO:0002520","immune system development",4.605,6.3179,0.891,0.494,"leukocyte mediated immunity"),
c("GO:0002252","immune effector process",6.896,9.7570,0.959,0.627,"leukocyte mediated immunity"),
c("GO:0002274","myeloid leukocyte activation",3.531,6.0788,0.932,0.473,"leukocyte mediated immunity"),
c("GO:0006955","immune response",11.858,12.5100,0.915,0.585,"leukocyte mediated immunity"),
c("GO:0008150","biological_process",100.000,74.1373,1.000,0.000,"biological_process"),
c("GO:0008152","metabolic process",64.841,55.2020,0.998,0.000,"metabolism"),
c("GO:0009987","cellular process",90.329,65.6073,0.999,0.000,"cellular process"),
c("GO:0016032","viral process",4.091,13.4559,0.982,0.000,"viral process"),
c("GO:0044419","interspecies interaction between organisms",4.334,13.6799,0.987,0.659,"viral process"),
c("GO:0022610","biological adhesion",8.540,10.5482,0.995,0.000,"biological adhesion"),
c("GO:0023052","signaling",36.613,22.8268,0.996,0.000,"signaling"),
c("GO:0032501","multicellular organismal process",41.143,21.4776,0.997,0.000,"multicellular organismal process"),
c("GO:0032502","developmental process",33.982,23.8239,0.996,0.000,"developmental process"),
c("GO:0040007","growth",5.447,8.1238,0.995,0.000,"growth"),
c("GO:0040011","locomotion",9.452,9.8386,0.995,0.000,"locomotion"),
c("GO:0050896","response to stimulus",49.302,40.8477,0.997,0.000,"response to stimulus"),
c("GO:0051179","localization",36.018,26.4473,0.996,0.000,"localization"),
c("GO:0051704","multi-organism process",9.873,17.7447,0.995,0.000,"multi-organism process"),
c("GO:0065007","biological regulation",67.069,47.3170,0.998,0.000,"biological regulation"),
c("GO:0071705","nitrogen compound transport",4.472,11.6478,0.951,0.000,"nitrogen compound transport"),
c("GO:0030334","regulation of cell migration",3.912,8.4660,0.875,0.206,"nitrogen compound transport"),
c("GO:0051234","establishment of localization",29.960,17.6478,0.939,0.536,"nitrogen compound transport"),
c("GO:0006810","transport",29.215,17.8386,0.932,0.399,"nitrogen compound transport"),
c("GO:0070727","cellular macromolecule localization",9.654,7.8861,0.938,0.700,"nitrogen compound transport"),
c("GO:0051270","regulation of cellular component movement",4.605,8.4179,0.878,0.622,"nitrogen compound transport"),
c("GO:0032879","regulation of localization",14.409,13.9101,0.887,0.412,"nitrogen compound transport"),
c("GO:0006887","exocytosis",4.986,8.2472,0.917,0.285,"nitrogen compound transport"),
c("GO:0071702","organic substance transport",15.586,11.6716,0.939,0.547,"nitrogen compound transport"),
c("GO:0046907","intracellular transport",10.023,6.5918,0.937,0.478,"nitrogen compound transport"),
c("GO:0046903","secretion",8.892,11.0958,0.930,0.497,"nitrogen compound transport"),
c("GO:0016192","vesicle-mediated transport",11.385,12.5702,0.942,0.496,"nitrogen compound transport"),
c("GO:0008104","protein localization",14.414,13.9508,0.939,0.413,"nitrogen compound transport"),
c("GO:0033036","macromolecule localization",16.624,15.4473,0.946,0.432,"nitrogen compound transport"),
c("GO:0051049","regulation of transport",10.519,7.8665,0.881,0.622,"nitrogen compound transport"),
c("GO:0015833","peptide transport",1.529,9.6055,0.953,0.239,"nitrogen compound transport"),
c("GO:0040012","regulation of locomotion",4.484,8.5272,0.929,0.673,"nitrogen compound transport"),
c("GO:0051674","localization of cell",8.257,9.2048,0.953,0.233,"nitrogen compound transport"),
c("GO:0051641","cellular localization",14.905,10.4318,0.947,0.417,"nitrogen compound transport"),
c("GO:0071840","cellular component organization or biogenesis",36.532,28.6925,0.996,0.000,"cellular component organization or biogenesis"),
c("GO:0043408","regulation of MAPK cascade",3.883,10.4353,0.679,0.003,"regulation of MAPK cascade"),
c("GO:0018193","peptidyl-amino acid modification",6.907,12.0937,0.874,0.395,"regulation of MAPK cascade"),
c("GO:1901701","cellular response to oxygen-containing compound",5.632,10.6459,0.923,0.635,"regulation of MAPK cascade"),
c("GO:1901700","response to oxygen-containing compound",8.679,11.8570,0.935,0.505,"regulation of MAPK cascade"),
c("GO:0023051","regulation of signaling",17.946,27.5100,0.898,0.256,"regulation of MAPK cascade"),
c("GO:0006796","phosphate-containing compound metabolic process",18.188,21.5901,0.855,0.550,"regulation of MAPK cascade"),
c("GO:0023056","positive regulation of signaling",9.100,14.3565,0.841,0.666,"regulation of MAPK cascade"),
c("GO:0080090","regulation of primary metabolic process",33.566,34.8928,0.774,0.608,"regulation of MAPK cascade"),
c("GO:0023057","negative regulation of signaling",7.080,18.0250,0.858,0.628,"regulation of MAPK cascade"),
c("GO:0032268","regulation of cellular protein metabolic process",13.728,22.6126,0.755,0.626,"regulation of MAPK cascade"),
c("GO:1905114","cell surface receptor signaling pathway involved in cell-cell signaling",3.329,7.6968,0.871,0.218,"regulation of MAPK cascade"),
c("GO:0031323","regulation of cellular metabolic process",33.837,37.1057,0.764,0.305,"regulation of MAPK cascade"),
c("GO:0051716","cellular response to stimulus",40.358,32.5622,0.932,0.180,"regulation of MAPK cascade"),
c("GO:0031326","regulation of cellular biosynthetic process",24.939,21.9830,0.738,0.535,"regulation of MAPK cascade"),
c("GO:0051246","regulation of protein metabolic process",14.651,22.1530,0.788,0.488,"regulation of MAPK cascade"),
c("GO:0051248","negative regulation of protein metabolic process",6.197,6.5867,0.764,0.688,"regulation of MAPK cascade"),
c("GO:0016051","carbohydrate biosynthetic process",1.131,6.4685,0.899,0.274,"regulation of MAPK cascade"),
c("GO:0042493","response to drug",2.366,6.0057,0.946,0.314,"regulation of MAPK cascade"),
c("GO:0016055","Wnt signaling pathway",2.724,6.0472,0.875,0.625,"regulation of MAPK cascade"),
c("GO:0042059","negative regulation of epidermal growth factor receptor signaling pathway",0.231,6.0066,0.878,0.332,"regulation of MAPK cascade"),
c("GO:0048584","positive regulation of response to stimulus",12.268,11.0035,0.827,0.610,"regulation of MAPK cascade"),
c("GO:0019752","carboxylic acid metabolic process",5.557,8.4841,0.890,0.424,"regulation of MAPK cascade"),
c("GO:0048583","regulation of response to stimulus",21.610,24.3152,0.886,0.294,"regulation of MAPK cascade"),
c("GO:0006357","regulation of transcription from RNA polymerase II promoter",10.900,10.2373,0.743,0.572,"regulation of MAPK cascade"),
c("GO:0035556","intracellular signal transduction",15.101,20.7011,0.851,0.353,"regulation of MAPK cascade"),
c("GO:0010646","regulation of cell communication",17.651,27.2684,0.891,0.255,"regulation of MAPK cascade"),
c("GO:0010648","negative regulation of cell communication",7.057,18.0721,0.857,0.636,"regulation of MAPK cascade"),
c("GO:0010647","positive regulation of cell communication",9.054,13.7852,0.837,0.674,"regulation of MAPK cascade"),
c("GO:0055114","oxidation-reduction process",5.828,10.7144,0.917,0.428,"regulation of MAPK cascade"),
c("GO:0071214","cellular response to abiotic stimulus",1.685,6.9747,0.948,0.148,"regulation of MAPK cascade"),
c("GO:0044267","cellular protein metabolic process",28.505,31.4711,0.845,0.344,"regulation of MAPK cascade"),
c("GO:0009628","response to abiotic stimulus",6.705,12.9914,0.955,0.199,"regulation of MAPK cascade"),
c("GO:0007267","cell-cell signaling",9.025,9.9706,0.930,0.309,"regulation of MAPK cascade"),
c("GO:0071363","cellular response to growth factor stimulus",3.618,6.8210,0.921,0.547,"regulation of MAPK cascade"),
c("GO:0070887","cellular response to chemical stimulus",15.701,21.2336,0.914,0.432,"regulation of MAPK cascade"),
c("GO:0070848","response to growth factor",3.762,6.5452,0.938,0.466,"regulation of MAPK cascade"),
c("GO:0009605","response to external stimulus",12.043,8.3883,0.950,0.237,"regulation of MAPK cascade"),
c("GO:0071310","cellular response to organic substance",12.977,17.8268,0.909,0.598,"regulation of MAPK cascade"),
c("GO:0007167","enzyme linked receptor protein signaling pathway",5.713,10.1772,0.870,0.494,"regulation of MAPK cascade"),
c("GO:0007166","cell surface receptor signaling pathway",15.868,17.1361,0.849,0.388,"regulation of MAPK cascade"),
c("GO:0007165","signal transduction",33.618,22.8297,0.825,0.454,"regulation of MAPK cascade"),
c("GO:0042221","response to chemical",23.993,21.7773,0.943,0.307,"regulation of MAPK cascade"),
c("GO:0010033","response to organic substance",16.515,19.8729,0.927,0.594,"regulation of MAPK cascade"),
c("GO:0071345","cellular response to cytokine stimulus",4.172,7.6198,0.922,0.173,"regulation of MAPK cascade"),
c("GO:0010468","regulation of gene expression",25.084,16.8013,0.771,0.536,"regulation of MAPK cascade"),
c("GO:0009719","response to endogenous stimulus",9.175,7.6253,0.952,0.218,"regulation of MAPK cascade"),
c("GO:0034097","response to cytokine",4.714,7.4763,0.936,0.483,"regulation of MAPK cascade"),
c("GO:0033554","cellular response to stress",10.496,19.6478,0.924,0.456,"regulation of MAPK cascade"),
c("GO:0006082","organic acid metabolic process",6.284,8.8665,0.889,0.657,"regulation of MAPK cascade"),
c("GO:0009314","response to radiation",2.499,6.8827,0.957,0.649,"regulation of MAPK cascade"),
c("GO:0060255","regulation of macromolecule metabolic process",33.630,30.2480,0.764,0.609,"regulation of MAPK cascade"),
c("GO:0009889","regulation of biosynthetic process",25.216,22.0191,0.770,0.537,"regulation of MAPK cascade"),
c("GO:1902531","regulation of intracellular signal transduction",10.006,17.8761,0.829,0.690,"regulation of MAPK cascade"),
c("GO:0044281","small molecule metabolic process",12.072,11.7282,0.905,0.396,"regulation of MAPK cascade"),
c("GO:0006979","response to oxidative stress",2.406,8.5045,0.949,0.357,"regulation of MAPK cascade"),
c("GO:0006974","cellular response to DNA damage stimulus",4.576,9.4989,0.926,0.171,"regulation of MAPK cascade"),
c("GO:0009967","positive regulation of signal transduction",8.309,12.6635,0.793,0.660,"regulation of MAPK cascade"),
c("GO:0009968","negative regulation of signal transduction",6.474,14.9626,0.816,0.624,"regulation of MAPK cascade"),
c("GO:0009966","regulation of signal transduction",15.915,25.2832,0.821,0.562,"regulation of MAPK cascade"),
c("GO:0006950","response to stress",21.310,25.6308,0.945,0.292,"regulation of MAPK cascade"),
c("GO:0080135","regulation of cellular response to stress",3.543,9.2557,0.873,0.628,"regulation of MAPK cascade"),
c("GO:0080134","regulation of response to stress",7.657,8.8239,0.878,0.504,"regulation of MAPK cascade"),
c("GO:0006464","cellular protein modification process",22.683,25.4989,0.838,0.566,"regulation of MAPK cascade"),
c("GO:0046777","protein autophosphorylation",1.333,6.0491,0.866,0.523,"regulation of MAPK cascade"),
c("GO:0006468","protein phosphorylation",10.854,17.0830,0.817,0.695,"regulation of MAPK cascade"),
c("GO:0031098","stress-activated protein kinase signaling cascade",1.506,7.2541,0.877,0.554,"regulation of MAPK cascade"),
c("GO:0051174","regulation of phosphorus metabolic process",9.492,16.6696,0.784,0.672,"regulation of MAPK cascade"),
c("GO:0006508","proteolysis",10.294,8.9431,0.889,0.439,"regulation of MAPK cascade"),
c("GO:0198738","cell-cell signaling by wnt",2.729,6.0259,0.937,0.625,"regulation of MAPK cascade"),
c("GO:0023014","signal transduction by protein phosphorylation",5.239,10.9914,0.747,0.639,"regulation of MAPK cascade"),
c("GO:0071495","cellular response to endogenous stimulus",7.144,7.7852,0.948,0.202,"regulation of MAPK cascade"),
c("GO:0051171","regulation of nitrogen compound metabolic process",25.470,34.2676,0.774,0.540,"regulation of MAPK cascade"),
c("GO:0007154","cell communication",36.705,23.2020,0.990,0.005,"cell communication"),
c("GO:0008283","cell proliferation",11.321,11.8665,0.982,0.020,"cell proliferation"),
c("GO:0042592","homeostatic process",9.371,6.6517,0.948,0.047,"homeostatic process"),
c("GO:0044057","regulation of system process",2.862,7.8239,0.919,0.049,"regulation of system process"),
c("GO:0003008","system process",11.575,7.0381,0.963,0.259,"regulation of system process"),
c("GO:0051241","negative regulation of multicellular organismal process",5.741,7.8539,0.864,0.596,"regulation of system process"),
c("GO:0051240","positive regulation of multicellular organismal process",8.327,11.7100,0.843,0.527,"regulation of system process"),
c("GO:0051239","regulation of multicellular organismal process",15.268,22.6576,0.899,0.192,"regulation of system process"),
c("GO:1901565","organonitrogen compound catabolic process",2.129,9.8182,0.895,0.049,"organonitrogen compound catabolism"),
c("GO:0032774","RNA biosynthetic process",22.649,18.5622,0.798,0.682,"organonitrogen compound catabolism"),
c("GO:0031329","regulation of cellular catabolic process",2.256,6.0320,0.829,0.580,"organonitrogen compound catabolism"),
c("GO:0051252","regulation of RNA metabolic process",21.864,19.6676,0.725,0.598,"organonitrogen compound catabolism"),
c("GO:0019219","regulation of nucleobase-containing compound metabolic process",23.912,20.9208,0.733,0.691,"organonitrogen compound catabolism"),
c("GO:0006366","transcription from RNA polymerase II promoter",12.072,11.4413,0.819,0.633,"organonitrogen compound catabolism"),
c("GO:0016070","RNA metabolic process",26.924,22.4634,0.821,0.575,"organonitrogen compound catabolism"),
c("GO:0044270","cellular nitrogen compound catabolic process",2.481,8.3179,0.885,0.588,"organonitrogen compound catabolism"),
c("GO:1901564","organonitrogen compound metabolic process",13.324,40.2048,0.900,0.187,"organonitrogen compound catabolism"),
c("GO:1901566","organonitrogen compound biosynthetic process",8.211,6.5258,0.882,0.550,"organonitrogen compound catabolism"),
c("GO:0006139","nucleobase-containing compound metabolic process",33.601,27.2993,0.838,0.605,"organonitrogen compound catabolism"),
c("GO:0019439","aromatic compound catabolic process",2.550,8.9208,0.886,0.578,"organonitrogen compound catabolism"),
c("GO:0019438","aromatic compound biosynthetic process",25.793,20.1029,0.839,0.537,"organonitrogen compound catabolism"),
c("GO:0006259","DNA metabolic process",5.661,7.8069,0.875,0.224,"organonitrogen compound catabolism"),
c("GO:0090304","nucleic acid metabolic process",29.879,25.8633,0.827,0.500,"organonitrogen compound catabolism"),
c("GO:0018130","heterocycle biosynthetic process",25.770,19.6144,0.838,0.542,"organonitrogen compound catabolism"),
c("GO:0030163","protein catabolic process",4.645,7.9586,0.868,0.593,"organonitrogen compound catabolism"),
c("GO:0046700","heterocycle catabolic process",2.464,8.3288,0.886,0.587,"organonitrogen compound catabolism"),
c("GO:0097659","nucleic acid-templated transcription",21.991,18.6778,0.796,0.632,"organonitrogen compound catabolism"),
c("GO:0009894","regulation of catabolic process",3.006,8.9101,0.834,0.524,"organonitrogen compound catabolism"),
c("GO:1901361","organic cyclic compound catabolic process",2.706,8.4750,0.893,0.539,"organonitrogen compound catabolism"),
c("GO:0034641","cellular nitrogen compound metabolic process",37.432,31.2757,0.858,0.365,"organonitrogen compound catabolism"),
c("GO:0034655","nucleobase-containing compound catabolic process",2.198,8.9666,0.878,0.517,"organonitrogen compound catabolism"),
c("GO:0040008","regulation of growth",3.647,7.1302,0.946,0.051,"regulation of growth"),
c("GO:0030155","regulation of cell adhesion",3.780,7.6778,0.941,0.051,"regulation of cell adhesion"),
c("GO:0097435","supramolecular fiber organization",3.278,10.2013,0.945,0.052,"supramolecular fiber organization"),
c("GO:0048522","positive regulation of cellular process",27.732,29.6253,0.846,0.331,"supramolecular fiber organization"),
c("GO:0031328","positive regulation of cellular biosynthetic process",10.167,12.0438,0.731,0.698,"supramolecular fiber organization"),
c("GO:0031325","positive regulation of cellular metabolic process",16.590,23.3098,0.740,0.526,"supramolecular fiber organization"),
c("GO:0016043","cellular component organization",35.684,28.7055,0.950,0.289,"supramolecular fiber organization"),
c("GO:0034330","cell junction organization",1.466,5.9914,0.950,0.173,"supramolecular fiber organization"),
c("GO:0051276","chromosome organization",3.566,6.7696,0.954,0.393,"supramolecular fiber organization"),
c("GO:0045935","positive regulation of nucleobase-containing compound metabolic process",9.763,12.7375,0.727,0.691,"supramolecular fiber organization"),
c("GO:0010638","positive regulation of organelle organization",3.110,7.7645,0.854,0.385,"supramolecular fiber organization"),
c("GO:0010628","positive regulation of gene expression",9.833,11.3556,0.761,0.692,"supramolecular fiber organization"),
c("GO:0022607","cellular component assembly",15.638,14.9626,0.949,0.535,"supramolecular fiber organization"),
c("GO:0044089","positive regulation of cellular component biogenesis",2.712,6.5528,0.880,0.182,"supramolecular fiber organization"),
c("GO:0044085","cellular component biogenesis",17.149,15.0590,0.961,0.458,"supramolecular fiber organization"),
c("GO:0043933","macromolecular complex subunit organization",14.259,8.6778,0.956,0.429,"supramolecular fiber organization"),
c("GO:0033043","regulation of organelle organization",6.082,8.2596,0.889,0.637,"supramolecular fiber organization"),
c("GO:1902905","positive regulation of supramolecular fiber organization",1.010,6.7399,0.861,0.619,"supramolecular fiber organization"),
c("GO:0009893","positive regulation of metabolic process",17.715,22.7423,0.783,0.537,"supramolecular fiber organization"),
c("GO:0007010","cytoskeleton organization",6.861,8.9469,0.950,0.439,"supramolecular fiber organization"),
c("GO:0006996","organelle organization",19.411,19.2111,0.954,0.479,"supramolecular fiber organization"),
c("GO:0030036","actin cytoskeleton organization",3.387,7.9914,0.916,0.195,"supramolecular fiber organization"),
c("GO:0051128","regulation of cellular component organization",13.335,15.1844,0.893,0.420,"supramolecular fiber organization"),
c("GO:0051130","positive regulation of cellular component organization",6.861,8.9788,0.846,0.568,"supramolecular fiber organization"),
c("GO:0030029","actin filament-based process",3.907,8.3665,0.968,0.054,"actin filament-based process"),
c("GO:0006091","generation of precursor metabolites and energy",2.129,9.0969,0.945,0.059,"generation of precursor metabolites and energy"),
c("GO:0005975","carbohydrate metabolic process",3.387,6.9957,0.946,0.061,"carbohydrate metabolism"),
c("GO:0008285","negative regulation of cell proliferation",3.716,9.1302,0.895,0.061,"negative regulation of cell proliferation"),
c("GO:0048523","negative regulation of cellular process",24.951,36.4283,0.864,0.434,"negative regulation of cell proliferation"),
c("GO:0051726","regulation of cell cycle",5.840,10.5884,0.913,0.664,"negative regulation of cell proliferation"),
c("GO:0048585","negative regulation of response to stimulus",8.003,15.8570,0.851,0.491,"negative regulation of cell proliferation"),
c("GO:0045934","negative regulation of nucleobase-containing compound metabolic process",7.807,8.9172,0.752,0.657,"negative regulation of cell proliferation"),
c("GO:0010629","negative regulation of gene expression",8.477,6.1457,0.779,0.689,"negative regulation of cell proliferation"),
c("GO:0042127","regulation of cell proliferation",8.898,9.7055,0.919,0.676,"negative regulation of cell proliferation"),
c("GO:0043066","negative regulation of apoptotic process",4.749,8.1765,0.863,0.329,"negative regulation of cell proliferation"),
c("GO:2000113","negative regulation of cellular macromolecule biosynthetic process",7.576,6.6696,0.749,0.672,"negative regulation of cell proliferation"),
c("GO:0009892","negative regulation of metabolic process",14.605,14.1669,0.792,0.581,"negative regulation of cell proliferation"),
c("GO:0009890","negative regulation of biosynthetic process",8.546,7.1013,0.770,0.669,"negative regulation of cell proliferation"),
c("GO:0045786","negative regulation of cell cycle",3.318,6.1811,0.886,0.311,"negative regulation of cell proliferation"),
c("GO:0051172","negative regulation of nitrogen compound metabolic process",8.632,16.0070,0.774,0.501,"negative regulation of cell proliferation"),
c("GO:0060284","regulation of cell development",4.484,7.7375,0.861,0.063,"regulation of cell development"),
c("GO:0048513","animal organ development",18.719,13.0747,0.898,0.541,"regulation of cell development"),
c("GO:0007399","nervous system development",12.770,12.6364,0.905,0.391,"regulation of cell development"),
c("GO:0072359","circulatory system development",5.361,8.4045,0.918,0.405,"regulation of cell development"),
c("GO:0001944","vasculature development",3.480,6.7282,0.921,0.244,"regulation of cell development"),
c("GO:0048608","reproductive structure development",2.429,6.3546,0.923,0.285,"regulation of cell development"),
c("GO:0022603","regulation of anatomical structure morphogenesis",5.430,8.5272,0.874,0.665,"regulation of cell development"),
c("GO:0022604","regulation of cell morphogenesis",2.452,7.1733,0.840,0.522,"regulation of cell development"),
c("GO:0050793","regulation of developmental process",12.949,15.5482,0.876,0.277,"regulation of cell development"),
c("GO:0007275","multicellular organism development",28.938,18.5735,0.897,0.538,"regulation of cell development"),
c("GO:0043009","chordate embryonic development",3.260,6.2604,0.921,0.260,"regulation of cell development"),
c("GO:0048468","cell development",11.056,11.2510,0.898,0.607,"regulation of cell development"),
c("GO:0009653","anatomical structure morphogenesis",13.872,15.2197,0.928,0.355,"regulation of cell development"),
c("GO:0030154","cell differentiation",22.095,17.9957,0.888,0.489,"regulation of cell development"),
c("GO:0035295","tube development",3.283,6.5272,0.927,0.260,"regulation of cell development"),
c("GO:0048856","anatomical structure development",31.558,20.4237,0.920,0.595,"regulation of cell development"),
c("GO:0009790","embryo development",5.505,8.4012,0.921,0.288,"regulation of cell development"),
c("GO:0045595","regulation of cell differentiation",8.707,14.7932,0.848,0.642,"regulation of cell development"),
c("GO:0048869","cellular developmental process",23.093,19.4962,0.895,0.489,"regulation of cell development"),
c("GO:0048646","anatomical structure formation involved in morphogenesis",5.591,7.7747,0.932,0.289,"regulation of cell development"),
c("GO:0009888","tissue development",10.912,10.4260,0.931,0.377,"regulation of cell development"),
c("GO:0009887","animal organ morphogenesis",5.666,6.7799,0.911,0.591,"regulation of cell development"),
c("GO:0051094","positive regulation of developmental process",6.815,6.0778,0.831,0.694,"regulation of cell development"),
c("GO:0048699","generation of neurons",7.877,10.9431,0.887,0.556,"regulation of cell development"),
c("GO:0007417","central nervous system development",5.182,6.6882,0.914,0.653,"regulation of cell development"),
c("GO:0061458","reproductive system development",2.447,6.3170,0.928,0.286,"regulation of cell development"),
c("GO:0048731","system development",25.695,16.6778,0.895,0.607,"regulation of cell development"),
c("GO:0007049","cell cycle",10.000,14.3799,0.963,0.064,"cell cycle"),
c("GO:0001775","cell activation",7.900,9.8268,0.965,0.072,"cell activation"),
c("GO:0008219","cell death",11.881,10.2328,0.962,0.079,"cell death"),
c("GO:0006928","movement of cell or subcellular component",10.987,9.8928,0.963,0.080,"movement of cell or subcellular component"),
c("GO:0044237","cellular metabolic process",59.486,54.8928,0.901,0.081,"cellular metabolism"),
c("GO:0006793","phosphorus metabolic process",18.702,21.9914,0.917,0.139,"cellular metabolism"),
c("GO:0006807","nitrogen compound metabolic process",40.081,52.7570,0.917,0.212,"cellular metabolism"),
c("GO:0044238","primary metabolic process",60.306,53.6271,0.904,0.297,"cellular metabolism"),
c("GO:0044260","cellular macromolecule metabolic process",48.748,43.0716,0.863,0.246,"cellular metabolism"),
c("GO:0009058","biosynthetic process",36.924,27.7282,0.919,0.201,"cellular metabolism"),
c("GO:0009059","macromolecule biosynthetic process",30.127,22.4976,0.845,0.565,"cellular metabolism"),
c("GO:0009056","catabolic process",11.471,18.5272,0.940,0.113,"cellular metabolism"),
c("GO:0044249","cellular biosynthetic process",35.955,27.0991,0.845,0.202,"cellular metabolism"),
c("GO:0043170","macromolecule metabolic process",53.306,45.1524,0.901,0.265,"cellular metabolism"),
c("GO:0044271","cellular nitrogen compound biosynthetic process",28.696,23.0716,0.830,0.553,"cellular metabolism"),
c("GO:1901576","organic substance biosynthetic process",36.451,25.9626,0.854,0.618,"cellular metabolism"),
c("GO:0046483","heterocycle metabolic process",34.576,27.4306,0.901,0.199,"cellular metabolism"),
c("GO:0071704","organic substance metabolic process",62.701,50.7167,0.902,0.313,"cellular metabolism"),
c("GO:0006725","cellular aromatic compound metabolic process",34.801,27.7190,0.901,0.193,"cellular metabolism"),
c("GO:0019538","protein metabolic process",31.991,33.2495,0.890,0.316,"cellular metabolism"),
c("GO:0010467","gene expression",30.542,20.5302,0.892,0.308,"cellular metabolism"),
c("GO:0043412","macromolecule modification",24.172,26.9706,0.899,0.275,"cellular metabolism"),
c("GO:1901362","organic cyclic compound biosynthetic process",26.549,20.2526,0.848,0.535,"cellular metabolism"),
c("GO:1901360","organic cyclic compound metabolic process",35.978,29.1669,0.913,0.198,"cellular metabolism"),
c("GO:0034645","cellular macromolecule biosynthetic process",29.209,21.2581,0.821,0.558,"cellular metabolism"),
c("GO:0050794","regulation of cellular process",60.427,48.1512,0.897,0.092,"regulation of cellular process"),
c("GO:0048519","negative regulation of biological process",26.855,37.5243,0.921,0.183,"regulation of cellular process"),
c("GO:0048518","positive regulation of biological process",30.969,29.4597,0.918,0.198,"regulation of cellular process"),
c("GO:0019222","regulation of metabolic process",35.730,34.0048,0.876,0.217,"regulation of cellular process"),
c("GO:0050790","regulation of catalytic activity",13.993,17.8097,0.911,0.106,"regulation of cellular process"),
c("GO:0050789","regulation of biological process",63.456,46.9355,0.918,0.274,"regulation of cellular process"),
c("GO:0051338","regulation of transferase activity",5.661,8.1986,0.920,0.600,"regulation of cellular process"),
c("GO:0051336","regulation of hydrolase activity",7.934,9.2487,0.916,0.689,"regulation of cellular process"),
c("GO:0043085","positive regulation of catalytic activity",9.279,11.7959,0.911,0.668,"regulation of cellular process"),
c("GO:0044093","positive regulation of molecular function",10.998,15.0585,0.915,0.696,"regulation of cellular process"),
c("GO:0065009","regulation of molecular function",17.288,22.3737,0.941,0.116,"regulation of cellular process"),
c("GO:0065008","regulation of biological quality",20.202,18.0615,0.939,0.125,"regulation of cellular process"));

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