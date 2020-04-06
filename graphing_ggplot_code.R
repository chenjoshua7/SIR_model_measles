#Graphing the Dataframe
library(ggplot2)

#Graph of Susceptible Population
ggplot(data = data) +
  geom_point(mapping = aes(x = Weeks, y = Susceptibles),color= "blue")+
  ggtitle("Susceptible Popultion Over 300 Weeks") +
  theme(plot.title = element_text(hjust = 0.5))

#Graph of Infected Population
ggplot(data = data) +
  geom_point(mapping = aes(x = Weeks, y = Infected),color= "green")+
  ggtitle("Infected Popultion Over 300 Weeks") +
  theme(plot.title = element_text(hjust = 0.5))