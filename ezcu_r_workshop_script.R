### Welcome to the Ecology and Zoology course union's Introduction to 
### R and RStudio for data manipulation and visualization
### Author: Lynndsay Terpsma
### Created: October 19, 2025
### Last updated: October 19, 2025

### ----------------------------------------------------------------------------
# Basics ----
### ----------------------------------------------------------------------------

# this is a comment. comments are ignored when running code!
# comments can be prefixed by any number of `#`

# you can use comments to annotate your scripts, as well as helping with organization!

# if you add any four `-` after a `#`, it transforms the it into a drop down
# you can use this to help hide sections of your code when they are not in use!

# you can make any text into a comment by highlighting it and using the shortcut `ctrl + shift + c`

# for example:

### Section 1 -----

# if you hit the small triangle at line 23, this text line and everything below it will disappear
# if you don't want all the text below section 1 to disappear, make sure to create
# another section below using the same technique

# using `#####` without any text afterwards also has the same effect!

# also note that at the bottom on the script pane, there is a section navigator!

##### To run a command ----
# 1) to run a single line, click on the line and select `run` or use `ctrl + enter` // `command + enter`
# 2) to run multiple lines of code, highlight them and select `run` or use `ctrl + enter` // `command + enter`
# 3) to run all the code in a script, use `ctrl + shift + enter` // `command + shift enter`

# this first thing to do in a new script is to load the packages that you want to use

# to download packages, use the `install.packages()` function!
# only download them once 

# install.packages("dplyr")
# install.packages("ggplot2")

# to load packages, use the `library()` function

library(dplyr)
library(ggplot2)

### projects and working directories ----

# using R projects is useful to help you keep all scripts for a particular project
# organized. this also allows you to keep separate work spaces for each project.

# the working directory is the specific location on your computer's file system where 
# R will look for files that you want to load and where it will save any files your create

# to set your working directory, use
# setwd("file-location-on-your-computer")

# you can check your working directory by looking at the top of the console pane
# or by using
getwd() # when you run this, your working directory will appear in the console

### Computer readability----

# REMINDER! computers cannot handle spaces well
# if you are naming files or objects in R, make sure to use proper naming conventions, 
# separating words with underscores (`_`) or hyphens (`-`)

# remember that your files need to be understandable not only to you, but to anyone else
# that may look at your project

# some examples from https://datamanagement.hms.harvard.edu/plan-design/file-naming-conventions

## no naming convention
  # test data 2016.xlsx
  # Meeting notes Jan 17.doc
  # Notes Eric.txt
  # Final FINAL last version.docx

## with a name convention
  # 20160104_ProjectA_Ex1Test1_SmithE_v1.xlsx
  # 20160104_ProjectA_MeetingNotes_SmithE_v2.docx
  # ExperimentName_InstrumentName_CaptureTime_ImageID.tif

### Operators ----

  1 + 1 # addition
  5 - 1 # subtraction
  2 * 3 # multiplication
  12 / 4 # division
  12 %% 5 # modulus (gives the remainder)

### Logic ----
# these return TRUE/FALSE
  
  1 == 1 # does 1 = 1?
  1 == 2 # does 1 = 2?
  1 < 2  # is 1 less than 2?
  1 > 2 # is 1 greater than 2?
  1 <= 2  # is 1 less than or equal to 2?
  1 >= 2 # is 1 greater than or equal to 2?
  1 != 2 # is 1 not equal to 2? 

## Vectors ----

# a reminder that a variable is a characteristic/measurement that varies among individuals

# in R, there are different categories that variables can be, which is important when you try to use your variables 
# to perform calculations or plot with them

# numerical vectors

  num_vector <- c(10, 50, 10, 40)

## here we assign (using `<-`) the name `num_vector` to a list of numbers,
## using the c() function to combine values into a vector

# character vectors

  characters <- c("Mario", "Luigi", "Zelda", "Link") 

## here we assign the name `characters` to a list of character values, using the c() function again

# we can check the type of variables that these two objects are using `class()`

  class(num_vector) # returns `numeric`
  class(characters) # returns `character`

# ------------------------------------------------------------------------------
### data manipulation ----
# ------------------------------------------------------------------------------

# let's start with the ChickWeight dataset in R
  data(ChickWeight)

# start with opening the help file for this dataset, this will show us what each column means
  ?ChickWeight

# then let's view the first few rows of data
  head(ChickWeight)

# let's create a copy of the dataset for simplicity
  chicks <- ChickWeight
  
# note that this appears in our environment!

# quick structure and summary
  glimpse(chicks) # shows us the variable type and gives glance into the data itself
  summary(chicks) # gives us some summary statistics for all the columns

# each row is a weight measurement of one chick at a given time
# columns include: weight (g), time (days since birth), Chick ID, and diet type

# data manipulation with dplyr
  
# renaming columns
  chicks <- chicks %>% 
    rename(Weight = weight)

# filter: select rows based on conditions
# show chicks fed diet type 1 only
  chicks %>% 
    filter(Diet == 1)

# select: show specific columns only
  chicks %>% 
    select(Chick, Time, Weight)

# arrange: sort rows
  chicks %>% 
    arrange(desc(Weight)) # descending order by weight

# mutate: create a new variable
  chicks %>% 
    mutate(Weight_kg = Weight / 1000)

# summarise + group_by: compute statistics by group
# note that this time, we are creating a new data frame called `chicks_summary`
  chicks_summary <- chicks %>% 
    group_by(Diet) %>% 
    summarise(mean_weight = mean(Weight),
              sd_weight = sd(Weight),
              n = n())

# you can chain multiple verbs with pipes ( %>% )
  chicks %>% 
    filter(Time == 21) %>% 
    group_by(Diet) %>% 
    summarise(mean_weight = mean(Weight)) %>% 
    arrange(desc(mean_weight))

### other notes

# the shortcut for generating `%>%` is `ctrl + shift + m` 
# these examples are in dplyr/tidyverse format, but the same manipulations can be done with base R functions
# you can put brackets around a section of text by highlighting it and typing `(`
# this also goes for quotation marks, apostrophes, etc. 

### PRACTICE:
### if you are creating new data frames, make sure to give them informative names!

# 1) Create a new data frame, filtering for a single chick (e.g., Chick 10)

# 2) Compute mean weight for each time point (regardless of diet)
  
# 3) Add a column for log(weight)
    
# 4) Summarise mean weight, grouped by diet and time, making it a data frame with the name `chicks_plot`
  
# ------------------------------------------------------------------------------
### data visualization ----
# ------------------------------------------------------------------------------

# let's first look at the `ggplot2` cheat sheet to get an idea of the possibilities

# we can find the ggplot() template in the cheat sheet, which when simplified to 
# only the requirements, looks like this

# ggplot(data = <DATA>) +
#   <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))

# however, the mappings can also go into the ggplot() call... 

# plotting weight vs time:

  ggplot(chicks, aes(x = Time, y = Weight)) +
    geom_point()

# note that this is the same plot as 
  
  ggplot(chicks) +
    geom_point(aes(x = Time, y = Weight))

# thus, your method of figure creation will depend on your goal. placing the mappings within 
# the `ggplot()` call is typically the easiest. however, if you want to use different variables for
# different layers on your plot, placing the mappings in each function is the way to go

# now let's get into different techniques

# add colour by diet to see treatment differences
  ggplot(chicks, aes(x = Time, y = Weight, color = Diet)) +
    geom_point(alpha = 0.6) + #adds transparency to points to increase visibility
    theme_minimal() # using built in themes can make your plots look even better!
  
  # add lines to show growth trajectories for each chick
  ggplot(chicks, aes(x = Time, y = Weight, group = Chick, color = Diet)) +
    geom_line(alpha = 0.7) + 
    theme_minimal()

# summarize and plot mean weight per diet over time
# using the dplyr data manipulation framework, we can summarise and plot our data in one chunk of code
  chicks_plot <- chicks %>% 
    group_by(Diet, Time) %>% 
    summarise(mean_weight = mean(Weight), .groups = "drop") # `.groups` argument removes grouping from final table
  
  ggplot(chicks_plot, aes(x = Time, y = mean_weight, color = Diet)) +
    geom_line(linewidth = 1.2) + 
    geom_point(size = 2) +
    labs(title = "Mean Chick Weight Over Time by Diet",
         x = "Days Since Birth",
         y = "Mean Weight (g)", 
         color = "Diet") +
    theme_minimal()

# example using multiple layers, with the same dataset from above
  ggplot() +
    geom_point(data = chicks, aes(x = Time, y = Weight, color = Diet),
               alpha = 0.5) + #shows the raw data points, colored by diet
    geom_line(data = chicks_plot, aes(x = Time, y = mean_weight, color = Diet),
              linewidth = 1.2) + #shows the mean weight by diet
    labs(title = "Mean Chick Weight Over Time by Diet", 
         x = "Days Since Birth",
         y = "Weight (g)", 
         color = "Diet") +
    theme_minimal()

# we can also combine manipulation and visualization

# compare final day (day 21) weights by diet using boxplots
  chicks %>% 
    filter(Time == 21) %>% 
    ggplot(aes(x = factor(Diet), y = Weight, fill = factor(Diet))) +
    geom_boxplot() +
    labs(title = "Final Weight by Diet",
         x = "Diet type",
         y = "Weight (g)",
         fill = "Diet") +
    theme_minimal() 
  
###-----------------------------------------------------------------------------
# Additional information ----
###-----------------------------------------------------------------------------

### example of base R vs tidyverse

### BASE R

  # subset rows for day 21 only
  day21 <- ChickWeight[ChickWeight$Time == 21, ]
  
  # compute mean weight by diet
  diet_means <- tapply(day21$weight, day21$Diet, mean)
  
  # view results
  diet_means
  
  # find which diet has the highest mean
  best_diet <- names(diet_means)[which.max(diet_means)]
  best_diet
  
### tidyverse
  
  ChickWeight %>% 
    filter(Time == 21) %>% 
    group_by(Diet) %>% 
    summarise(mean_weight = mean(weight)) %>% 
    arrange(desc(mean_weight))
  
### uploading your own datasets
  
# if you are interested in using your own data, you can upload .csv files using the
# `read.csv()` function
  
# if your csv is not in tidy format, you can edit it using R, you don't need to edit your excel spreadsheet
  
# there are also plug-ins for google sheets so that you can actively add to your data and import into R 
# without having to re-save your file as a csv.

