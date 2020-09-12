df <- data.frame(dose=c("D0.5", "D1", "D2"),
                 len=c(4.2, 10, 29.5))
data(trees)
head(df)

library(ggplot2)
# Basic barplot

# By default, geom_bar uses stat="bin" . 
# This makes the height of each bar equal to the 
# number of cases in each group, and it is 
# incompatible with mapping values to the y aesthetic. 
# If you want the heights of the bars to represent 
# values in the data, use stat="identity" 
# and map a value to the y aesthetic.

ggplot(data=trees, aes(x=Girth, y=Volume)) +
  geom_bar(stat="identity", fill="steelblue")

