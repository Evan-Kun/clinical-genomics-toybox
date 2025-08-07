# Trio De Novo Analysis

Mendelian-error & de-novo discovery in GIAB trio.

## Overview

This project performs trio analysis on GIAB Ashkenazi Jewish trio (NA12878, NA12891, NA12892) to identify Mendelian errors and de novo variants.

## Features

- **Mendelian Error Detection**: Identifies variants that violate Mendelian inheritance
- **De Novo Discovery**: Finds potential de novo variants
- **Quality Control**: Comprehensive QC metrics for trio analysis
- **Visualization**: Interactive plots of inheritance patterns

## Input/Output

| Input | Output |
|-------|--------|
| Trio VCF files | Mendelian error report |
| Pedigree file | De novo candidate list |
| Quality metrics | Inheritance plots |

## Usage

```bash
# Run trio analysis
python trio_analysis.py --father father.vcf.gz --mother mother.vcf.gz --child child.vcf.gz

# Generate Mendelian error report
python mendelian_qc.py --trio trio.vcf.gz --pedigree family.ped
```

## File Structure

```
trio_denovo/
├── scripts/
│   ├── trio_analysis.py
│   ├── mendelian_qc.py
│   └── de_novo_detector.py
├── data/
│   ├── giab_trio.vcf.gz
│   ├── family.ped
│   └── confident_regions.bed
├── notebooks/
│   ├── trio_analysis.ipynb
│   └── inheritance_plots.ipynb
└── results/
    ├── mendelian_errors.tsv
    ├── de_novo_candidates.tsv
    └── trio_qc_report.html
```

## Dependencies

- bcftools
- pandas
- matplotlib
- seaborn
- jupyter
