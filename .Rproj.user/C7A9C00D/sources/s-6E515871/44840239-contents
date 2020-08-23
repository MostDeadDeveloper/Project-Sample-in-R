# Fake Data Generator
n <- 10000
directory <- paste("input_data/","sample_data_fake.csv",sep="")

# Generate Fake Dates
fake_dates = sample(seq(as.Date('2019/01/01'), as.Date('2020/01/01'), by="day"),n, replace=TRUE)

# Generate Repetitive Names
fake_names = rep("CDSP. TRADIG.USD.SNRFOR.MR14.060M",n)

min_value = 0.028301
max_value = 2.160006
# Generate Fake Values From Min and Max of VALUES Column
fake_values = runif(n,min=min_value,max=max_value)

min_value_r =-0.10204
max_value_r = 71.34989
# Generate Fake Values From Min and Max of RETURNS COlumn
fake_returns = rnorm(n,mean=min_value_r,sd=max_value_r)


# Generate Random Types
fake_types = sample(c("PJUMP","NJUMP","NULL"),n,replace=TRUE)

# Export The Data

# Convert to A Data Frame
new_fake_data <- data.frame(
  MKF= fake_names,
  TS_DATE = fake_dates,
  VALUE = fake_values,
  RETURNS = fake_returns,
  OUTLIER.TYPE = fake_types
)
# Write the CSV
write.csv(new_fake_data,directory,row.names=FALSE)
