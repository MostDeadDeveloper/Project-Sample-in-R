# library
library(ggplot2)

# create a dataset
specie <- c(rep("sorgho" , 3) , rep("poacee" , 3) , rep("banana" , 3) , rep("triticum" , 3))
condition <- rep(c("normal" , "stress" , "Nitrogen") , 4)
value <- abs(rnorm(12 , 0 , 15))
data <- data.frame(specie,condition,value)

# Grouped
ggplot(data, aes(fill=condition, y=value, x=specie)) + 
  geom_bar(position="stack", stat="identity")

# the position argument determines if what will be the display or in what position.
# try stack or dodge


# input dataset must provide 3 columns: 
# the numeric value (value), 
# and 2 categorical variables 
# for the group (specie) and the subgroup (condition) levels.
# in the aes() call, 
# x  is the group (specie), and the subgroup (condition) 
# is given to the fill argument.
# in the geom_bar() call, position="dodge" must be specified 
# to have the bars one beside each other.
