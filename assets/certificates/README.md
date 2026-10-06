# Certificate Generation

Two portrait-format A4 certificates (PDF) for the "Introduction to Git and GitHub" course:
- **Attendance Certificate** - for non-assessed participation
- **ECTS Certificate** - for assessed completion (0.25 ECTS)

## Quick Start

### Generate a single certificate

```bash
cd intro_git_github/assets/certificates
Rscript generate_certificates.R "Dr. Alice Smith" attendance
Rscript generate_certificates.R "Dr. Bob Jones" ects output/bob.pdf
```

### Generate from R

```r
source("generate_certificates.R")

# Attendance certificate
gen_cert("Dr. Alice Smith", "attendance")

# ECTS certificate  
gen_cert("Dr. Bob Jones", "ects", "output/bob.pdf")

# Batch generate from CSV
participants <- read.csv("participants.csv")  # Columns: name, type
for (i in seq_len(nrow(participants))) {
  gen_cert(participants$name[i], participants$type[i])
}
```

## Files

- `certificate-participation-portrait.html` - Attendance certificate template
- `certificate-ects-portrait.html` - ECTS certificate template
- `generate_certificates.R` - PDF generation script
- `cccz.jpg` - CCCZ logo
- `eth-uzh-logo-pos-en.png` - ETH/UZH logo

## Requirements

- R with `pagedown` package
- Google Chrome or Chromium browser
- Logos and templates in the same directory

## Certificate Contents

**Both certificates include:**
- Course title and date (July 8, 2026)
- Participant name (filled per certificate)
- Course duration: 8 hours
- Learning outcomes/topics
- Two signature blocks:
  - Dr. Deepak Kumar Tanwar (Course Instructor)
  - Cancer Biology PhD Program / LSZGS
- Organized with support of Prof. Michael Krauthammer, CCCZ

**ECTS certificate adds:**
- Title: "Certificate of Completion"
- "Learning Outcomes" section
- ECTS Recommendation: 0.25 ECTS
- Note on credit recognition discretion
- Confirmation that exam was passed
