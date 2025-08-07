#!/usr/bin/env nextflow

/*
 * Clinical Genomics Toybox - Nextflow Pipeline
 * This is a template main.nf that will be expanded with actual processes
 */

// Parameters
params.reads = "$baseDir/data/*_{1,2}.fastq.gz"
params.reference = "$baseDir/data/reference/hg38.fa"
params.outdir = "results"
params.threads = 8

// Input validation
log.info """\
         CLINICAL GENOMICS TOYBOX
         ========================
         reads        : ${params.reads}
         reference    : ${params.reference}
         outdir       : ${params.outdir}
         threads      : ${params.threads}
         """
         .stripIndent()

// Input channels
Channel
    .fromFilePairs(params.reads, checkIfExists: true)
    .ifEmpty { error "Cannot find any reads matching: ${params.reads}" }
    .set { read_pairs_ch }

// Reference channel
ref_ch = Channel.fromPath(params.reference, checkIfExists: true)

// QC Process
process FASTQC {
    tag "$sample_id"
    
    publishDir "${params.outdir}/qc/fastqc", mode: 'copy'
    
    input:
    tuple val(sample_id), path(reads) from read_pairs_ch
    
    output:
    path "*.html", emit: html
    path "*.zip", emit: zip
    
    script:
    """
    fastqc \\
        --quiet \\
        --threads ${params.threads} \\
        ${reads}
    """
}

// Alignment Process
process BWA_MEM {
    tag "$sample_id"
    
    publishDir "${params.outdir}/align", mode: 'copy'
    
    input:
    tuple val(sample_id), path(reads) from read_pairs_ch
    path reference from ref_ch
    
    output:
    tuple val(sample_id), path("*.bam"), emit: bam
    tuple val(sample_id), path("*.bai"), emit: bai
    
    script:
    """
    bwa-mem2 mem \\
        -t ${params.threads} \\
        -R '@RG\\tID:${sample_id}\\tSM:${sample_id}' \\
        ${reference} \\
        ${reads} | \\
    samtools view -bS - | \\
    samtools sort -o ${sample_id}.bam -
    
    samtools index ${sample_id}.bam
    """
}

// MultiQC Process
process MULTIQC {
    publishDir "${params.outdir}/multiqc", mode: 'copy'
    
    input:
    path fastqc_html from FASTQC.out.html.collect()
    path fastqc_zip from FASTQC.out.zip.collect()
    
    output:
    path "multiqc_report.html", emit: report
    
    script:
    """
    multiqc \\
        --outdir . \\
        --filename multiqc_report.html \\
        .
    """
}

// Workflow
workflow {
    // Run QC
    FASTQC(read_pairs_ch)
    
    // Run alignment
    BWA_MEM(read_pairs_ch, ref_ch)
    
    // Generate MultiQC report
    MULTIQC(FASTQC.out.html, FASTQC.out.zip)
}
