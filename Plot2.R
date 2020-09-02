setwd("C:/Users/afrigo/Desktop/Hopkins Data Science/Class 3")

# Load the NEI & SCC data frames.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#change back to correct folder
setwd("C:/Users/afrigo/Desktop/Hopkins Data Science/Class 3/project_2")

# Subset NEI data by Baltimore's fip.
baltimoreNEI <- NEI[NEI$fips == "24510", ]

# Aggregate using sum the Baltimore emissions data by year
aggTotalsBaltimore <- aggregate(Emissions ~ year, baltimoreNEI, sum)

png("plot2.png", width = 480, height = 480, units = "px", bg = "transparent")

barplot(aggTotalsBaltimore$Emissions, names.arg=aggTotalsBaltimore$year, xlab="Year", ylab="PM2.5 Emissions (Tons)", main="Total PM2.5 Emissions From all Baltimore City Sources")


