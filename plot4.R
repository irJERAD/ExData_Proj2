## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# search for the coal in the index reference guid
which(apply(SCC, 2, function(x) any(grepl("Coal", x))))
# this returns columns 3, 4, 9, and 10 respectively:
# Short.Name, EI.Sector, SCC.Level.Three and SCC.Level.Four
# Closer analysis shoes EI.Sector being our area of interest

# create a vector of indexes from EI.Sector that have "Coal"
indx.sector <- grep("Coal", SCC$EI.Sector)

# however because there is some debate in the forums
# and I would rather do more work than lose points
# let's index Short.Name as well
indx.short <- grep("Coal", SCC$Short.Name)

# merge indices
indx <- unique(c(indx.sector, indx.short))

# find appropriate SCC values from our indices
both <- SCC$SCC[indx]
sector <- SCC$SCC[indx.sector]

# create a data frame with a subset of just our desired data points
bothNEI <- NEI[(both %in% NEI$SCC),]

#Because both don't show much significant difference
# I would like to show both graphs
newNEI <- NEI[(sector %in% NEI$SCC),]

# create sum of emission over 4 individual year periods
total <- aggregate(Emissions ~ year, data = bothNEI, sum)

subtotal <- aggregate(Emissions ~ year, data = newNEI, sum)

# open png graphics device; create plot4.png
png(filename = "plot4.png")
par(mfrow = c(1, 2), oma = c(0,0,2,0))
with(total, barplot(Emissions, names.arg = year, xlab="Year",
                    ylab="Total Emissions",
                    main = "Both Sector and Short Name"))
with(subtotal, barplot(Emissions, names.arg = year, xlab="Year", 
                       ylab="Total Emissions", main = "Coal Sector Only"))
mtext("Coal Emissions recorded from 1999 to 2008", outer = TRUE)
dev.off() #  close png device