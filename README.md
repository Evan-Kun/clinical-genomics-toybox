# Clinical‑Genomics Toybox

\*A reproducible playground covering every major clinical‑genomics data format and workflow, implemented in both **Snakemake** and \****Nextflow***

---

## ✨ Why this repo exists

This project demonstrates end‑to‑end competency in human‑genetics data processing—from raw reads to clinician‑ready reports—while showcasing modern, reproducible workflow engineering practices.  All pipelines run on public GIAB datasets, so anyone can clone the repo and verify results.

## 🗂️ Repository layout

```text
clinical-genomics-toybox/
├── workflows/
│   ├── snakemake/           # Snakefile + config + envs
│   └── nextflow/            # main.nf + params + Dockerfiles
├── projects/                # Stand‑alone mini‑studies
│   ├── acmg_report/         # VCF → ACMG evidence → PDF
│   ├── trio_denovo/         # GIAB Ashkenazi trio Mendelian QC
│   ├── cnv_exome/           # CNVkit exome dosage analysis
│   └── longread_sv/         # ONT HG002 long‑read SV calling
├── data/                    # pull‑scripts & symlinks (large files git‑ignored)
├── env/                     # Conda YAML & Docker recipes
├── docs/                    # methodology write‑ups, figures
├── .github/workflows/       # CI: matrix tests (Snake + NF)
├── .gitignore               # ignores results/** & big binaries
└── LICENSE
```

## 🚀 Quick start

```bash
# 1. Clone & create Conda env
conda env create -f env/genomics.yml && conda activate genomics

# 2. Run either engine (same DAG)
cd workflows/snakemake   && snakemake -j 8       # OR
cd workflows/nextflow    && nextflow run . -profile conda
```

All results land in `results/`, mirroring the directory structure above.

---

## 📑 Data‑format coverage checklist

| Format       | Suffix                | Appears in repo                         |
| ------------ | --------------------- | --------------------------------------- |
| FASTQ        | `.fastq.gz`           | `data/giab/NA12878/*.fastq.gz`          |
| SAM/BAM/CRAM | `.sam/.bam/.cram`     | `results/align/`                        |
| VCF / gVCF   | `.vcf.gz / .g.vcf.gz` | `results/gatk/`, `results/deepvariant/` |
| BED family   | `.bed(.gz)`           | GIAB confident regions, CNVkit segments |
| TSV / CSV    | `.tsv / .csv`         | hap.py metrics, ACMG evidence tables    |
| JSON / YAML  | `.json / .yaml`       | workflow configs, ACMG rule objects     |
| GTF / GFF3   | `.gtf / .gff3`        | Ensembl gene models for snpEff / VEP    |
| HTML / PDF   | `.html / .pdf`        | MultiQC, CNVkit, clinician reports      |

> **✅ Every standard clinical‑genomics file type is generated or consumed somewhere in this repo.**

---

## 🔄 Workflow matrix

| Theme           | Tools                                    | Formats (in → out)  |
| --------------- | ---------------------------------------- | ------------------- |
| QC              | FastQC → MultiQC                         | FASTQ → HTML        |
| Alignment       | bwa‑mem2 → samtools → Picard → GATK BQSR | FASTQ → BAM         |
| Small variants  | GATK HaplotypeCaller **&** DeepVariant   | BAM → VCF/gVCF      |
| Joint & trio    | GATK GenotypeGVCFs → bcftools mendel     | gVCF → VCF/TSV      |
| Benchmark       | hap.py                                   | VCF+BED → TSV       |
| Annotation      | snpEff / Ensembl VEP                     | VCF → VCF/TSV       |
| Clinical report | custom Python + WeasyPrint               | TSV/JSON → PDF      |
| Exome CNV       | CNVkit                                   | BAM → BED/HTML      |
| Long‑read SV    | minimap2 → sniffles2 → truvari           | FASTQ/BAM → VCF/TSV |

Both **Snakemake** and **Nextflow** render identical DAGs; GitHub Actions runs them nightly on a 5 GB toy dataset to ensure reproducibility.

---

## 🧪 Projects at a glance

| Folder                 | What it demonstrates                                   |
| ---------------------- | ------------------------------------------------------ |
| `projects/acmg_report` | Automated ACMG classification & clinician‑friendly PDF |
| `projects/trio_denovo` | Mendelian‑error & de‑novo discovery in GIAB trio       |
| `projects/cnv_exome`   | Exome‑depth CNV detection + ClinGen dosage annotation  |
| `projects/longread_sv` | ONT structural‑variant calling & benchmarking          |

Each mini‑study has its own `README.md`, **notebooks**, and sample outputs.

---

## 🛠️ CI & reproducibility

- **GitHub Actions** matrix (`ci.yml`) runs both engines on push/pr.  Artifacts include MultiQC, hap.py metrics and the ACMG PDF.
- Docker images are auto‑built and published to GitHub Packages.
- Hash checks ensure deterministic outputs across platforms.

---

## 📜 License & data attribution

Code: MIT. \
GIAB datasets redistributed under their original Creative Commons licenses—see `NOTICE`.

---

### 👋 Questions / contributions

PRs welcome!  File an issue or ping @your‑handle on GitHub.

