# Hannah Joseph
# Group Project

library(tidyverse)

# How to read_csv:

# 1. Set your working directory. For me, I put the two excel sheets in a folder
# called "Global Change Science- R coding". This is the code:

setwd("C:/Users/Hannah/Desktop/Global Change Science- R coding")
getwd()

# 2. Make sure to save excel sheets as CSV files.

# 3. Create objects (ipeds and ebird):

ipeds <- read_csv("IPEDS_combined_MEPANCFL_v4.csv")
ebird <- read_csv("EBbird_IPEDS_UNITID_MEPANCFL_Jan23-May23_v3.csv")

View(ipeds)
View(ebird)


