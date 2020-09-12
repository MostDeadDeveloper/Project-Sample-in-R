# store a variable of the current date for later use. 
current_date = Sys.Date()
current_date_with_time = Sys.time()
# Setting Checker, use fake_data for testing and use actual data for prod
use_fake_data <-  FALSE

# Generate a Folder using the current date as a Name
directory = paste("output_data/data-",current_date_with_time,sep="")
dir.create(directory)
# Change the directory format so anyone can use it
directory = paste(directory,"/",sep="")

# reads the data from the csv and puts it in a variable.
if (use_fake_data){
  data <- read.csv("input_data/sample_data_fake.csv")
}else{
  data <- read.csv("input_data/sample_data.csv")
}



# Task 2: Write an R script that will extract all lines that are identified as NJUMP
# in the OUTLIER TYPE column to be exported in a csv file bearing the file name
# “TIMESERIES_NJUMP_<YYYMMDD>".
timeseries_njump_data = subset(data,OUTLIER.TYPE == 'NJUMP')
file_name = "TIMESERIES-NJUMP"
write.csv(timeseries_njump_data,paste(directory,file_name,".csv",sep=""))

# Task 3: Write an R script that will extract all lines 
# that are identified as PJUMP in the OUTLIER TYPE column to be exported 
# in a csv file bearing the file name “TIMESERIES_PJUMP_<YYYMMDD>".
timeseries_pjump_data = subset(data,OUTLIER.TYPE == 'PJUMP')
file_name = "TIMESERIES-PJUMP"
write.csv(timeseries_pjump_data,paste(directory,file_name,".csv",sep=""))

# Task 4: Write an R script that will print an automated summary 
# showing the number of PJUMP, NJUMP and NULL in the dataset, the 
# Mean of the RETURNS column, and the Standard Deviation of the RETURNS column.
# The summary shall be exported to a .txt file.

timeseries_null_data = subset(data,OUTLIER.TYPE == 'NULL')

# To get the total count you can use dim() or summary()
pjump_count = dim(timeseries_pjump_data)[1]
njump_count = dim(timeseries_njump_data)[1]
null_count = dim(timeseries_null_data)[1]


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
formatted_null_count = paste("No. of NULL:",null_count)
formatted_mean = paste("Returns Mean:",mean_of_returns)
formatted_sd = paste("Returns Standard Deviation:",sd_of_returns)

# Task 1: 
# Write an R-script that will extract only the TS_Date and 
# RETURNS columns and export to a csv file.
ts_data_rows = data[,2]

# Prepare the corresponding file name
file_name = "ts-data-rows"
file_name_with_directory = paste(directory,file_name,".csv",sep="")

z <- data.frame(
  TS_DATE=ts_data_rows,
  RETURNS=returns_vector
)
# Write The File
write.csv(z,file_name_with_directory,row.names=FALSE)

# Create a file to Export Results

output_file_name = paste("Generated Reports/output.txt-",current_date_with_time,sep="")
fileConn<-file(output_file_name)
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

# Append The Data to an existing CSV
new_data <- data.frame(
  DATE= c(current_date_with_time),
  PJUMP_COUNT = c(pjump_count),
  NJUMP_COUNT = c(njump_count),
  NULL_COUNT = c(null_count),
  Calculated_Mean = c(mean_of_returns),
  Calculated_SD = c(sd_of_returns)
)

write.table(
  new_data,
  "Generated Reports/output_logs.csv",
  append = TRUE,
  sep = ",",
  col.names = FALSE,
  row.names = FALSE,
  quote = FALSE
)
