# 1) Use R to figure out how many elements in the vector below are greater than 2
rooms <- c(1, 5, 2, 3, 1, NA, 3, 1, 3, 2, NA, 1, 8, 3, 1, 4, NA, 1, 3, 1, 2, 1, 7, 1, NA, 4, 3 ,1 ,7 ,2 ,1 ,NA ,1, 1, 3)
is.na(rooms) # returns TRUE on missing values, FALSE on numbers
rooms_no_na <- rooms[ !is.na(rooms) ] # the ! inverts the above function, making rooms_no_na a rooms without missing values
rooms_no_na[rooms_no_na>2] # shows us the 13 values that are above 2

# 2) Which function tells you the type of data the 'rooms' vector above contains?
str(rooms) # tells us it is a "num"-object

# 3) What is the result of running the median() function on the above 'rooms' vector?
median(rooms) # as there are missing values, it will return "NA"
median(rooms, na.rm=TRUE) # will ignore the missing values and return the number 2

# 4) Take a screenshot of your RStudio interface showing
    # a) the line of code you used to create the object 'interviews', incl. the output in the console,
    # b) the 'interviews' object in the "Environment" top right pane , and
    # c) the file structure of your R project in the bottom right "Files" pane.

install.packages("tidyverse")
library(tidyverse)

# downloading SAFI_clean.csv
download.file(
  "https://raw.githubusercontent.com/datacarpentry/r-socialsci/main/episodes/data/SAFI_clean.csv",
  "data/SAFI_clean.csv", mode = "wb"
)

# read csv, and save csv to interviews object
read_csv("data/SAFI_clean.csv")
interviews <- read_csv("data/SAFI_clean.csv")

# Save the screenshot as a .png image and put it in your AUID_lastname_firstname repository inside the class Github organisation (www.github.com/Digital-Methods-HASS) or equivalent. Place here the URL leading to the screenshot in your repository.


# 5) Challenge: Tidy up your Danish monarchs dataset (you created last week) sufficiently so that you can load it into R as a table using the read_csv() and calculate the mean() and median() duration of their rule over time.

# when I made the spreadsheet, I was curious as to who had the longest reigns and how long they were, so I already added a column doing a very basic reign_end minus reign_start-calculation, meaning no tidying was needed
read_csv2("data/kongeraekke.csv") # looks right, time to import!
monarchs <- read_csv2("data/kongeraekke.csv") # as the Excel csv-export is semicolon-separated and not comma-separated, we use read_csv2

mean(monarchs$reign_length, na.rm = TRUE) # na.rm = TRUE is needed as the current monarch Frederik X does not have a value in the reign_end (and thus also not in the reign_length) column
# the above operation returns a mean reign length of 19.76786 years
median(monarchs$reign_length, na.rm = TRUE)
# the above operation returns a median reign length of 18.5 years
