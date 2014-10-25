## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Calculate the total emissions per year
yrTotal <- aggregate(Emissions ~ year, data = NEI, sum)

# open PNG graphics device; create plot1.png
png(filename = "plot1.png", width = 480, height = 480)
 # Create a barplot showing the total emissions each year
barplot(yrTotal$Emissions, names.arg = yrTotal$year, xlab = "Year",
        ylab = "Total Emissions")
# give title
title(main = "Total Emissions per Year")
dev.off() #close png file device

## Conclusion
# As shown in the bar plot the total emissions output has decreased
# from 1999 to 2008