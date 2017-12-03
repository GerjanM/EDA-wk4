## reading in files
setwd("D:/Users/Gerjan/R/EDA/EDA-datasets")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
setwd("D:/Users/Gerjan/R/EDA/EDA-wk4")

library(ggplot2)
library(dplyr)

##Subsetting and joining
Coal<-SCC[grepl("Coal",SCC$EI.Sector),] 
Coal$SCC
Join<-arrange(left_join(Coal,NEI),by=SCC)
Join2<-Join[,17:20]

DefFrame<-Join2 %>%
  group_by(year) %>%
  summarise(Total_Emission=sum(Emissions,na.rm=TRUE)) %>%
  filter(year==c(1999,2002,2005,2008))
  print(DefFrame)
  

##making the plot
png(filename = "wk4-q4.png",width = 480, height = 480)
ggplot(DefFrame,aes(factor(year),Total_Emission))+
  geom_point(color="green",size=5)+
  labs(x = "", title="Total Emissions from coal combustion-related sources")
dev.off()

