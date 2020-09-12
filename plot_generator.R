# Plot Generator

data("mtcars")
data(trees)
data("Titanic")
data("airquality")

summary(airquality)
# The summary method displays descriptive statistics for every variable in the dataset, depending upon the type of the variable.

# shows the frequency of heights of given trees.
hist(trees$Height)


# head and tail functions - shows either the top or bottom data with a second arg for how many
# rows of data will be displayed.

# plot two given variables to a graph
# plot(x, y) 

# Setup
options(scipen=999)  # turn off scientific notation like 1e+06
library(ggplot2)
data("midwest", package = "ggplot2")  # load the data
# midwest <- read.csv("http://goo.gl/G1K41K") # alt source 

# Init Ggplot
#g <- ggplot(midwest, aes(x=area, y=poptotal)) + geom_point() + geom_smooth(method="lm")  

# area and poptotal are columns in 'midwes
# plot the scatterplot to the graph

# mETHOD 1  of making it cleaner
# Make the graph look more cleaner by adjusting the x and y ranges
# g + xlim(c(0, 0.1)) + ylim(c(0, 1000000)) 

# method 2 - of making it cleaner
# Zooming in the graph
# g1 <- g + coord_cartesian(xlim=c(0,0.1), ylim=c(0, 1000000))  # zooms in

# Add Title and Labels
#g1 + labs(title="Area Vs Population", 
#          subtitle="From midwest dataset",
#          y="Population",
#          x="Area",
#          caption="Midwest Demographics"
#)

# or use the built in ggtittle , xlab and ylab values
# g1 + ggtitle("Area Vs Population", subtitle="From midwest dataset") + xlab("Area") + ylab("Population")


# Full Plot call
 library(ggplot2)
 ggplot(midwest, aes(x=area, y=poptotal)) + 
   geom_point() + 
  geom_smooth(method="lm") + 
  coord_cartesian(xlim=c(0,0.1), ylim=c(0, 1000000)) + 
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")

