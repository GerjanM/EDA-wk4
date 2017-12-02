## reading in files
setwd("D:/Users/Gerjan/R/EDA/EDA-datasets")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

plot(tapply(NEI$Emissions,as.factor(NEI$year),sum),xaxt = 'n',ylab="Emission PM2.5",xlab="Year",pch=2)
index<-as.factor(NEI$year)
axis(side=1,at=c(1,2,3,4),labels=levels(index))
title(main="total PM2.5 emission a year")
