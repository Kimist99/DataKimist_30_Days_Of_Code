#Section 2 Tidy Data: Web Scrapping
install.packages("tidyverse")
library(tidyverse)

#import library for web scrapping in R
library(rvest)

#get Ebola data from website and get class info
url <- "https://www.cdc.gov/vhf/ebola/history/2014-2016-outbreak/cumulative-cases-graphs.html"
e <- read_html(url)
class(e)

#read in html nodes <> as a table and view data in second position
tab_e <- e %>% html_nodes("table")
tab_e <- tab_e[[2]]

#get data type
tab_e <- tab_e %>% html_table
class(tab_e)

#create table with number of cases and cases per month
tab_e <- tab_e %>% setNames(c("date", "Ebola_Cases_per_Month"))
head(tab_e)

#create a plot of Ebola Cases/Month
g <- ggplot(data = tab_e) +
  geom_bar(mapping = aes(x = Ebola_Cases_per_Month))

#add titles to data
g + ggtitle("Ebola Cases/Month, 2014-2016") +
  xlab("Date") + ylab("Cases/Month")
