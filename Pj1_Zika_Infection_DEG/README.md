Script content:

####
####
Ensemble GTF Homo_sapiens.GRCh38.99.gtf
ftp://ftp.ensembl.org/pub/release-99/gtf/homo_sapiens/

Esemble Fasta Momo_sapiens.GRCh38.dna_rm.primary_assembly.fa.gz
ftp://ftp.ensembl.org/pub/release-99/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna_rm.primary_assembly.fa.gz

BED
#not directly avaliable but converted from GFF3
$wget ftp://ftp.ensembl.org/pub/release-99/gff3/homo_sapiens
Require: gff3ToGenePred genePredToBed
    $wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/genePredToBed
    $wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/gff3ToGenePred
    $ ../gff3ToGenePred -geneNameAttr=gene_name Homo_sapiens.GRCh38.99.gff3.gz stdout | sort -k2,2 -k4n,4n ->temp
    $ ../genePredToBed temp Homo_sapiens.GRCh38.99.bed


dl_list.txt: 
    list of 6 id names from rsa database 
download_bash: 
    takes <file of list of fast files> to <output directory> 
    requires: sra-toolkit (sra-toolkit@2.8.2-1 *on system)   
qc_bash:
    run fastqc and multi-qc on <input file directory> attempt untrimmed sample first
    store qc file in <QC> and <multi_qc>
    requires:
        py-multiqc (py-multiqc@1.7)
        fastqc (fastqc@0.11.7)
        trimgalore (trimgalore@0.4.5)
Star_bash:
    generate hg38genome index from hg38.fa; refGene.gtf; sjdbOverhang 149(sample 150bp)
    requires:
        star (star@2.7.0e)
index_run_bash:
    align sample fast file from <input directory> to <star_align> directory store as BAM SortedByCoordinate 
    run samtool index on sorted bam
    requires:
       star (star@2.7.0e)
       samtools (samtools@1.9%gcc@6.3.0)
rseqc_bash:
    run read_distribution and geneBody_coverage on flies in <input directory> to <QC_Star_align> directory
    run multi-qc and store outcome in <multi_qc_Star_align>
    requires:
        py-rseqc (py-rseqc@2.6.4) 
        py-multiqc (py-multiqc@1.7)
readscount_bash:
    run reads count on indexed bam files from <input directory> to output <reads_count> directory
    requires: 
        subread (subread@1.6.2)
        genome bed format: hg38.trf.bed

dexseq_bash:
    requires: matching Ensemble GTF (to generate GFF with unique transcript_id)  
              dependency: py-htseq (py-htseq@0.9.1)
              requires: dexseq_prepare_annotation.py(DEXSeq package)
              $ python DEXSeq_python/dexseq_prepare_annotation.py Pj/Homo_sapiens.GRCh38.99.gtf Homo_sapiens.GRCh38.99.gff
    sort bam file by name
        requires: samtools (samtools@1.8)
    run reads count of exon in bam file from <input directory> to output <txt> directory
        dependency: py-pysam (py-pysam@0.13) for count.py to read BAM 
        requires: dexseq_count.py (DEXSeq package)
    

    
    
    
