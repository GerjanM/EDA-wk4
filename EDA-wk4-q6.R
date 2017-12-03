## reading in files
setwd("D:/Users/Gerjan/R/EDA/EDA-datasets")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
setwd("D:/Users/Gerjan/R/EDA/EDA-wk4")

library(ggplot2)
library(dplyr)

##Subsetting and joining
Vehicle<-SCC[grepl("[Vv]eh",SCC$Short.Name),]
NEIsub<-subset(NEI,fips=="24510"|fips=="06037")

Join<-arrange(left_join(Vehicle,NEIsub),by=SCC)
Join2<-Join[,16:20]

DefFrame<-Join2 %>%
  group_by(fips,year) %>%
  summarise(Total_Emission=sum(Emissions,na.rm=TRUE)) %>%
  print(DefFrame)
DefFrame<-DefFrame[1:8,]
DefFrame
DefFrame$fips<-as.factor(DefFrame$fips)
levels(DefFrame$fips) <- c("California","Baltimore")

##making the plot
png(filename = "wk4-q6.png",width = 480, height = 480)
ggplot(DefFrame,aes(factor(year),Total_Emission))+
  geom_point(color="purple",size=5)+
  facet_grid(.~fips)+labs(x = "Year", title="Total Emissions in California and Baltimore")+
  labs(x = "", title="Annual Emissions from source Vehicles in Baltimore")
dev.off()