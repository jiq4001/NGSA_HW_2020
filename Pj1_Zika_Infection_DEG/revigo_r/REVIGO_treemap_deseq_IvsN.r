

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
revigo.data <- rbind(c("GO:0001906","cell killing",0.629,13.9547,0.994,0.000,"cell killing"),
c("GO:0002376","immune system process",16.463,65.3242,0.995,0.000,"immune system process"),
c("GO:0002428","antigen processing and presentation of peptide antigen via MHC class Ib",0.017,12.1605,0.859,0.000,"antigen processing and presentation of peptide antigen via MHC class Ib"),
c("GO:0002484","antigen processing and presentation of endogenous peptide antigen via MHC class I via ER pathway",0.006,10.5331,0.862,0.867,"antigen processing and presentation of peptide antigen via MHC class Ib"),
c("GO:0002480","antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-independent",0.052,12.1605,0.847,0.554,"antigen processing and presentation of peptide antigen via MHC class Ib"),
c("GO:0002478","antigen processing and presentation of exogenous peptide antigen",0.975,8.6517,0.809,0.745,"antigen processing and presentation of peptide antigen via MHC class Ib"),
c("GO:0002475","antigen processing and presentation via MHC class Ib",0.058,9.8633,0.850,0.567,"antigen processing and presentation of peptide antigen via MHC class Ib"),
c("GO:0002486","antigen processing and presentation of endogenous peptide antigen via MHC class I via ER pathway, TAP-independent",0.006,10.5331,0.862,0.867,"antigen processing and presentation of peptide antigen via MHC class Ib"),
c("GO:0019883","antigen processing and presentation of endogenous antigen",0.069,8.8416,0.848,0.578,"antigen processing and presentation of peptide antigen via MHC class Ib"),
c("GO:0019885","antigen processing and presentation of endogenous peptide antigen via MHC class I",0.046,10.1141,0.842,0.677,"antigen processing and presentation of peptide antigen via MHC class Ib"),
c("GO:0007155","cell adhesion",8.511,10.3224,0.995,0.000,"cell adhesion"),
c("GO:0008150","biological_process",100.000,47.6737,1.000,0.000,"biological_process"),
c("GO:0008152","metabolic process",64.841,21.8153,0.998,0.000,"metabolism"),
c("GO:0009306","protein secretion",2.856,11.0429,0.898,0.000,"protein secretion"),
c("GO:0051234","establishment of localization",29.960,15.2840,0.935,0.536,"protein secretion"),
c("GO:0006810","transport",29.215,15.3307,0.925,0.353,"protein secretion"),
c("GO:0051223","regulation of protein transport",4.310,9.0424,0.855,0.590,"protein secretion"),
c("GO:0070201","regulation of establishment of protein localization",4.737,9.3206,0.860,0.878,"protein secretion"),
c("GO:0032880","regulation of protein localization",5.603,9.0625,0.869,0.646,"protein secretion"),
c("GO:0032879","regulation of localization",14.409,14.0164,0.883,0.412,"protein secretion"),
c("GO:1904951","positive regulation of establishment of protein localization",3.006,7.6180,0.819,0.874,"protein secretion"),
c("GO:0071702","organic substance transport",15.586,7.6003,0.931,0.547,"protein secretion"),
c("GO:0032940","secretion by cell",8.125,13.1397,0.893,0.771,"protein secretion"),
c("GO:0046903","secretion",8.892,13.4067,0.918,0.463,"protein secretion"),
c("GO:0050708","regulation of protein secretion",2.291,9.1844,0.842,0.840,"protein secretion"),
c("GO:0033036","macromolecule localization",16.624,8.7799,0.941,0.432,"protein secretion"),
c("GO:0002790","peptide secretion",1.414,10.6003,0.910,0.564,"protein secretion"),
c("GO:0002793","positive regulation of peptide secretion",0.519,8.2668,0.832,0.865,"protein secretion"),
c("GO:0051047","positive regulation of secretion",2.106,8.8239,0.812,0.789,"protein secretion"),
c("GO:0051046","regulation of secretion",4.033,9.2967,0.855,0.652,"protein secretion"),
c("GO:0051050","positive regulation of transport",5.349,9.9508,0.812,0.664,"protein secretion"),
c("GO:0051049","regulation of transport",10.519,13.1675,0.857,0.615,"protein secretion"),
c("GO:1903530","regulation of secretion by cell",3.693,8.2924,0.841,0.871,"protein secretion"),
c("GO:1903532","positive regulation of secretion by cell",1.922,8.3546,0.805,0.614,"protein secretion"),
c("GO:0051674","localization of cell",8.257,8.3546,0.947,0.216,"protein secretion"),
c("GO:0009987","cellular process",90.329,41.0565,0.999,0.000,"cellular process"),
c("GO:0022610","biological adhesion",8.540,10.2676,0.995,0.000,"biological adhesion"),
c("GO:0023052","signaling",36.613,38.5317,0.996,0.000,"signaling"),
c("GO:0032501","multicellular organismal process",41.143,21.7258,0.997,0.000,"multicellular organismal process"),
c("GO:0040011","locomotion",9.452,8.1688,0.995,0.000,"locomotion"),
c("GO:0043900","regulation of multi-organism process",1.379,32.2328,0.913,0.000,"regulation of multi-organism process"),
c("GO:0048525","negative regulation of viral process",0.392,23.8508,0.885,0.793,"regulation of multi-organism process"),
c("GO:0016032","viral process",4.091,24.6271,0.936,0.558,"regulation of multi-organism process"),
c("GO:0044764","multi-organism cellular process",4.120,8.2916,0.949,0.660,"regulation of multi-organism process"),
c("GO:0043903","regulation of symbiosis, encompassing mutualism through parasitism",1.021,23.7235,0.895,0.871,"regulation of multi-organism process"),
c("GO:0043901","negative regulation of multi-organism process",0.600,25.1530,0.891,0.444,"regulation of multi-organism process"),
c("GO:0044419","interspecies interaction between organisms",4.334,25.9788,0.951,0.659,"regulation of multi-organism process"),
c("GO:0019058","viral life cycle",2.366,18.3915,0.939,0.881,"regulation of multi-organism process"),
c("GO:0045071","negative regulation of viral genome replication",0.294,21.1002,0.886,0.895,"regulation of multi-organism process"),
c("GO:0019079","viral genome replication",0.589,20.3125,0.944,0.734,"regulation of multi-organism process"),
c("GO:0050896","response to stimulus",49.302,53.5214,0.997,0.000,"response to stimulus"),
c("GO:0051179","localization",36.018,16.6289,0.996,0.000,"localization"),
c("GO:0051704","multi-organism process",9.873,46.4881,0.995,0.000,"multi-organism process"),
c("GO:0051707","response to other organism",4.853,63.1688,0.839,0.000,"response to other organism"),
c("GO:0001934","positive regulation of protein phosphorylation",5.153,11.8477,0.763,0.844,"response to other organism"),
c("GO:0048522","positive regulation of cellular process",27.732,21.4535,0.833,0.479,"response to other organism"),
c("GO:0071222","cellular response to lipopolysaccharide",0.871,12.4895,0.822,0.893,"response to other organism"),
c("GO:0001932","regulation of protein phosphorylation",7.519,10.2487,0.801,0.796,"response to other organism"),
c("GO:0032270","positive regulation of cellular protein metabolic process",8.321,11.1141,0.772,0.851,"response to other organism"),
c("GO:0002460","adaptive immune response based on somatic recombination of immune receptors built from immunoglobulin superfamily domains",1.881,15.5436,0.762,0.531,"response to other organism"),
c("GO:0006796","phosphate-containing compound metabolic process",18.188,10.8386,0.910,0.550,"response to other organism"),
c("GO:0002456","T cell mediated immunity",0.456,16.6180,0.769,0.739,"response to other organism"),
c("GO:0001913","T cell mediated cytotoxicity",0.179,11.2118,0.759,0.884,"response to other organism"),
c("GO:0002449","lymphocyte mediated immunity",1.864,18.3757,0.801,0.663,"response to other organism"),
c("GO:0050900","leukocyte migration",2.649,10.5719,0.771,0.448,"response to other organism"),
c("GO:0051716","cellular response to stimulus",40.358,41.6271,0.891,0.292,"response to other organism"),
c("GO:0001959","regulation of cytokine-mediated signaling pathway",0.842,12.1180,0.771,0.743,"response to other organism"),
c("GO:0045824","negative regulation of innate immune response",0.225,10.5031,0.698,0.681,"response to other organism"),
c("GO:0002443","leukocyte mediated immunity",4.859,19.5171,0.784,0.714,"response to other organism"),
c("GO:0035456","response to interferon-beta",0.133,8.1931,0.892,0.579,"response to other organism"),
c("GO:0001961","positive regulation of cytokine-mediated signaling pathway",0.202,7.8665,0.765,0.855,"response to other organism"),
c("GO:0002440","production of molecular mediator of immune response",1.333,12.4685,0.838,0.406,"response to other organism"),
c("GO:0031325","positive regulation of cellular metabolic process",16.590,13.2403,0.780,0.526,"response to other organism"),
c("GO:0031347","regulation of defense response",3.964,36.6326,0.765,0.115,"response to other organism"),
c("GO:0031348","negative regulation of defense response",0.877,11.9666,0.776,0.596,"response to other organism"),
c("GO:0019220","regulation of phosphate metabolic process",9.417,9.8153,0.828,0.873,"response to other organism"),
c("GO:0034341","response to interferon-gamma",0.935,38.6840,0.700,0.719,"response to other organism"),
c("GO:0016310","phosphorylation",13.018,9.4012,0.915,0.728,"response to other organism"),
c("GO:0048584","positive regulation of response to stimulus",12.268,37.4609,0.758,0.462,"response to other organism"),
c("GO:0048583","regulation of response to stimulus",21.610,36.4547,0.858,0.294,"response to other organism"),
c("GO:0048585","negative regulation of response to stimulus",8.003,14.1518,0.794,0.519,"response to other organism"),
c("GO:0002526","acute inflammatory response",0.779,12.7721,0.861,0.545,"response to other organism"),
c("GO:0002520","immune system development",4.605,8.3862,0.783,0.488,"response to other organism"),
c("GO:0045321","leukocyte activation",7.011,13.6882,0.787,0.794,"response to other organism"),
c("GO:0034340","response to type I interferon",0.485,39.6478,0.718,0.665,"response to other organism"),
c("GO:0050830","defense response to Gram-positive bacterium",0.265,7.5100,0.832,0.642,"response to other organism"),
c("GO:0071216","cellular response to biotic stimulus",1.033,11.5670,0.873,0.743,"response to other organism"),
c("GO:0019221","cytokine-mediated signaling pathway",3.260,50.9245,0.791,0.464,"response to other organism"),
c("GO:0009628","response to abiotic stimulus",6.705,7.7670,0.921,0.169,"response to other organism"),
c("GO:0071356","cellular response to tumor necrosis factor",1.570,16.0462,0.850,0.803,"response to other organism"),
c("GO:0010604","positive regulation of macromolecule metabolic process",16.613,12.0123,0.782,0.793,"response to other organism"),
c("GO:0050777","negative regulation of immune response",0.721,15.6536,0.707,0.668,"response to other organism"),
c("GO:0050778","positive regulation of immune response",4.501,31.6440,0.623,0.380,"response to other organism"),
c("GO:0070887","cellular response to chemical stimulus",15.701,39.7520,0.861,0.442,"response to other organism"),
c("GO:0050776","regulation of immune response",5.799,37.9431,0.660,0.765,"response to other organism"),
c("GO:0043123","positive regulation of I-kappaB kinase/NF-kappaB signaling",1.044,10.5591,0.780,0.480,"response to other organism"),
c("GO:0009607","response to biotic stimulus",5.107,61.9706,0.924,0.120,"response to other organism"),
c("GO:0009605","response to external stimulus",12.043,51.5376,0.914,0.196,"response to other organism"),
c("GO:0009617","response to bacterium",3.156,25.7235,0.847,0.888,"response to other organism"),
c("GO:0009615","response to virus",1.771,53.3372,0.857,0.815,"response to other organism"),
c("GO:0010562","positive regulation of phosphorus metabolic process",6.099,12.1284,0.788,0.705,"response to other organism"),
c("GO:0050727","regulation of inflammatory response",1.685,13.2418,0.745,0.788,"response to other organism"),
c("GO:0002831","regulation of response to biotic stimulus",0.802,13.5391,0.813,0.719,"response to other organism"),
c("GO:0050729","positive regulation of inflammatory response",0.583,8.1818,0.731,0.664,"response to other organism"),
c("GO:0019882","antigen processing and presentation",1.339,9.6459,0.838,0.407,"response to other organism"),
c("GO:0031349","positive regulation of defense response",2.441,22.5952,0.723,0.827,"response to other organism"),
c("GO:0002821","positive regulation of adaptive immune response",0.462,10.9666,0.686,0.897,"response to other organism"),
c("GO:0002824","positive regulation of adaptive immune response based on somatic recombination of immune receptors built from immunoglobulin superfamily domains",0.439,11.2055,0.686,0.736,"response to other organism"),
c("GO:0002819","regulation of adaptive immune response",0.756,12.6655,0.711,0.781,"response to other organism"),
c("GO:0071310","cellular response to organic substance",12.977,40.0301,0.845,0.590,"response to other organism"),
c("GO:0042221","response to chemical",23.993,36.4989,0.904,0.307,"response to other organism"),
c("GO:0010033","response to organic substance",16.515,38.6635,0.872,0.594,"response to other organism"),
c("GO:0071345","cellular response to cytokine stimulus",4.172,51.5884,0.835,0.882,"response to other organism"),
c("GO:0050688","regulation of defense response to virus",0.514,15.8761,0.637,0.826,"response to other organism"),
c("GO:0071346","cellular response to interferon-gamma",0.808,36.8697,0.695,0.739,"response to other organism"),
c("GO:0002367","cytokine production involved in immune response",0.456,13.8097,0.736,0.774,"response to other organism"),
c("GO:0071347","cellular response to interleukin-1",0.519,12.1331,0.867,0.701,"response to other organism"),
c("GO:0098542","defense response to other organism",2.874,53.7570,0.793,0.875,"response to other organism"),
c("GO:0032496","response to lipopolysaccharide",1.760,12.4895,0.821,0.815,"response to other organism"),
c("GO:0050691","regulation of defense response to virus by host",0.179,10.6326,0.668,0.703,"response to other organism"),
c("GO:0031401","positive regulation of protein modification process",6.636,12.0128,0.776,0.708,"response to other organism"),
c("GO:0002718","regulation of cytokine production involved in immune response",0.364,13.4237,0.651,0.752,"response to other organism"),
c("GO:0002709","regulation of T cell mediated immunity",0.300,11.3904,0.700,0.880,"response to other organism"),
c("GO:0097529","myeloid leukocyte migration",0.969,8.9586,0.789,0.774,"response to other organism"),
c("GO:0097530","granulocyte migration",0.692,8.4711,0.793,0.895,"response to other organism"),
c("GO:0098586","cellular response to virus",0.225,11.1046,0.878,0.631,"response to other organism"),
c("GO:0030097","hemopoiesis",4.108,8.5017,0.784,0.479,"response to other organism"),
c("GO:0002684","positive regulation of immune system process",6.047,33.1669,0.688,0.805,"response to other organism"),
c("GO:0002683","negative regulation of immune system process",2.152,14.1397,0.746,0.656,"response to other organism"),
c("GO:0002682","regulation of immune system process",8.344,40.1302,0.755,0.653,"response to other organism"),
c("GO:0002708","positive regulation of lymphocyte mediated immunity",0.427,13.7471,0.723,0.867,"response to other organism"),
c("GO:0002705","positive regulation of leukocyte mediated immunity",0.508,16.5086,0.722,0.777,"response to other organism"),
c("GO:0002703","regulation of leukocyte mediated immunity",0.912,20.2534,0.747,0.584,"response to other organism"),
c("GO:0002704","negative regulation of leukocyte mediated immunity",0.260,8.0752,0.757,0.829,"response to other organism"),
c("GO:0002699","positive regulation of immune effector process",0.958,18.2676,0.712,0.829,"response to other organism"),
c("GO:0002700","regulation of production of molecular mediator of immune response",0.641,12.1124,0.753,0.816,"response to other organism"),
c("GO:0002697","regulation of immune effector process",1.922,30.9706,0.752,0.646,"response to other organism"),
c("GO:0002698","negative regulation of immune effector process",0.606,11.6108,0.744,0.791,"response to other organism"),
c("GO:0042325","regulation of phosphorylation",8.050,10.5017,0.831,0.838,"response to other organism"),
c("GO:0042327","positive regulation of phosphorylation",5.384,12.0953,0.786,0.892,"response to other organism"),
c("GO:0002237","response to molecule of bacterial origin",1.841,13.2741,0.821,0.833,"response to other organism"),
c("GO:0002230","positive regulation of defense response to virus by host",0.115,8.2924,0.680,0.801,"response to other organism"),
c("GO:0045088","regulation of innate immune response",2.279,26.6055,0.641,0.779,"response to other organism"),
c("GO:0045087","innate immune response",5.124,67.9914,0.703,0.711,"response to other organism"),
c("GO:0046649","lymphocyte activation",3.947,7.5686,0.802,0.752,"response to other organism"),
c("GO:0002253","activation of immune response",3.716,18.3665,0.628,0.839,"response to other organism"),
c("GO:0060759","regulation of response to cytokine stimulus",0.877,15.5045,0.797,0.713,"response to other organism"),
c("GO:0060760","positive regulation of response to cytokine stimulus",0.208,12.0334,0.783,0.857,"response to other organism"),
c("GO:0045089","positive regulation of innate immune response",1.910,19.2140,0.611,0.801,"response to other organism"),
c("GO:0002252","immune effector process",6.896,47.8861,0.805,0.627,"response to other organism"),
c("GO:0034097","response to cytokine",4.714,56.3862,0.879,0.118,"response to other organism"),
c("GO:0002250","adaptive immune response",2.845,17.0635,0.768,0.564,"response to other organism"),
c("GO:0033554","cellular response to stress",10.496,7.8097,0.853,0.521,"response to other organism"),
c("GO:0002274","myeloid leukocyte activation",3.531,8.7212,0.804,0.468,"response to other organism"),
c("GO:0043410","positive regulation of MAPK cascade",2.776,8.1500,0.665,0.831,"response to other organism"),
c("GO:0032101","regulation of response to external stimulus",3.976,21.3028,0.787,0.596,"response to other organism"),
c("GO:0043408","regulation of MAPK cascade",3.883,8.1986,0.689,0.531,"response to other organism"),
c("GO:0032103","positive regulation of response to external stimulus",1.518,9.7570,0.756,0.516,"response to other organism"),
c("GO:0048870","cell motility",8.257,8.3546,0.910,0.900,"response to other organism"),
c("GO:0002757","immune response-activating signal transduction",3.405,15.8447,0.618,0.888,"response to other organism"),
c("GO:0002764","immune response-regulating signaling pathway",3.589,16.1965,0.653,0.835,"response to other organism"),
c("GO:1902533","positive regulation of intracellular signal transduction",5.263,17.6596,0.735,0.804,"response to other organism"),
c("GO:0009893","positive regulation of metabolic process",17.715,15.0953,0.801,0.537,"response to other organism"),
c("GO:0051607","defense response to virus",1.327,49.9031,0.685,0.783,"response to other organism"),
c("GO:0031649","heat generation",0.098,9.4437,0.930,0.853,"response to other organism"),
c("GO:0060337","type I interferon signaling pathway",0.462,38.3270,0.679,0.692,"response to other organism"),
c("GO:0034612","response to tumor necrosis factor",1.673,16.5670,0.863,0.775,"response to other organism"),
c("GO:0000165","MAPK cascade",5.032,9.4461,0.768,0.896,"response to other organism"),
c("GO:0060326","cell chemotaxis",1.460,8.0665,0.794,0.764,"response to other organism"),
c("GO:0006959","humoral immune response",1.702,9.1798,0.781,0.524,"response to other organism"),
c("GO:0070098","chemokine-mediated signaling pathway",0.467,7.6162,0.831,0.693,"response to other organism"),
c("GO:0009967","positive regulation of signal transduction",8.309,22.3010,0.723,0.659,"response to other organism"),
c("GO:0006952","defense response",8.904,79.2291,0.871,0.431,"response to other organism"),
c("GO:0006950","response to stress",21.310,56.3979,0.906,0.159,"response to other organism"),
c("GO:0006955","immune response",11.858,67.4012,0.741,0.579,"response to other organism"),
c("GO:0006953","acute-phase response",0.271,11.5086,0.868,0.585,"response to other organism"),
c("GO:0006954","inflammatory response",3.785,25.6421,0.842,0.678,"response to other organism"),
c("GO:0070555","response to interleukin-1",0.664,12.5072,0.875,0.690,"response to other organism"),
c("GO:0080134","regulation of response to stress",7.657,30.0580,0.791,0.515,"response to other organism"),
c("GO:0042742","defense response to bacterium",1.546,9.2865,0.801,0.815,"response to other organism"),
c("GO:0002673","regulation of acute inflammatory response",0.421,8.6021,0.772,0.847,"response to other organism"),
c("GO:0006468","protein phosphorylation",10.854,9.9706,0.881,0.695,"response to other organism"),
c("GO:0002675","positive regulation of acute inflammatory response",0.156,7.9208,0.758,0.779,"response to other organism"),
c("GO:0051173","positive regulation of nitrogen compound metabolic process",10.404,11.6925,0.798,0.702,"response to other organism"),
c("GO:0051174","regulation of phosphorus metabolic process",9.492,9.8013,0.840,0.672,"response to other organism"),
c("GO:0023014","signal transduction by protein phosphorylation",5.239,9.3439,0.779,0.639,"response to other organism"),
c("GO:0001660","fever generation",0.058,11.1379,0.837,0.721,"response to other organism"),
c("GO:0030595","leukocyte chemotaxis",1.108,9.6716,0.696,0.589,"response to other organism"),
c("GO:0030593","neutrophil chemotaxis",0.508,9.8416,0.716,0.851,"response to other organism"),
c("GO:0016477","cell migration",7.496,8.8386,0.911,0.735,"response to other organism"),
c("GO:0065007","biological regulation",67.069,40.8861,0.998,0.000,"biological regulation"),
c("GO:0071840","cellular component organization or biogenesis",36.532,8.6234,0.996,0.000,"cellular component organization or biogenesis"),
c("GO:0051259","protein oligomerization",2.706,7.9666,0.991,0.003,"protein oligomerization"),
c("GO:0016043","cellular component organization",35.684,8.7328,0.991,0.275,"protein oligomerization"),
c("GO:0007154","cell communication",36.705,38.3536,0.992,0.004,"cell communication"),
c("GO:0001910","regulation of leukocyte mediated cytotoxicity",0.289,13.8761,0.922,0.033,"regulation of leukocyte mediated cytotoxicity"),
c("GO:0031341","regulation of cell killing",0.346,14.0937,0.924,0.875,"regulation of leukocyte mediated cytotoxicity"),
c("GO:0001817","regulation of cytokine production",3.387,31.5045,0.846,0.043,"regulation of cytokine production"),
c("GO:0051241","negative regulation of multicellular organismal process",5.741,14.8729,0.867,0.596,"regulation of cytokine production"),
c("GO:0051240","positive regulation of multicellular organismal process",8.327,16.6536,0.822,0.542,"regulation of cytokine production"),
c("GO:0051239","regulation of multicellular organismal process",15.268,21.6478,0.904,0.199,"regulation of cytokine production"),
c("GO:0042592","homeostatic process",9.371,9.2097,0.939,0.300,"regulation of cytokine production"),
c("GO:0001816","cytokine production",3.745,32.0119,0.956,0.204,"regulation of cytokine production"),
c("GO:0001819","positive regulation of cytokine production",2.256,23.8761,0.805,0.881,"regulation of cytokine production"),
c("GO:0001818","negative regulation of cytokine production",1.310,13.8477,0.845,0.819,"regulation of cytokine production"),
c("GO:0050701","interleukin-1 secretion",0.237,7.5331,0.853,0.842,"regulation of cytokine production"),
c("GO:0032479","regulation of type I interferon production",0.681,18.2636,0.859,0.755,"regulation of cytokine production"),
c("GO:0050707","regulation of cytokine secretion",0.894,12.3990,0.786,0.780,"regulation of cytokine production"),
c("GO:0050663","cytokine secretion",1.027,16.3372,0.833,0.794,"regulation of cytokine production"),
c("GO:0030154","cell differentiation",22.095,7.5935,0.964,0.508,"regulation of cytokine production"),
c("GO:0032607","interferon-alpha production",0.133,7.7773,0.909,0.852,"regulation of cytokine production"),
c("GO:0032606","type I interferon production",0.687,18.1549,0.907,0.756,"regulation of cytokine production"),
c("GO:0002753","cytoplasmic pattern recognition receptor signaling pathway",0.335,8.8508,0.657,0.740,"regulation of cytokine production"),
c("GO:0032637","interleukin-8 production",0.392,7.8894,0.911,0.708,"regulation of cytokine production"),
c("GO:0032647","regulation of interferon-alpha production",0.127,7.9547,0.878,0.849,"regulation of cytokine production"),
c("GO:0032677","regulation of interleukin-8 production",0.358,8.2644,0.874,0.701,"regulation of cytokine production"),
c("GO:0048731","system development",25.695,7.6198,0.941,0.323,"regulation of cytokine production"),
c("GO:0001659","temperature homeostasis",0.214,8.5258,0.931,0.142,"regulation of cytokine production"),
c("GO:0039528","cytoplasmic pattern recognition receptor signaling pathway in response to virus",0.144,10.2175,0.595,0.637,"regulation of cytokine production"),
c("GO:0051090","regulation of sequence-specific DNA binding transcription factor activity",2.164,10.6576,0.861,0.046,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:0080090","regulation of primary metabolic process",33.566,15.2765,0.830,0.538,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:0032268","regulation of cellular protein metabolic process",13.728,13.2725,0.814,0.635,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:0031323","regulation of cellular metabolic process",33.837,14.2984,0.823,0.609,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:0031326","regulation of cellular biosynthetic process",24.939,8.2790,0.818,0.700,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:0051252","regulation of RNA metabolic process",21.864,7.6459,0.814,0.708,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:0051246","regulation of protein metabolic process",14.651,15.1463,0.843,0.488,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:0051247","positive regulation of protein metabolic process",8.840,11.0550,0.781,0.743,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:2001141","regulation of RNA biosynthetic process",21.160,7.6289,0.809,0.688,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:0044249","cellular biosynthetic process",35.955,7.9830,0.919,0.553,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:0044271","cellular nitrogen compound biosynthetic process",28.696,8.1694,0.913,0.500,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:0044267","cellular protein metabolic process",28.505,15.2984,0.902,0.350,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:0050790","regulation of catalytic activity",13.993,13.9208,0.915,0.501,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:1901576","organic substance biosynthetic process",36.451,7.7328,0.924,0.618,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:1901564","organonitrogen compound metabolic process",13.324,23.5638,0.947,0.187,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:0043085","positive regulation of catalytic activity",9.279,9.1035,0.917,0.689,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:0051336","regulation of hydrolase activity",7.934,10.1726,0.920,0.645,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:0006139","nucleobase-containing compound metabolic process",33.601,7.8386,0.913,0.568,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:0019438","aromatic compound biosynthetic process",25.793,9.3063,0.920,0.505,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:0044093","positive regulation of molecular function",10.998,13.8013,0.918,0.696,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:0031399","regulation of protein modification process",9.683,11.9666,0.822,0.759,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:0010468","regulation of gene expression",25.084,9.0419,0.834,0.481,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:0018130","heterocycle biosynthetic process",25.770,9.3391,0.919,0.510,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:0052547","regulation of peptidase activity",2.325,8.7100,0.849,0.802,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:0052548","regulation of endopeptidase activity",2.170,8.1965,0.849,0.582,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:0030162","regulation of proteolysis",4.178,8.3010,0.854,0.207,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:2000116","regulation of cysteine-type endopeptidase activity",1.235,8.1302,0.860,0.893,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:0060255","regulation of macromolecule metabolic process",33.630,14.8665,0.825,0.606,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:0051091","positive regulation of sequence-specific DNA binding transcription factor activity",1.362,10.8041,0.830,0.357,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:0051092","positive regulation of NF-kappaB transcription factor activity",0.785,9.2062,0.841,0.820,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:0036211","protein modification process",22.683,13.1778,0.905,0.726,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:0009889","regulation of biosynthetic process",25.216,8.0255,0.831,0.482,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:1901362","organic cyclic compound biosynthetic process",26.549,9.2284,0.925,0.485,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:0006464","cellular protein modification process",22.683,13.1778,0.897,0.566,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:0043281","regulation of cysteine-type endopeptidase activity involved in apoptotic process",1.154,7.5817,0.832,0.886,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:0006508","proteolysis",10.294,13.7144,0.928,0.439,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:0034654","nucleobase-containing compound biosynthetic process",25.378,9.5670,0.909,0.400,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:0051171","regulation of nitrogen compound metabolic process",25.470,16.0000,0.838,0.324,"regulation of sequence-specific DNA binding transcription factor activity"),
c("GO:0008285","negative regulation of cell proliferation",3.716,7.9469,0.914,0.056,"negative regulation of cell proliferation"),
c("GO:0048523","negative regulation of cellular process",24.951,15.3507,0.886,0.411,"negative regulation of cell proliferation"),
c("GO:0019219","regulation of nucleobase-containing compound metabolic process",23.912,7.8697,0.815,0.525,"negative regulation of cell proliferation"),
c("GO:0009892","negative regulation of metabolic process",14.605,7.9706,0.840,0.581,"negative regulation of cell proliferation"),
c("GO:0051172","negative regulation of nitrogen compound metabolic process",8.632,8.1580,0.846,0.501,"negative regulation of cell proliferation"),
c("GO:0008219","cell death",11.881,15.0851,0.974,0.061,"cell death"),
c("GO:0032020","ISG15-protein conjugation",0.035,8.1302,0.958,0.062,"ISG15-protein conjugation"),
c("GO:0050789","regulation of biological process",63.456,41.6073,0.919,0.070,"regulation of biological process"),
c("GO:0048519","negative regulation of biological process",26.855,25.1765,0.919,0.149,"regulation of biological process"),
c("GO:0048518","positive regulation of biological process",30.969,32.6576,0.917,0.162,"regulation of biological process"),
c("GO:0050794","regulation of cellular process",60.427,34.4634,0.899,0.274,"regulation of biological process"),
c("GO:0065009","regulation of molecular function",17.288,17.2140,0.939,0.119,"regulation of biological process"),
c("GO:0065008","regulation of biological quality",20.202,11.0414,0.938,0.128,"regulation of biological process"),
c("GO:0071704","organic substance metabolic process",62.701,22.4330,0.939,0.071,"organic substance metabolism"),
c("GO:0006793","phosphorus metabolic process",18.702,10.7167,0.950,0.142,"organic substance metabolism"),
c("GO:0006807","nitrogen compound metabolic process",40.081,20.9393,0.949,0.221,"organic substance metabolism"),
c("GO:0044237","cellular metabolic process",59.486,17.0110,0.938,0.309,"organic substance metabolism"),
c("GO:0044238","primary metabolic process",60.306,22.2262,0.940,0.313,"organic substance metabolism"),
c("GO:0044260","cellular macromolecule metabolic process",48.748,16.3872,0.919,0.316,"organic substance metabolism"),
c("GO:0009058","biosynthetic process",36.924,7.5361,0.950,0.208,"organic substance metabolism"),
c("GO:0009056","catabolic process",11.471,7.7670,0.963,0.116,"organic substance metabolism"),
c("GO:0043170","macromolecule metabolic process",53.306,20.1481,0.939,0.278,"organic substance metabolism"),
c("GO:0019222","regulation of metabolic process",35.730,15.7959,0.891,0.204,"organic substance metabolism"),
c("GO:0006725","cellular aromatic compound metabolic process",34.801,8.3872,0.941,0.200,"organic substance metabolism"),
c("GO:0019538","protein metabolic process",31.991,21.2426,0.935,0.190,"organic substance metabolism"),
c("GO:0010467","gene expression",30.542,8.1433,0.937,0.253,"organic substance metabolism"),
c("GO:0043412","macromolecule modification",24.172,12.7496,0.941,0.230,"organic substance metabolism"),
c("GO:1901360","organic cyclic compound metabolic process",35.978,10.0716,0.947,0.205,"organic substance metabolism"),
c("GO:0001775","cell activation",7.900,13.7011,0.975,0.075,"cell activation"),
c("GO:0007249","I-kappaB kinase/NF-kappaB signaling",1.535,10.7077,0.867,0.100,"I-kappaB kinase/NF-kappaB signaling"),
c("GO:0023051","regulation of signaling",17.946,22.3143,0.894,0.454,"I-kappaB kinase/NF-kappaB signaling"),
c("GO:0023056","positive regulation of signaling",9.100,22.9281,0.831,0.337,"I-kappaB kinase/NF-kappaB signaling"),
c("GO:2001236","regulation of extrinsic apoptotic signaling pathway",0.906,7.9136,0.806,0.722,"I-kappaB kinase/NF-kappaB signaling"),
c("GO:0035556","intracellular signal transduction",15.101,23.6038,0.829,0.388,"I-kappaB kinase/NF-kappaB signaling"),
c("GO:0010646","regulation of cell communication",17.651,22.6421,0.890,0.449,"I-kappaB kinase/NF-kappaB signaling"),
c("GO:0010647","positive regulation of cell communication",9.054,22.9914,0.829,0.299,"I-kappaB kinase/NF-kappaB signaling"),
c("GO:0043067","regulation of programmed cell death",8.234,9.9586,0.893,0.886,"I-kappaB kinase/NF-kappaB signaling"),
c("GO:0012501","programmed cell death",11.246,14.0353,0.945,0.673,"I-kappaB kinase/NF-kappaB signaling"),
c("GO:0007166","cell surface receptor signaling pathway",15.868,43.9626,0.828,0.241,"I-kappaB kinase/NF-kappaB signaling"),
c("GO:0007165","signal transduction",33.618,39.6716,0.805,0.436,"I-kappaB kinase/NF-kappaB signaling"),
c("GO:0010941","regulation of cell death",8.800,10.4078,0.894,0.813,"I-kappaB kinase/NF-kappaB signaling"),
c("GO:0042981","regulation of apoptotic process",8.159,10.0937,0.892,0.800,"I-kappaB kinase/NF-kappaB signaling"),
c("GO:0097190","apoptotic signaling pathway",3.358,8.3915,0.840,0.518,"I-kappaB kinase/NF-kappaB signaling"),
c("GO:0097191","extrinsic apoptotic signaling pathway",1.246,9.5361,0.851,0.169,"I-kappaB kinase/NF-kappaB signaling"),
c("GO:1902531","regulation of intracellular signal transduction",10.006,18.1543,0.767,0.690,"I-kappaB kinase/NF-kappaB signaling"),
c("GO:0038061","NIK/NF-kappaB signaling",0.716,7.4962,0.878,0.352,"I-kappaB kinase/NF-kappaB signaling"),
c("GO:0009966","regulation of signal transduction",15.915,22.6716,0.757,0.674,"I-kappaB kinase/NF-kappaB signaling"),
c("GO:0006915","apoptotic process",10.537,12.4330,0.945,0.846,"I-kappaB kinase/NF-kappaB signaling"));

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
