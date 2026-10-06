# Certificate Generation Guide

Complete certificate system for the **"Introduction to Git and GitHub"** course.

## Quick Start

### Generate Certificate for a Specific Participant

```bash
cd assets/certificates
Rscript generate_certificates.R
```

Then use in R:
```r
source("generate_certificates.R")

# Generate participation certificate
generate_certificate(
  html_file = "certificate-participation.html",
  pdf_file = "john_doe_participation.pdf",
  participant_name = "John Doe"
)

# Generate ECTS certificate
generate_certificate(
  html_file = "certificate-ects.html",
  pdf_file = "john_doe_ects.pdf",
  participant_name = "John Doe"
)
```

## Batch Generation

To generate certificates for multiple participants, create a CSV file with participant names and run:

```r
source("generate_certificates.R")

participants <- read.csv("participants.csv")
for (i in seq_len(nrow(participants))) {
  name <- participants$name[i]
  generate_certificate(
    html_file = "certificate-participation.html",
    pdf_file = paste0(tolower(gsub(" ", "_", name)), "_certificate.pdf"),
    participant_name = name
  )
}
```

## System Requirements

### Required Software
- **R** (version 3.6+)
- **Google Chrome** or **Chromium** browser
- **Quarto** (optional, for rendering templates)

### Required R Packages
```r
install.packages(c("pagedown", "chromote"))
```

## File Structure

```
assets/certificates/
├── certificate-participation.html      # Participation certificate template
├── certificate-participation.qmd       # Quarto source
├── certificate-participation.pdf       # Generated sample
├── certificate-ects.html              # ECTS certificate template
├── certificate-ects.qmd               # Quarto source
├── certificate-ects.pdf               # Generated sample
├── generate_certificates.R            # Main generation script
├── cccz.jpg                           # Logo (local copy for PDF generation)
└── README_USAGE.md                    # This file
```

## Certificate Details

### Shared Elements
- **Institution:** Comprehensive Cancer Center Zurich (CCCZ), University Hospital Zurich (USZ)
- **Course:** Introduction to Git and GitHub
- **Course Date:** July 8, 2026
- **Instructor:** Dr. Deepak Kumar Tanwar
- **Issue Date:** Zurich, 15 July 2026
- **Supporter:** Prof. Michael Krauthammer

### Participation Certificate
- Standard attendance certificate
- Note: "Competence or skills were **not** assessed at the end of the course."

### ECTS Certificate
- Includes ECTS recommendation: **0.25 ECTS**
- Note: "Competence or skills were **assessed** at the end of the course via online exam."

## Customization

### Edit Certificate Content

Open the HTML file in a text editor and modify:
- Course name: `"Introduction to Git and GitHub"`
- Course date: `July 8, 2026`
- Instructor: `Dr. Deepak Kumar Tanwar`
- Issue date: `Zurich, 15 July 2026`
- ECTS value: `0.25 ECTS` (ECTS certificate only)

### Edit Styling

All CSS is embedded in the `<style>` section:
- Primary color: `#003366` (corporate blue)
- Font family: `Segoe UI` (with fallbacks)
- Page size: A4 landscape (297mm × 210mm)

## Troubleshooting

| Issue | Solution |
|-------|----------|
| **Script fails with "Chrome not found"** | Install Google Chrome or Chromium browser |
| **"cccz.jpg not found" error** | Ensure `cccz.jpg` is in the certificates directory |
| **PDF missing logo** | Check that logo path in HTML is `src="cccz.jpg"` |
| **Permission denied** | Run with `chmod +x generate_certificates.R` |
| **Fonts look wrong** | System needs "Segoe UI" font (will fall back to similar font) |
| **PDF renders incorrectly** | Clear temp files and try again: `rm temp_*.html` |

## Technical Notes

- **Format:** A4 landscape (297mm × 210mm)
- **Font:** Segoe UI with fallbacks to Tahoma, Geneva, Verdana
- **Color Scheme:** Professional corporate blue (#003366) with neutral grays
- **Print-Ready:** Includes media print CSS for optimal PDF output
- **Rendering:** Uses pagedown + Chrome/Chromium for precise PDF generation
- **Editable Fields:** Participant name is filled dynamically before PDF generation

## Notes

- **NOT part of the website** — These are offline assets for certificate generation only
- Certificates are generated on-demand for participants
- All PDFs are generated locally; no external services are used
- Logo is included locally (cccz.jpg) to ensure PDFs work without internet

---

## Version

v2.0 - October 2026 (Fixed logo path and improved script reliability)
