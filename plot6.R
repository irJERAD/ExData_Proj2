## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# create subset of Baltimore City, Maryland Data (fips == "24510")
BA <- NEI[(NEI$fips == "24510"),]
# create subset of LA
LA <- NEI[(NEI$fips == "06037"),]

# create BA sum of emission over 4 individual year periods and emission type
BAtotal <- aggregate(Emissions ~ year + type, data = BA, sum)

# create LA sum of emission over 4 individual year periods and emission type
LAtotal <- aggregate(Emissions ~ year + type, data = BA, sum)