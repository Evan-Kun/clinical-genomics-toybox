# Long-Read Structural Variant Analysis

ONT structural-variant calling & benchmarking.

## Overview

This project performs structural variant (SV) detection from Oxford Nanopore Technologies (ONT) long-read sequencing data using minimap2 and sniffles2.

## Features

- **SV Detection**: Long-read SV calling using sniffles2
- **Benchmarking**: Comparison with GIAB truth sets using truvari
- **Visualization**: SV plots and coverage profiles
- **Quality Assessment**: SV quality metrics and filtering

## Input/Output

| Input | Output |
|-------|--------|
| ONT FASTQ files | SV calls (VCF) |
| Reference genome | Benchmark metrics (TSV) |
| Truth sets | SV visualization plots |

## Usage

```bash
# Run SV detection
sniffles2 -i aligned.bam -v sv_calls.vcf

# Benchmark against truth set
truvari -b truth.vcf -c calls.vcf -o benchmark_results
```

## File Structure

```
longread_sv/
├── scripts/
│   ├── sv_detection.py
│   ├── benchmark_sv.py
│   └── sv_analysis.py
├── data/
│   ├── ont_fastq/
│   ├── reference/
│   └── truth_sets/
├── notebooks/
│   ├── sv_analysis.ipynb
│   └── benchmark_plots.ipynb
└── results/
    ├── sv_calls.vcf
    ├── benchmark_summary.tsv
    └── sv_plots.html
```

## Dependencies

- minimap2
- sniffles2
- truvari
- pandas
- matplotlib
- pysam
