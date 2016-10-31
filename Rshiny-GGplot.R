# *****************************************
# Shiny R workshop: Exercise 1
# *****************************************


# Plotting with ggplot2


# Working with R objects: For this exercise we will be
# using the diamonds dataset. To load it

library(dplyr) # you might want this for data frame filtering etc
library(ggplot2)
data(diamonds)

# if you make a mistake and want to refresh simply type
# data(diamonds) again try it:

diamonds <- 1  # oops!!!
data(diamonds)
head(diamonds) # phew


# The diamonds dataset is big, it is probably best if you
# work with a subsample so run this code:

diamonds <- diamonds[sample(1:nrow(diamonds), 5000), ]


# If you close R and want to look at solutions or other exercises
# you will need to re-load the workshop package
library(shinyRworkshop)


# *****************************************
# ----- Plotting (ggplot2): Question 1 ----
# *****************************************

# Use the str() function to get a compact summary of the data.
# What type is the cut variable?

str(diamonds)

# ----- Answer
Factor variable


# *****************************************
# ----- Plotting (ggplot2): Question 2 ----
# *****************************************

# What code would you use to create a histogram of the
# price variable? 
hist(price)

# Do not worry about warnings about bins etc.

# ----- Answer
ggplot(data=diamonds, aes(diamonds$price))+geom_histogram()

# *****************************************
# ----- Plotting (ggplot2): Question 3 ----
# *****************************************

# What argument to geom_histogram() would you use if you
# wanted blue bars and red outlines (type ?geom_histogram to get hints)?

# ----- Answer
ggplot(data=diamonds, aes(diamonds$price))+geom_histogram(fill="blue",col="red")

# *****************************************
# ----- Plotting (ggplot2): Question 4 ----
# *****************************************

# What code would you use to create a scatter plot of carat vs price
#(carat should be on the x-axis)? 


# ----- Answer

ggplot(data=diamonds, aes(x=carat,y=price))+geom_point(col="red")



# *****************************************
# ----- Plotting (ggplot2): Question 5 ----
# *****************************************


# There is a lot of data and you have overplotting. You might get
# a better sense of the pattern if you add a little transparency. Experiment
# with different values (0-1) of alpha in geom_point(). What number might
# be good?


# ----- Answer

ggplot(data=diamonds, aes(x=carat,y=price))+geom_point()



# *****************************************
# ----- Plotting (ggplot2): Question 6 ----
# *****************************************


# What code would you use to add a smooth to the scatter? 


# ----- Answer

ggplot(data=diamonds, aes(x=carat,y=price))+geom_point(col="red")+stat_smooth()


# *****************************************
# ----- Plotting (ggplot2): Question 7 ----
# *****************************************


# How would you make the points red?


# ----- Answer

ggplot(data=diamonds, aes(x=carat,y=price))+geom_point(col="red")


# *****************************************
# ----- Plotting (ggplot2): EXTRA CREDIT 1 ----
# *****************************************


# Here is some sample data
x <- 1:1000
e <- rnorm(1000, mean = 50, sd = 50)
y <- x + e

dat <- data.frame(x = x, y = y)

# Create a scatter plot of this data and add a LINEAR smooth.
# See the help for stat_smooth. Then add a line
# with intercept 0, and slope 1 (geom_abline). Make
# the 0,1 line dashed.





# *****************************************
# ----- Plotting (ggplot2): EXTRA CREDIT 2 ----
# *****************************************

# Here is some sample data
x <- rnorm(5000, 1, 100)
y <- rnorm(5000, 1, 100)

dat <- data.frame(x = x, y = y)

ggplot(dat, aes(x,y)) + geom_point(color="grey")

# plot this data with stat_bin2d and stat_bin_hex (separately).
# what do these do. Try putting the points on top. For color try
# scale_fill_distiller(palette = "Spectral")



# STOP HERE FOR THE MOMENT


# *****************************************
# ----- Plotting (ggplot2): Question 8 ----
# *****************************************


# How would you color the points based on the variable cut (this
# is aesthetic mapping, not setting)? See the slides for an example.
# You probably want to get rid of the smooth. You also will want to
# delete the code from last step -- meaning you don't want to have
# color="red".

# ----- Answer
ggplot(data=diamonds, aes(x=carat,y=price,color=cut))+geom_point(col="red")+stat_smooth()                                                                 

# *****************************************
# ----- Plotting (ggplot2): Question 9 ----
# *****************************************

# Rewrite this code in the following ways:
# 1) Put the color=cut piece in the layer (within geom_point)
# 2) Put all of the aesthetic mapping in the layer
# 3) Put the data AND all of the aesthetic mapping in the layer

# double check that they all create the same plot


# ----- Answerads
ggplot(data=diamonds,aes(x=carat,y=price))+geom_point(aes(color=cut))+stat_smooth()  
ggplot()+ geom_point(data=diamonds,aes(x=carat,y=price,color=cut))


# *****************************************
# ----- Plotting (ggplot2): Question 10 ----
# *****************************************


# Create a set of plots, one for each value of "cut".

# ----- Answer 

ggplot()+ geom_point(data=diamonds,aes(x=carat,y=price),color="red")+facet_grid(.~cut)



# *****************************************
# ----- Plotting (ggplot2): Question 11 ----
# *****************************************


# What code would you use to add a title? See ?ggtitle
# there are two options

# ----- Answer 13
?ggtitle




# *****************************************
# ----- Plotting (ggplot2): Question 12 ----
# *****************************************


# Changing non-data features of the plot can be challenging.
# How would you change the background color to 'lemonchiffon'?
# This was not taught in the slides but the first example
# in ?theme (using panel.background) is pretty
# close to what you need. Should you use color or fill within
# element_rect?


# This one is tough so feel free to look at the solution if you need
# No, it's not pretty, you can pick your own color if you want.

# ----- Answer 






# *****************************************
# ----- Plotting (ggplot2): Question 13 ----
# *****************************************

# We can save the plot. ggplot2 has a built in save function
# so you can create your plot then use ggsave. Try saving
# a PDF and PNG version of the plots. See the ggsave help


# ----- Answer 






# *****************************************
# ----- Plotting (ggplot2): EXTRA CREDIT 3
# *****************************************

# take a look at this plot
ggplot(diamonds, aes(cut, price)) + geom_point()

# because we have so much data there is no pattern
# visible. Use a Google search to
# figure out how to jitter the points ("ggplot2 jitter")
#  when you jitter experiment with alpha to see if it 
# helps. Compare the jittering against a boxplot





