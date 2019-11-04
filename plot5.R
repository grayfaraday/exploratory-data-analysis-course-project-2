######  plot5.R

#Read data
NEI <- readRDS("summarySCC_PM25.rds")

#Plot as PNG
png("plot5.png", width=480, height=480)

#subset data for Baltimore City (fips = 24510) and cars (type == ON-ROAD)
subData <- subset(NEI, NEI$fips == "24510" & NEI$type == "ON-ROAD")

#aggregate by year
aggTotals <- aggregate(Emissions ~ year,subData, sum)

#Plot graph
plot(aggTotals, xlab="Year", ylab="PM2.5 Emmisions (tons)", main="Total PM2.5 Emissions from vehicles in Baltimore City", type = "o")

#Close plot
dev.off()
