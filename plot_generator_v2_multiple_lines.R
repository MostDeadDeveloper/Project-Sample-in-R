library(ggplot2)
theme_set(theme_minimal())

ggplot(economics, aes(x=date)) +
  geom_line(aes(y = psavert), color = "darkred")+ 
  geom_line(aes(y = uempmed), color="steelblue", linetype="twodash") 
