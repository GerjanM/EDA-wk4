## reading in files
setwd("D:/Users/Gerjan/R/EDA/EDA-datasets")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
setwd("D:/Users/Gerjan/R/EDA/EDA-wk4")

##Subsetting for Baltimore
NEIsub<-subset(NEI,fips=="24510")

##making the plot
png(filename = "wk4-q2.png",width = 480, height = 480)
TotEmYearBalt<-tapply(NEIsub$Emissions,NEIsub$year,sum)
plot(TotEmYearBalt,xaxt = 'n',ylab="Emission PM2.5",xlab="",pch=16, col="red")
index<-as.factor(NEI$year)
axis(side=1,at=c(1,2,3,4),labels=levels(index))
title(main="total PM2.5 emission a year in Baltimore")
dev.off()

