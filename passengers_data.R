library(tidyverse)
library(dplyr)

pass19<-read.csv("Pass_2019.csv")
pass20<-read.csv("Pass_2020.csv")
pass21<-read.csv("Pass_2021.csv")
#class(pass19$Date)
pass19$Date<-as.Date(pass19$Date,format="%d-%m-%Y")
pass19$Date<-format(pass19$Date,"%m-%d-%Y")
#View(pass19)
pass20$Date<-as.Date(pass20$Date,format="%d-%m-%Y")
pass20$Date<-format(pass20$Date,"%m-%d-%Y")
pass21$Date<-as.Date(pass21$Date,format="%d-%m-%Y")
pass21$Date<-format(pass21$Date,"%m-%d-%Y")

#comparing the Passenger data for 2019,20,21
ggplot()+
  geom_line(pass19,mapping=aes(Date,Pass_2019,group=1,col="pass19"))+
  geom_line(pass20,mapping=aes(Date,Pass_2020,group=1,col="pass20"))+
  geom_line(pass21,mapping=aes(Date,Pass_2021,group=1,col="pass21"))+
  labs(title = "Air Travel Data Comparison-2019 vs 2020 vs 2021")+
  theme_bw()





