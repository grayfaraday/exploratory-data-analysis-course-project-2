######  plot3.R

#Read data
NEI <- readRDS("summarySCC_PM25.rds")

#Plot as PNG
png("plot3.png", width=480, height=480)

#subset data for Baltimore City
subData_plot2 <- subset(NEI, NEI$fips == "24510")
aggTotals <- aggregate(Emissions ~ year,subData_plot2, sum)

# make ggplot
q <- ggplot(data=subData_plot2, aes(x=year, y=Emissions)) + geom_bar(stat="identity") + facet_wrap(~type) + labs(title="Total PM2.5 Emissions in Baltimore City", x="Year", y = "PM2.5 Emmisions (tons)")
print(q)

#Close plot
dev.off()