####### plot2.R

#Read data
NEI <- readRDS("summarySCC_PM25.rds")

#subset data for Baltimore City
subData_plot2 <- subset(NEI, NEI$fips == "24510")
aggTotals <- aggregate(Emissions ~ year,subData_plot2, sum)

#Plot as PNG
png("plot2.png", width=480, height=480)

#Plot graph
plot(aggTotals, xlab="Year", ylab="PM2.5 Emmisions (tons)", main="Total PM2.5 Emissions in Baltimore City", type = "o")

#Close plot
dev.off()