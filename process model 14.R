################################################################################
# This script uses the PROCESS macro for R from Andrew Hayes to create a 
# moderated mediation model (model 14).
# Furthermore, it produces the output which can visualized using the
# corresponding MD2C Excel template (www.md2c.nl).
# Make sure you download the PROCESS source code and data.
# Please store them in the sample folder as this script. 
# Make sure you use the path to this folder as working directory
################################################################################

# Install the required packages if needed
list.of.packages <- c("readr", "Rcpp")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[, "Package"])]
if (length(new.packages)) install.packages(new.packages)

# Load libraries
library(readr)
library(Rcpp)

# Set working directory, choose the name of your folder
PATH_TO_YOUR_WORKING_DIRECTORY <- "YOUR_PATH"
setwd(PATH_TO_YOUR_WORKING_DIRECTORY)

# Load the PROCESS macro for R, this might take a while
# MAKE SURE YOU HAVE DOWNLOADED THE CODE AND STORED IN THE SAME DIRECTORY AS THIS SCRIPT)
source("process.R")

# read the data file TEAMS
# MAKE SURE YOU HAVE DOWNLOADED THE DATA AND STORED IN THE SAME DIRECTORY AS THIS SCRIPT)
filename <- "teams.csv"
teams <- read.csv(file=filename,head=TRUE,sep=",",na.strings=c("NA","#DIV/0!","#N/A",""))

## MODERATED MEDIATION ANALYSIS: Hiding your feelings from your work team
# This case uses a mediation model in which dysfunctional behavior (X=DYSFUNC) 
# leads to a work environment filled with negative emotions (M=NEGTONE) that 
# supervisors and other employees confront and attempt to manage, which then 
# distract from work and interfere with task performance (Y=PERFORM). 
# However, according to their model, when team members are able to regulate their 
# display of negative emotions (W=NEGEXP), essentially hiding how they are 
# feeling from others, this allows the team to stay focused on the task at hand 
# rather than having to shift focus toward managing the negative tone of the 
# work environment and the feelings of others.
process(data=teams,y="perform",x="dysfunc",m="negtone",w="negexp",
         model=14,plot=1,seed=42517, jn=1)

### THE END ###

