## reading in files
setwd("D:/Users/Gerjan/R/EDA/EDA-datasets")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

setwd("D:/Users/Gerjan/R/EDA/EDA-wk4")

## making the plot
TotEmYear<-tapply(NEI$Emissions,NEI$year,sum)
png(filename = "wk4-q1.png",width = 480, height = 480)
plot(TotEmYear,xaxt = 'n',ylab="Emission PM2.5",xlab="",pch=16, col="blue")
index<-as.factor(NEI$year)
axis(side=1,at=c(1,2,3,4),labels=levels(index))
title(main="total PM2.5 emission a year")
dev.off()