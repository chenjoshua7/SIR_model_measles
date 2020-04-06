#Joshua Chen 

#Creating the Dataframe
#create a 301 by 3 table with initial values.
data <- data.frame(Week = 0:300, Infected = 20, Susceptibles = 30000)

equations <- function(a = 0.00003,B = 120,x) {
  #equation for Susceptible
  data[x,3] <- data[x-1,3] - a * data[x-1,3] * data[x-1,2] + B
  #equation for Infected
  data[x,2] <- a * data[x-1,2] * data[x-1,3]
  data <- data
}

#apply the equations for all values in the table
for(i in 2:301) {
  data <- equations(x=i)
}

#Export to CSV
write.csv(data,"GPS5_measles_model.csv", row.names = FALSE)