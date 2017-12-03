## reading in files
setwd("D:/Users/Gerjan/R/EDA/EDA-datasets")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
setwd("D:/Users/Gerjan/R/EDA/EDA-wk4")

library(ggplot2)
library(dplyr)

##Subsetting for Baltimore
NEIsub<-subset(NEI,fips=="24510")

TotalFrame<-NEIsub %>%
  group_by(type,year) %>%
  summarise(Total_Emission=sum(Emissions,na.rm=TRUE)) %>%
print(TotalFrame)

##making the plot
png(filename = "wk4-q3.png",width = 480, height = 480)
ggplot(TotalFrame,aes(factor(year),Total_Emission))+
  geom_point()+
  facet_grid(.~type)+labs(x = "Year", title="Total Emissions in Baltimore per type per year")
dev.off()