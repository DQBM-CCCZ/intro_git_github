# Course Certificates

This folder contains certificate templates for the "Introduction to Git & GitHub" course.

## Files

- **certificate_participation.qmd** - Participation certificate (for all attendees)
- **certificate_ects.qmd** - ECTS certificate (for exam passers only, 0.25 ECTS)

## Usage

### Generate to PDF

Replace `[PARTICIPANT NAME]` in the template with the actual name and render to PDF:

```bash
# For participation certificate
quarto render certificate_participation.qmd --to pdf

# For ECTS certificate
quarto render certificate_ects.qmd --to pdf
```

### Customize

Edit the `.qmd` file before rendering:
- Replace `[PARTICIPANT NAME]` with participant's full name
- Adjust date if needed
- Customize as required

## Notes

- Certificates are issued by **CCCZ, UZH, and USZ**
- Instructor: Deepak Tanwar (Swiss Institute of Bioinformatics)
- Participation certificate is for all course attendees
- ECTS certificate is only for participants who pass the final exam
