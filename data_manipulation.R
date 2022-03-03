library(tidyverse)
data()

#?msleep
View(msleep)

#changing variable name
msleep%>%
  rename("conserve"="conservation") %>% 
  glimpse()
#reorder variables
msleep %>% 
  select(vore,name,conservation,everything())
#everything() is everything else
#changing variable t
msleep$vore<-as.factor(msleep$vore)
glimpse(msleep)

#mutate #changes variable type
msleep %>% 
  mutate(vore=as.character(vore))

names(msleep) #returns the names of all columns

msleep%>% 
  select(2:4,awake,starts_with("sleep"),contains("wt")) %>% 
  names()

#filter and arrange
unique(msleep$order) #each unique entry in that column

#filter
msleep %>% 
  filter((order=="Lagomorpha"|order=="Chiroptera") &
           sleep_total>8) %>% 
  select(name,order,sleep_total) %>% 
  arrange(sleep_total) %>% 
  View()

#mutate
msleep %>% 
  mutate(brainwt=brainwt*1000) %>% 
  view

#creating a column with mutate
msleep %>% 
  mutate(brainwt_in_grams=brainwt*1000) %>% 
  View

msleep$brainwt>0.01
#conditional changes (if_else)
size_of_brain<-msleep %>% 
  select(name,brainwt) %>% 
  drop_na(brainwt) %>% 
  mutate(brain_size=if_else(brainwt>0.01,"large","small") ) %>% 
  View

#large=1,small=0
size_of_brain %>% 
  mutate(brain_size=recode(brain_size,"large"=1,"small"=0))

#creating bar charts
#View(msleep)
msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes(vore))+
  geom_bar(fill="blue")+
  theme_bw()+
  labs(x="vore type",y="observations")