# CSV Converter

# Packages

require(WriteXLS)

# Import Data

all_files <- list.files("csv", pattern = ".csv") # read all csv names

all_csv <- lapply(all_files, function(x) read.csv(file = paste0("csv/", x), header = T)) # read all csv files

# Write Excel files

all_files <- gsub(".csv", ".xlsx", all_files)

if(!dir.exists(file.path("excel"))){
    dir.create("excel")
}

mapply(function(x, y) WriteXLS(x, paste0("excel/", y)), all_csv, all_files)
