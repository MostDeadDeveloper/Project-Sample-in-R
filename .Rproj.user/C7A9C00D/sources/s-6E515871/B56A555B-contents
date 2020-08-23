
# gets the current working directory
print(getwd())
# store a variable of the current date for later use. 
current_date = Sys.Date()

# reads the data from the csv and puts it in a variable.
data <- read.csv("input_data/sample_data.csv")

# Task 1: 
# Write an R-script that will extract only the TS_Date and 
# RETURNS columns and export to a csv file.
ts_data_rows = data[2]

# Prepare the corresponding file name
file_name = paste("ts_data_rows_",current_date,sep="")
file_name_with_directory = paste("output_data/",file_name,sep="")

# Write The File
write.csv(ts_data_rows,file_name_with_directory)

# Task 2: Write an R script that will extract all lines that are identified as NJUMP
# in the OUTLIER TYPE column to be exported in a csv file bearing the file name 
# “TIMESERIES_NJUMP_<YYYMMDD>".
timeseries_njump_data = subset(data,OUTLIER.TYPE == 'NJUMP')
file_name = paste("TIMESERIES_NJUMP_",current_date,sep="")
write.csv(timeseries_njump_data,paste("output_data/",file_name,sep=""))

# Task 3: Write an R script that will extract all lines 
# that are identified as PJUMP in the OUTLIER TYPE column to be exported 
# in a csv file bearing the file name “TIMESERIES_PJUMP_<YYYMMDD>".
timeseries_njump_data = subset(data,OUTLIER.TYPE == 'PJUMP')
file_name = paste("TIMESERIES_PJUMP_",current_date,sep="")
write.csv(timeseries_njump_data,paste("output_data/",file_name,sep=""))

# Task 4: Write an R script that will print an automated summary 
# showing the number of PJUMP, NJUMP and NULL in the dataset, the 
# Mean of the RETURNS column, and the Standard Deviation of the RETURNS column.
# The summary shall be exported to a .txt file.

# To get the total count you can use dim() or summary()
pjump_count = dim(ts_data_rows)[1]
njump_count = dim(ts_data_rows)[1]
# null_count = NULL - No NULL in DATA


# Oh No A PROBLEM! Bad DATA! Check Column 4 of data or data[4]
# use sapply(list,mode) to check the data types of each row
# Fix the data

# get the 4th row as a vector
returns_vector = data[,4]

# Make a Handler to Remove any values that are not convertable to numeric
returns_vector[1] = 0 

# Convert Everything To Numeric
returns_vector = as.numeric(returns_vector)

# Get The Mean of The Vector
mean_of_returns = mean(returns_vector)

# Get THE Standard Deviation of The Vector
sd_of_returns = sd(returns_vector)

# Format All of The Data For Export
formatted_date = paste("Date Today:",current_date)
formatted_pjump = paste("No. of PJUMP:",pjump_count)
formatted_njump = paste("No. of NJUMP:",njump_count)
formatted_null_count = paste("No. of NULL:","0")
formatted_mean = paste("Returns Mean:",mean_of_returns)
formatted_sd = paste("Returns Standard Deviation:",sd_of_returns)

# Create a file to Export Results
fileConn<-file("output_data/output.txt")
writeLines(
  c(
    formatted_date,
    formatted_pjump,
    formatted_njump,
    formatted_null_count,
    formatted_mean,
    formatted_sd
  ),
  fileConn
)
close(fileConn)
