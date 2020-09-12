library(ggplot2)
# ggplot(midwest, aes(x=area, y=poptotal)) + 
#  geom_point(col="steelblue", size=3) +   # Set static color and size for points
#  geom_smooth(method="lm", col="firebrick") +  # change the color of line
#  coord_cartesian(xlim=c(0, 0.1), ylim=c(0, 1000000)) + 
#  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")

ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(aes(col=state), size=3) +  # Set color to vary based on state categories.
  geom_smooth(method="lm", col="firebrick", size=2) + 
  coord_cartesian(xlim=c(0, 0.1), ylim=c(0, 1000000)) + 
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")
