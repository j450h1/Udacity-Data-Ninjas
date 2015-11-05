#Jas Sohi
#November 4, 2015
#Calculation probabilities without Z-scores table

#get current working directory
getwd()

# Heights dataset is in HTML format - we need a csv file
# http://socr.ucla.edu/docs/resources/SOCR_Data/SOCR_Data_Dinov_020108_HeightsWeights.html
# Comment shortcut - Select code, then CTRL + SHIFT + C
 
# http://www.convertcsv.com/html-table-to-csv.html
# No need to code up a custom solution
# View source of site and copy the html
# http://www.convertcsv.com/html-table-to-csv.htm

#code from: http://stats.seandolinar.com/wp-content/uploads/2014/12/z-score.txt

#DATA LOAD
data <- read.csv('Height_data.csv')
height <- data$Height

hist(height) #histogram

#population parameter calculations
pop_sd <- sd(height)*sqrt((length(height)-1)/(length(height)))
pop_mean <- mean(height)

#What is the probability your height is 72 inches or greater? No
#What is the probability your height is 72 inches or greater if you are 
# in Hong Kong and under 18 years?

#z-score calculation
#http://s0.wp.com/latex.php?latex=z+%3D+%5Cfrac%7Bx+-+%5Cmu%7D%7B%5Csigma%7D+&bg=ffffff&fg=000&s=2

x <- 68

z <- (x - pop_mean)/pop_sd

p_yellow1 <- pnorm(x, pop_mean, pop_sd)    #using x, mu, and sigma
p_yellow2 <- pnorm(z)                       #using z-score of 2.107

p_blue1 <- 1 - p_yellow1
p_blue2 <- 1 - p_yellow2

p_blue1
p_blue2

# http://stats.seandolinar.com/wp-content/uploads/2014/12/Probabiliy-of-Finding-Someone-Taller-than-6-Comparison.png


#Also can find the height associated with a certain quantile

#median
qnorm(0.50,mean=pop_mean,sd=pop_sd)
#should agree with this function
pop_median = median(height)
pop_median #rounding differences
#80th quantile
qnorm(0.80,mean=pop_mean,sd=pop_sd)

