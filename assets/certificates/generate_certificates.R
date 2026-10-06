# Generate certificates as PDF from HTML templates
# Usage: Rscript generate_certificates.R
# Or: source('generate_certificates.R'); generate_certificate('certificate-participation.html', 'output.pdf', 'John Doe')

library(pagedown)

# Function to generate a certificate PDF
generate_certificate <- function(html_file, pdf_file, participant_name = NULL) {
  
  tryCatch({
    # Get absolute paths
    html_file <- normalizePath(html_file)
    cert_dir <- dirname(html_file)
    pdf_file <- normalizePath(pdf_file, mustWork = FALSE)
    
    # Check if HTML file exists
    if (!file.exists(html_file)) {
      stop(sprintf("HTML file not found: %s", html_file))
    }
    
    # Read the HTML template
    html_content <- readLines(html_file)
    
    # If a participant name is provided, fill it in
    if (!is.null(participant_name)) {
      html_content <- gsub(
        'placeholder="\\[Participant Name\\]"',
        sprintf('value="%s" placeholder="[Participant Name]"', participant_name),
        html_content
      )
    }
    
    # Create temporary HTML file in same directory as original (for relative paths)
    temp_html <- file.path(cert_dir, paste0("temp_", basename(tempfile()), ".html"))
    writeLines(html_content, temp_html)
    
    # Convert to PDF using chrome_print
    message(sprintf("Generating: %s", pdf_file))
    pagedown::chrome_print(
      input = temp_html,
      output = pdf_file,
      options = list(
        landscape = FALSE,
        displayHeaderFooter = FALSE,
        scale = 1,
        margin = list(
          top = "0in",
          bottom = "0in",
          left = "0in",
          right = "0in"
        )
      )
    )
    
    # Check if file was created
    if (file.exists(pdf_file)) {
      file_size <- file.info(pdf_file)$size
      message(sprintf("✓ Created: %s (%s)", pdf_file, format(file_size, big.mark=",")))
    } else {
      stop("PDF file was not created")
    }
    
    # Clean up temp file
    unlink(temp_html)
    
  }, error = function(e) {
    message(sprintf("✗ Error generating certificate: %s", e$message))
    message("  Troubleshooting:")
    message("  - Ensure Google Chrome/Chromium is installed")
    message("  - Check that cccz.jpg exists in certificates directory")
    message("  - Verify HTML file path is correct")
  })
}

# Get directory path
cert_dir <- getwd()

message(sprintf("Working directory: %s\n", cert_dir))

# Verify certificate directory
if (!file.exists(file.path(cert_dir, "certificate-participation.html"))) {
  message("✗ Certificate files not found. Please run this script from the certificates directory.")
  q(status = 1)
}

# Generate sample certificates (participation and ECTS)
message("=== Generating Certificates ===\n")

generate_certificate(
  html_file = file.path(cert_dir, "certificate-participation.html"),
  pdf_file = file.path(cert_dir, "certificate-participation.pdf")
)

message()

generate_certificate(
  html_file = file.path(cert_dir, "certificate-ects.html"),
  pdf_file = file.path(cert_dir, "certificate-ects.pdf")
)

message("\n✓ All certificates generated successfully!")
message("\nTo generate certificates for specific participants, use:")
message("  source('generate_certificates.R')")
message("  generate_certificate('certificate-participation.html', 'output.pdf', 'John Doe')")
