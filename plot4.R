######  plot4.R

#Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Plot as PNG
png("plot4.png", width=480, height=480)

#find sources from emmissions from coal sources 
coal_sources <- SCC[grep("Coal" ,SCC$EI.Sector), ]
coal_emmisions <- NEI[NEI$SCC %in% coal_sources$SCC, ]

#aggregate by year
aggTotals_coal <- aggregate(Emissions ~ year,coal_emmisions, sum)

#plot graph
plot(aggTotals_coal, xlab="Year", ylab="PM2.5 Emmisions (tons)", main="Total PM2.5 in the United States from Coal Sources", type = "o")

#Close plot
dev.off()
