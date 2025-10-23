### Welcome to the Ecology and Zoology course union's Introduction to 
### R and RStudio for data manipulation and visualization
### Author: Lynndsay Terpsma (lterpsma@student.ubc.ca)
### Created: October 19, 2025
### Last updated: October 23, 2025

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

#----

##### To run a command ----
# 1) to run a single line, click on the line and select `run` or use `ctrl + enter` // `cmd + return`
# 2) to run multiple lines of code, highlight them and select `run` or use `ctrl + enter` // `cmd + return`
# 3) to run all the code in a script, use `ctrl + shift + enter` // `cmd + shift + return`

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

# for more information on projects and working directories
# https://support.posit.co/hc/en-us/articles/200526207-Using-RStudio-Projects
# https://support.posit.co/hc/en-us/articles/200711843-Working-Directories-and-Workspaces-in-the-RStudio-IDE

### Computer readability----

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

### Variables ----
# https://www.w3schools.com/r/r_variables.asp

# Variables in R are containers for storing data values
# to assign a value to a variable, use the `<-` sign
# for example:
  
  name <- "EZCU"
  year <- 2025

  name # output "EZCU"
  year # output 2025
  
  # note that `name` and `year` are variables, while "EZCU" and 2025 are values
  
# in R, there are different categories that variables can be, which is important when you try to use your variables 
# to perform calculations or plot with them
  
# VARIABLE NAMES:
  
  # must start with a letter and can be a combination of letters, digits, period(.), and underscore(_). If it starts with a period, it cannot be followed by a digit
  # cannot start with a number or underscore
  # names are case-sensitive
  # reserved words cannot be used as variables (TRUE, FALSE, NULL, if, etc.)
  
### Data types ----
# https://www.w3schools.com/r/r_data_types.asp

# Variables can store data of different types, and different types can do different things
  
# Basic Data Types
  
  # numeric (e.g., 10.5, 55, 787)
    x <- 10.5 
    class(x)
  
  # integer (e.g., 1L, 55L, 1000L, where the letter "L" declares this as an integer)
    x <- 1000L
    class(x)
    
  # complex (e.g., 9 + 2i, where "i" is the imaginary part)
    x <- 9i + 3 
    class(x)
    
  # character (e.g., "k", "R is exciting", "FALSE") - aka string
    x <- "R is exciting" 
    class(x)
    
  # logical (e.g., TRUE, FALSE) - aka boolean
    x <- TRUE
    class(x)
    
# hint, you can convert between data types using functions such as `as.numeric()`, `as.integer()`, `as.complex()`
    
### Data structures ----
# https://www.w3schools.com/r/r_data_structures.asp
    
# Types of data structures
    
    # vectors: most basic data structure, contains a list of items of the same type
        # numerical vector
        num_vector <- c(10, 50, 10, 40)
    
        # character vector
        fruits <- c("banana", "apple", "kiwi")
        
    # lists: can hold different types of data in one structure (e.g., numbers, strings, vectors, or even other lists)
        example_list <- list("apple", "banana", 10, 50)
        example_list
        
    # matrices: 2D data structure where all elements are of the same type; like a table with rows and columns
        example_matrix <- matrix(c(1,2,3,4,5,6), nrow = 3, ncol = 2) # you can use nrow/ncol to control the size of the matrix
        example_matrix
    
    # data frames: like a table in a spreadsheet, can hold different data types across columns
        example_df <- data.frame(
          timestep = c(1, 5, 10),
          leaf_diameter = c(29, 34, 18),
          stem_length = c(20, 45, 37),
          leaf_color = c("green", "red", "brown")
        )
        
        example_df

# ------------------------------------------------------------------------------
### data manipulation ----
# ------------------------------------------------------------------------------

# the most common dplyr functions, courtesy of 
# https://librarycarpentry.github.io/lc-r/03-data-cleaning-and-transformation.html
  
# rename(): rename columns
# recode(): recode values in a column
# select(): subset columns
# filter(): subset rows on conditions
# mutate(): create new columns by using information from other columns
# group_by() and summarise(): create summary statistics on grouped data
# arrange(): sort results
# count(): count discrete values
  
# tidyverse uses the pipe ` %>% ` for 

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
# this will replace the un-capitalized 'weight' column title with 'Weight'
# the new variable name comes first
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
# it is good practice to also calculate the standard deviation and at the number of observations (n), rather than just calculating the mean
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

### PRACTICE:
### if you are creating new data frames, make sure to give them informative names!

# 1) Create a new data frame, filtering for a single chick (e.g., Chick 10)

# 2) Compute mean weight for each time point (regardless of diet)
  
# 3) Add a column for log(weight)
    
# 4) Summarise mean weight, grouped by diet and time, making it a data frame with the name `chicks_plot`
  
# ------------------------------------------------------------------------------
### data visualization ----
# ------------------------------------------------------------------------------

# if you want to know all the possibilities using ggplot2, have a look at the reference page
# https://ggplot2.tidyverse.org/reference/index.html

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
  
### the most common geom_functions include 
  
  ### for one variable
  # geom_histogram() - for continuous variables
  # geom_density() - for continuous variables
  # geom_bar() - for discrete variables
  
  ### for two variables
  # geom_boxplot() - for discrete X, continuous Y
  # geom_point() - for continuous X and Y
  # geom_mooth() - for continuous X and Y
  
  ### for line segments
  # geom_abline - for diagonal line
  # geom_hline - for horizontal line
  # geom_vline - for vertical line
  
### changing plot aesthetics
  
# using our first plot as an example, we can ...
  
  # change the colour of the points:
    ggplot(chicks, aes(x = Time, y = Weight)) +
      geom_point(color = "steelblue")
    
  # change the opacity of the points:
    ggplot(chicks, aes(x = Time, y = Weight)) +
      geom_point(alpha = 0.5)
  
  # change the size of the points:
    ggplot(chicks, aes(x = Time, y = Weight)) +
      geom_point(size = 5)
    
  # change the type of points:
    ggplot(chicks, aes(x = Time, y = Weight)) +
      geom_point(shape = 13, size = 5)
  
# if you are ever unsure what changes you can make, run `?geom_point` to bring up the help page

### more complicated techniques
    
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
    summarise(mean_weight = mean(Weight), 
              sd_weight = sd(Weight),
              n = n(), .groups = "drop") # `.groups` argument removes grouping from final table
  
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

# we can also combine manipulation and visualization within the tidyverse framework

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
  
# resources for data uploads
# https://www.datacamp.com/tutorial/r-data-import-tutorial
# https://www.digitalocean.com/community/tutorials/google-sheets-in-r
  
### R and RStudio have decent integration with Git and GitHub if you wish to run version control for your project
# visit: https://rfortherestofus.com/2021/02/how-to-use-git-github-with-r ; if you want to get yourself started!
  
### useful keyboard shortcuts
  
# the shortcut for generating `%>%` is `ctrl + shift + m` // `cmd + shift + m`

# you can put brackets around a section of text by highlighting it and typing `(`; this also goes for quotation marks, apostrophes, etc. 
  
# check out this website for all keyboard shortcuts
# https://support.posit.co/hc/en-us/articles/200711853-Keyboard-Shortcuts-in-the-RStudio-IDE 
