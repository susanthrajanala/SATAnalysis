# Set working directory to investigate relationship between SAT scores and acceptance rate
setwd("/Users/Susanth_Rajanala/Desktop/R/SAT_project")
# Read the SAT score files and read the admission numbers file
satscore <- read.csv("/Users/Susanth_Rajanala/Desktop/R/SAT_project/SATScore.csv",
                     stringsAsFactors = FALSE)
accrate <-read.csv("/Users/Susanth_Rajanala/Desktop/R/SAT_project/accrate.csv", 
                   stringsAsFactors = FALSE)
# Examine the data frame 
head(satscore)
head(accrate)
# Summary of data frame
summary(satscore)
summary(accrate)
# Change the data type of desired column
satscore$university <- as.integer(satscore$university)
satscore$sat_math_25 <- as.numeric(satscore$sat_math_25)
satscore$sat_math_75 <- as.numeric(satscore$sat_math_75)
satscore$sat_cr_25 <- as.numeric(satscore$sat_cr_25)
satscore$sat_cr_75 <- as.numeric(satscore$sat_cr_75)
accrate$university <- as.numeric(accrate$university)
accrate$admissions_total <- as.integer(accrate$admissions_total)
accrate$applicants_total <- as.integer(accrate$applicants_total)
# Merge SAT scores and admissions data into one main data frame
satmaindata <- cbind(satscore, accrate)
head(satmaindata)
# Remove duplicate columns
satmaindata <- satmaindata[,-c(8:10)]
head(satmaindata)
# Add total SAT score column and acceptance rate column
satmaindata$totalsatscore <- satmaindata$sat_math_75+satmaindata$sat_cr_75
satmaindata$arate <- satmaindata$admissions_total/satmaindata$applicants_total
head(satmaindata)
# Subset the main data frame according to years
data2014 <- subset(satmaindata,satmaindata$year==2014)
data2015 <- subset(satmaindata,satmaindata$year==2015)
data2016 <- subset(satmaindata,satmaindata$year==2016)
# Visualize SAT scores vs acceptance rate
par(mfrow = c(1,3))
plot(data2014$totalsatscore, data2014$arate, xlab="SAT Score",
     ylab="Acceptance Rate", main="2014")
plot(data2015$totalsatscore, data2015$arate, xlab="SAT Score",
     ylab="Acceptance Rate", main="2015")
plot(data2016$totalsatscore, data2016$arate, xlab="SAT Score",
     ylab="Acceptance Rate", main="2016")
# Find correlation between SAT score and acceptance rate
cor2014 <- cor(data2014$totalsatscore, data2014$arate)
cor2015 <- cor(data2015$totalsatscore, data2015$arate)
cor2016 <- cor(data2016$totalsatscore, data2016$arate)
# Fitting linear trend line
par(mfrow = c(1,3))
plot(data2014$totalsatscore, data2014$arate, xlab = "SAT Score >= 1300",
     ylab="Acceptance Rate", main="2014")
text(1550,0.85,round(cor2014,digits=2))
abline(lm(data2014$arate~data2014$totalsatscore),col="red")
plot(data2015$totalsatscore, data2015$arate, xlab = "SAT Score >= 1300",
     ylab="Acceptance Rate", main="2015")
text(1550,0.85,round(cor2015,digits=2))
abline(lm(data2015$arate~data2015$totalsatscore),col="red")
plot(data2016$totalsatscore, data2016$arate, xlab = "SAT Score >= 1300",
     ylab="Acceptance Rate", main="2016")
text(1550,0.85,round(cor2016,digits=2))
abline(lm(data2016$arate~data2016$totalsatscore),col="red")





