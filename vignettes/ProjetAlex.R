params <-
structure(list(country_to_analyze = "France"), .Names = "country_to_analyze")

## ----setup, include = TRUE-----------------------------------------------
knitr::opts_chunk$set(echo = TRUE, message = TRUE, eval = TRUE)

## ----libraries-----------------------------------------------------------
library(readxl)
library(utils)
library(assertthat)
library(dplyr)
library(tidyverse)
library(ProjetAlex)

## ----loading the data----------------------------------------------------
load("../data/data2015.rda")
load("../data/data2016.rda")
load("../data/data2017.rda")


## ----concatenating data--------------------------------------------------
# first, I have to mutate the data in order to add a column with the year in each database
# I'm going to use a function I coded, in the R file, called add_year

data2015 <- add_year(data2015, 2015)
data2016 <- add_year(data2016, 2016)
data2017 <- add_year(data2017, 2017)


## ------------------------------------------------------------------------
# Now that I have the year of each observation, in order to bind all my data together, I have to tidy it so I have the same columns in each of my dataframes

data2015 <- data2015 %>% 
  select(-Region, -Standard.Error)
data2016 <- data2016 %>% 
  select(-Region, -Lower.Confidence.Interval, -Upper.Confidence.Interval)
data2017 <- data2017 %>% 
  select(-Whisker.high, -Whisker.low)


## ------------------------------------------------------------------------
#at long last, I can finally bind the data together
data_Happiness <- bind_rows(data2015, data2016, data2017)

