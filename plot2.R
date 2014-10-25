## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# create subset of Baltimore City, Maryland Data (fips == "24510")
BA <- NEI[(NEI$fips == "24510"),]

# create sum of emission over 4 individual year periods
total <- aggregate(Emissions ~ year, data = BA, sum)

# open png graphics device; create plot2.png
png(filename = "plot2.png")
with(total, barplot(Emissions, names.arg = year, xlab="Year",
                    ylab="Total Emissions"))
title(main = "Total Emissions in Baltimore City, Maryland")
dev.off() #close png device