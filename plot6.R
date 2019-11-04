######  plot6.R

#Read data
NEI <- readRDS("summarySCC_PM25.rds")

#Plot as PNG
png("plot6.png", width=480, height=480)

#subset data for cars (type == ON-ROAD)
subData_OnRoad <- subset(NEI, NEI$type == "ON-ROAD")

#aggregate by year and fips
aggTotals <- aggregate(Emissions ~ year + fips,subData_OnRoad, sum)

#subset LA county (fips = 06037) and Baltimore City (fips = 24510)
aggTotals_subData <- subset(aggTotals, aggTotals$fips == "06037" | aggTotals$fips == "24510")

#Plot graph
q <- ggplot(data=aggTotals_subData, aes(x=year, y=Emissions)) + geom_bar(stat="identity") + facet_wrap(~fips) + labs(title="Total PM2.5 Emissions from Vehicles", x="Year", y = "PM2.5 Emmisions (tons)")
print(q)

#Close plot
dev.off()