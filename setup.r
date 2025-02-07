# Setup script for Asset Returns Tutorial
# Author: Barry Quinn
# Last updated: 2024

# Print welcome message
cat("Setting up your environment for the Asset Returns Tutorial...\n")

# Function to install and load packages
setup_packages <- function(packages) {
  # Check for missing packages
  new_packages <- packages[!(packages %in% installed.packages()[,"Package"])]
  
  # Install missing packages
  if(length(new_packages)) {
    cat("Installing missing packages:", paste(new_packages, collapse = ", "), "\n")
    install.packages(new_packages)
  }
  
  # Load all packages
  cat("\nLoading packages...\n")
  for(package in packages) {
    library(package, character.only = TRUE)
    cat("Loaded:", package, "\n")
  }
}

# List of required packages
required_packages <- c(
  "tidyverse",    # for data manipulation and visualization
  "moments",      # for skewness and kurtosis calculations
  "tseries",      # for financial time series analysis
  "knitr",        # for document rendering
  "rmarkdown",    # for markdown processing
  "ggplot2",      # for plotting
  "dplyr",        # for data manipulation
  "lubridate",    # for date handling
  "scales"        # for better axis formatting
)

# Try to install and load packages with error handling
tryCatch({
  setup_packages(required_packages)
  cat("\nPackage setup completed successfully!\n")
}, error = function(e) {
  cat("\nError during package setup:\n", conditionMessage(e), "\n")
  cat("Please contact your instructor if the error persists.\n")
})

# Load the financial data
tryCatch({
  cat("\nLoading financial data...\n")
  load("data/fin7028_dat.RData")
  cat("Financial data loaded successfully!\n")
}, error = function(e) {
  cat("\nError loading financial data:\n", conditionMessage(e), "\n")
  cat("Please ensure the data file 'fin7028_dat.RData' is in the 'data' folder.\n")
})

# Set some common options
options(
  digits = 4,            # Display 4 significant digits
  scipen = 999,          # Avoid scientific notation
  dplyr.summarise.inform = FALSE  # Reduce dplyr summarise noise
)

# Create a helper function for financial calculations
calculate_returns <- function(prices) {
  # Calculate simple returns
  simple_returns <- (prices - lag(prices)) / lag(prices)
  
  # Calculate log returns
  log_returns <- log(prices) - log(lag(prices))
  
  return(list(
    simple_returns = simple_returns,
    log_returns = log_returns
  ))
}

# Print completion message
cat("\nSetup complete! Your environment is ready for the Asset Returns Tutorial.\n")
cat("Remember to check the tutorial documentation for usage instructions.\n")

# Print session information for troubleshooting
cat("\nSession information:\n")
sessionInfo()