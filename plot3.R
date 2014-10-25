library(ggplot2)
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# create subset of Baltimore City, Maryland Data (fips == "24510")
BA <- NEI[(NEI$fips == "24510"),]

# create sum of emission over 4 individual year periods and emission type
total <- aggregate(Emissions ~ year + type, data = BA, sum)

# open png graphics device
png(filename = "plot3.png")
qplot(year, Emissions, data = B, geom="freqpoly", stat="identity",
      colour = type)
# for side by side bar plots use following code
#qplot(year, Emissions, data = B, facets = . ~ type, 
#       geom="bar", stat="identity")
title(main = "Total Emission in Baltimore City, MA by type")
dev.off() #close png device
