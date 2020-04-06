#Combine all graphs and datasets

infect_ratio <- c(NA, infect_ratio)
master_data <- cbind(data, infect_ratio)
colnames(master_data) <- c("Weeks", "Suscept", "Infect", "Inf_Ratio")

library(openxlsx)
write.csv(data,"GPS5_master_data.csv", row.names = FALSE)