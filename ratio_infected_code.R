#Ratios for I(k+1)/Ik

#Creating the empty matrix and setting week numbers
ratios <- matrix(data = NA, nrow=300, ncol = 2)
ratios[1:300, 1] <- 1:300

#Using the master data to create infected ratios
infect_ratio <- numeric(0)
for (i in 2:301) {
  count <- data[i,2]/data[i-1,2]
  infect_ratio <- c(infect_ratio,count)
}

#adding it the the matrix
ratios[ ,2] <- infect_ratio

#converting the matrix to a dataframe and adding column names
ratios <- data.frame(ratios)
colnames(ratios) <- c("Weeks", "Infected Ratio")

#Graph for ratios
ggplot(data = ratios) +
  geom_point(mapping = aes(x = Weeks, y = Infected_Ratio), color = "red") +
  geom_hline(yintercept = 1, size = 1) +
  ggtitle("Ratio of Infected Over 300 Weeks") + 
  theme(plot.title = element_text(hjust = 0.5))
