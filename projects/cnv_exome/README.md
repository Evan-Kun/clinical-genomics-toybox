# Exome CNV Analysis

Exome-depth CNV detection + ClinGen dosage annotation.

## Overview

This project performs copy number variant (CNV) detection from exome sequencing data using CNVkit and integrates ClinGen dosage sensitivity annotations.

## Features

- **CNV Detection**: Exome-based CNV calling using CNVkit
- **Dosage Annotation**: Integration with ClinGen dosage sensitivity database
- **Visualization**: Interactive CNV plots and coverage profiles
- **Clinical Interpretation**: Pathogenic CNV prioritization

## Input/Output

| Input | Output |
|-------|--------|
| Exome BAM files | CNV segments (BED) |
| Target regions | Coverage plots (HTML) |
| ClinGen annotations | Dosage sensitivity report |

## Usage

```bash
# Run CNV detection
cnvkit.py batch *.bam -n normal.bam -f hg38.fa -t target.bed

# Annotate with ClinGen
python annotate_cnv.py --cnv segments.cnn --clingen clingen.tsv
```

## File Structure

```
cnv_exome/
├── scripts/
│   ├── cnv_detection.py
│   ├── annotate_cnv.py
│   └── dosage_analysis.py
├── data/
│   ├── exome_bams/
│   ├── target_regions.bed
│   └── clingen_dosage.tsv
├── notebooks/
│   ├── cnv_analysis.ipynb
│   └── dosage_plots.ipynb
└── results/
    ├── cnv_segments.cnn
    ├── coverage_plots.html
    └── dosage_report.tsv
```

## Dependencies

- CNVkit
- pandas
- matplotlib
- plotly
- pysam
