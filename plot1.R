## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Calculate the average emissions per year
yrAvg <- aggregate(Emissions ~ year, data = NEI, mean)

# open PNG graphics device; create plot1.png
png(filename = "plot1.png", width = 480, height = 480)
 # Create a barplot showing the average emissions each year
barplot(yrAvg$Emissions, names.arg = yrAvg$year, xlab = "Year", ylab = "Avg Emissions")
# give title
title(main = "Average Emissions per Year")
dev.off() #close png file device

## Conclusion
# As shown in the bar plot the average emissions output has decreased
# from 1999 to 2008