# Shiny application to review netrunner cards
# Sam Siljee
# 31/01/2024
# MIT licence

library(shiny)
library(dplyr)
library(DT)
library(httr)
library(jsonlite)

# Define server logic required to draw a histogram
function(input, output, session) {
  # Data ----

  # Read in cached card data table
  card_data <- read.csv("cache/card_data.csv")

  # Generate vector of available card sets
  card_sets <- card_data$pack_code %>%
    unique() %>%
    rev()

  # Read in cached collection data
  collection_data <- readLines("cache/collection_data.txt")

  # Reactive UI ----

  # Menu for selecting collection
  output$collection <- renderUI({
    selectInput(
      "collection",
      "Included sets (click to add or remove)",
      choices = card_sets,
      selected = collection_data,
      multiple = TRUE
    )
  })

  # Functions ----

  # Update collection data if it is changed
  observe({
    write(input$collection, "cache/collection_data.txt")
  })

  # Render outputs ----

  # Render table of corp cards
  output$corp_cards <- renderDT({
    return(
      card_data %>%
        filter(
            pack_code %in% input$collection &
                side_code == "corp" &
                faction_code %in% input$corp_filter
            ) %>%
        select(title, faction_code)
    )
  })

  # Render table of runner cards
  output$runner_cards <- renderDT({
    return(
      card_data %>%
        filter(
          pack_code %in% input$collection &
            side_code == "runner" &
            faction_code %in% input$runner_filter
        ) %>%
        select(title, faction_code)
    )
  })
}
