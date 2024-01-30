# Script to practice API access stuff
# Sam Siljee
# 31/1/24
# MIT licence

# Load libraries
library(httr)
library(jsonlite)

# Get cards
cards <- GET("https://netrunnerdb.com/api/2.0/public/cards")
cards

data <- fromJSON(rawToChar(cards$content))

card_data <- data$data
