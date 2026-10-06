#!/usr/bin/env Rscript
# Certificate Generation Script
# Generates PDF certificates from HTML templates
#
# Usage:
#   # Generate single certificate
#   Rscript generate_certificates.R "Dr. Alice Smith" "attendance" "output/alice.pdf"
#   
#   # Or from R:
#   source("generate_certificates.R")
#   gen_cert("Dr. Alice Smith", "attendance", "alice.pdf")
#   gen_cert("Dr. Bob Jones", "ects", "bob.pdf")

library(pagedown)

gen_cert <- function(name, type = "attendance", output_file = NULL) {
  # Validate type
  if (!type %in% c("attendance", "ects")) {
    stop('type must be "attendance" or "ects"')
  }
  
  # Select template
  template <- if (type == "attendance") {
    "certificate-participation-portrait.html"
  } else {
    "certificate-ects-portrait.html"
  }
  
  # Check template exists
  if (!file.exists(template)) {
    stop(sprintf("Template not found: %s", template))
  }
  
  # Set output filename if not provided
  if (is.null(output_file)) {
    output_file <- sprintf("%s_%s.pdf", gsub(" ", "_", name), type)
  }
  
  # Create output directory if needed
  output_dir <- dirname(output_file)
  if (output_dir != "." && !dir.exists(output_dir)) {
    dir.create(output_dir, recursive = TRUE)
  }
  
  # Read template
  html_content <- readLines(template)
  
  # Replace participant name in input field
  html_content <- gsub(
    'placeholder="\\[Participant Name\\]"',
    sprintf('value="%s" placeholder="[Participant Name]"', name),
    html_content
  )
  
  # Write temp HTML file
  temp_file <- tempfile(fileext = ".html", tmpdir = ".")
  writeLines(html_content, temp_file)
  
  # Generate PDF
  tryCatch({
    pagedown::chrome_print(
      input = temp_file,
      output = normalizePath(output_file, mustWork = FALSE),
      options = list(
        landscape = FALSE,
        displayHeaderFooter = FALSE,
        scale = 1,
        margin = list(top = "0in", bottom = "0in", left = "0in", right = "0in")
      )
    )
    
    # Clean up temp file
    unlink(temp_file)
    
    # Confirm
    if (file.exists(output_file)) {
      size_mb <- file.size(output_file) / (1024^2)
      cat(sprintf("✓ %s (%.2f MB)\n", basename(output_file), size_mb))
    }
    
  }, error = function(e) {
    unlink(temp_file)
    cat(sprintf("✗ Error: %s\n", e$message))
    cat("Troubleshooting:\n")
    cat("  - Ensure Google Chrome/Chromium is installed\n")
    cat("  - Check that cccz.jpg and eth-uzh-logo-pos-en.png exist\n")
    cat("  - Verify HTML template file exists\n")
  })
}

# Command-line usage
if (!interactive()) {
  args <- commandArgs(trailingOnly = TRUE)
  
  if (length(args) < 2) {
    cat("Usage: Rscript generate_certificates.R <name> <type> [output_file]\n")
    cat("  type: 'attendance' or 'ects'\n")
    cat("  output_file: (optional) path/filename.pdf\n\n")
    cat("Examples:\n")
    cat("  Rscript generate_certificates.R 'Dr. Alice Smith' attendance\n")
    cat("  Rscript generate_certificates.R 'Dr. Bob Jones' ects output/bob.pdf\n")
    q(status = 1)
  }
  
  name <- args[1]
  type <- args[2]
  output <- if (length(args) >= 3) args[3] else NULL
  
  gen_cert(name, type, output)
}
