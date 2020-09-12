library(ggplot2)

ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(aes(col=state), size=3) +  # Set color to vary based on state categories.
  geom_smooth(method="lm", col="firebrick", size=2) +
  scale_y_continuous(breaks=seq(0,100000,15000)) +
  coord_cartesian(xlim=c(0, 0.1), ylim=c(0, 100000)) + 
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")
