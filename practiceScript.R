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

# Write card data to cache for offline use
write.csv(card_data, "prettyMessenger/cache/card_data.csv")

# Read in the card data again from the cache
card_data <- read.csv("prettyMessenger/cache/card_data.csv")
