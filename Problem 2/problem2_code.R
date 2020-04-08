#Create dataframe
data <- data.frame(Week = 0:100, Births = 120, Susceptibles = 30000, Infected = 20)


#Fill in dataframe
equations <- function(a = 0.00003,c = 1.05,x) {
  #equations for Births
  data[x,2] <- data[x-1,2] * c
  #equation for Susceptible
  data[x,3] <- data[x-1,3]*(1 - a * data[x-1,4]) + data[x-1,2]
  #equation for Infected
  data[x,4] <- a * data[x-1,3] * data[x-1,4]
  data <- data
}

for(i in 2:101) {
  data <- equations(x=i)
}


#Save .csv
write.csv(data,"GPS5_Problem2_data.csv", row.names = FALSE)


#Graphing Births, Susceptibles, and Infectives
ggplot(data = data)+
  geom_point(mapping = aes(x = Week, y = Susceptibles), color = "purple")+
  geom_line(mapping = aes(x = Week, y = Susceptibles), color = "purple")+
  annotate(geom = "text", x = 21, y = 40000, label = "Susceptibles", size = 4) +
  geom_point(mapping = aes(x = Week, y = Infected), color = "red")+
  geom_line(mapping = aes(x = Week, y = Infected), color = "red")+
  annotate(geom = "text", x = 45, y = 8000, label = "Infectives", size = 4) +
  geom_point(mapping = aes(x = Week, y = Births), color = "green")+
  geom_line(mapping = aes(x = Week, y = Births), color = "green") +
  annotate(geom = "text", x = 105, y = 17000, label = "Births", size = 4) +
  labs(title = expression("a = 0.00003, B"[0]*" = 120, c = 1.05, S"[0]*" = 30000 i"[0]*" = 20"), y = "")+
  theme(plot.title = element_text(hjust = 0.5))


#First finite difference of infectives.
infect <- c(NA)
for (i in 2:101) {
  count <- data[i,4]-data[i-1,4]
  infect <- c(infect,count)
}
master_data <- cbind(data,infect)
colnames(master_data) <- c("Week","Births","Susceptibles","Infected","Change in I")

#Overdata
write.csv(data,"GPS5_Problem2_data.csv", row.names = FALSE)

#Find local maxs
data <- read_csv("~/SIR_model_measles/Problem 2/GPS5_Problem2_data.csv")
loc_max <- which(diff(sign(diff(data$Susceptibles)))==-2)
loc_max <- c(loc_max, 101)
maxs <- numeric(0)

for(i in loc_max) {
    maxs <- c(maxs,data[i,3])
}
maxs <- unlist(maxs, use.names = FALSE)

#return all local maximums
maxs
