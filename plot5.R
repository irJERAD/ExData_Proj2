## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# create subset of Baltimore City, Maryland Data (fips == "24510")
BA <- NEI[(NEI$fips == "24510"),]

# create sum of emission over 4 individual year periods and emission type
total <- aggregate(Emissions ~ year + type, data = BA, sum)

# subset data by vehicles which are defined as motorized objects of transport
# transport which we are assuming takes place on the road
sub <- total[which(total$type == "ON-ROAD"),]

# start png graphics device
png(filename = "plot5.png")
with(sub, barplot(Emissions, names.arg = year, xlab="Year",
                       ylab="Total Emissions",
                       main = "Emission made by motorized Vehicles"))
dev.off() # close graphics device