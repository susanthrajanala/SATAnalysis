# Set working directory to investigate relationship between SAT scores and acceptance rate
setwd("/Users/Susanth_Rajanala/Desktop/R/SAT_project")
# Read the SAT score files and read the admission numbers file
satscare <- read.csv("/Users/Susanth_Rajanala/Desktop/R/SAT_project/SATScore.csv",
                     stringsAsFactors = FALSE)
accrate <-read.csv("/Users/Susanth_Rajanala/Desktop/R/SAT_project/accrate.csv", 
                   stringsAsFactors = FALSE)
# Examine the data frame 