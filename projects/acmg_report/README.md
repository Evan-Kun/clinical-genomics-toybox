# ACMG Clinical Report Generator

Automated ACMG classification & clinician-friendly PDF generation.

## Overview

This project demonstrates automated variant classification using ACMG guidelines and generates clinician-ready PDF reports.

## Features

- **ACMG Classification**: Automated variant classification using ACMG/AMP guidelines
- **Evidence Collection**: Systematic collection of evidence from multiple sources
- **PDF Generation**: Clinician-friendly reports using WeasyPrint
- **Evidence Tables**: Detailed breakdown of ACMG criteria

## Input/Output

| Input | Output |
|-------|--------|
| VCF files | PDF clinical reports |
| ACMG rules (JSON) | Evidence tables (TSV) |
| Gene annotations | Summary statistics |

## Usage

```bash
# Run ACMG classification
python classify_variants.py --vcf variants.vcf.gz --output report.pdf

# Generate evidence table
python generate_evidence_table.py --variants classified_variants.json
```

## File Structure

```
acmg_report/
├── scripts/
│   ├── classify_variants.py
│   ├── generate_report.py
│   └── evidence_collector.py
├── templates/
│   ├── report_template.html
│   └── evidence_template.html
├── data/
│   ├── acmg_rules.json
│   └── gene_annotations.tsv
└── results/
    ├── classified_variants.json
    ├── evidence_table.tsv
    └── clinical_report.pdf
```

## Dependencies

- Python 3.9+
- WeasyPrint
- pandas
- pysam
- jinja2
