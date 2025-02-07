# Data loading script for Asset Returns Tutorial
# Author: Barry Quinn
# Last updated: 2024

# Create data directory if it doesn't exist
if (!dir.exists("data")) {
  dir.create("data")
}

# Function to load or download data
load_financial_data <- function() {
  # Define the data path
  data_path <- "data/fin7028_dat.RData"
  
  # Check if data exists locally
  if (!file.exists(data_path)) {
    cat("Downloading financial data...\n")
    # Add your data download logic here
    # For example:
    # download.file("YOUR_DATA_URL", data_path)
    
    # For now, create sample data if needed
    glen <- data.frame(
      date = seq.Date(from = as.Date("2020-01-01"), 
                     to = as.Date("2023-12-31"), 
                     by = "day"),
      price = rnorm(1461, 100, 10)
    )
    save(glen, file = data_path)
  }
  
  # Load the data
  cat("Loading financial data...\n")
  load(data_path, envir = .GlobalEnv)
  cat("Financial data loaded successfully!\n")
  
  # Return invisible NULL
  invisible(NULL)
}

# Execute the function
load_financial_data()