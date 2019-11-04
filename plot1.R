###### plot1.R

#Read data
NEI <- readRDS("summarySCC_PM25.rds")

#aggregate by year
aggTotals <- aggregate(Emissions ~ year,NEI, sum)

#Plot as PNG
png("plot1.png", width=480, height=480)

#Plot graph
plot(aggTotals, xlab="Year", ylab="PM2.5 Emmisions (tons)", main="Total PM2.5 in the United States", type = "o")

#Close plot
dev.off()