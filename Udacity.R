#Jas Sohi
#Oct 22, 2015
#Visualizations Based on Github Survey

#get current working directory
getwd()

#filename <- 'Team Github Repo (Responses) - Form Responses 1.csv'
#df <- read.csv(filename, stringsAsFactors = F)

#OR to get a live version of the Sheet
#http://blog.revolutionanalytics.com/2009/09/how-to-use-a-google-spreadsheet-as-data-in-r.html
#Google Sheet link: https://docs.google.com/spreadsheets/d/1qynZShxV4IYW7PwVu6XvVFtNqiSl1S5B4_e1wR4tUks/edit#gid=1295804853

#install.packages('RCurl')
library(RCurl)
GoogleSheetscsv <- getURL('https://docs.google.com/spreadsheets/d/1qynZShxV4IYW7PwVu6XvVFtNqiSl1S5B4_e1wR4tUks/pub?gid=1295804853&single=true&output=csv')
df <- read.csv(textConnection(GoogleSheetscsv))
View(df)
# rename column headers
colnames(df) <- c('Date','HaveGithub','WantRepo','TeamName')
# Convert to Date type
df$Date <- as.character(df$Date)
df$Date <- strptime(df$Date, '%m/%d/%Y %H:%M:%S') 
df$Date <- as.Date(df$Date)      

# Convert to character type
df$TeamName <- as.character(df$TeamName)
                
# What days of the week did everyone submit the survey?

# Extract day of the week from the Date
df$Day <- weekdays(df$Date)

# Convert to factor type
df$Day <- as.factor(df$Day)

# Visualize
#install.packages('ggvis')
library(ggvis)

df %>% ggvis(~Day, fill := "#fff8dc") %>%
  add_axis("x", title = "day of week") %>%
  add_axis("y", title = "count")

# How many people had a github account prior to survey?

df %>% ggvis(~HaveGithub, fill := "#fff8dc") %>%
  add_axis("x", title = "Do you have a Github account?") %>%
  add_axis("y", title = "count")

#Word Cloud of TeamNames

#install.packages('wordcloud')
#install.packages('tm')
#install.packages('NLP')
library(wordcloud)
library(tm)
library(NLP)

wordcloud(df$TeamName,random.order=FALSE, colors = brewer.pal(4,"Blues"))

 