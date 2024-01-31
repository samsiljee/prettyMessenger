# Shiny application to review netrunner cards
# Sam Siljee
# 31/01/2024
# MIT licence

library(shiny)

# Define UI for application that draws a histogram
fluidPage(

  # Application title
  titlePanel("prettyMessenger"),

  # Main data
  tabsetPanel(
    tabPanel(
      "Corp cards",
      checkboxGroupInput(
          "corp_filter",
          NULL,
          choiceNames = c(
              "Neutral",
              "HB",
              "Jinteki",
              "NBN (please don't kill me Charlie)",
              "Big Bad Green"
              ),
          choiceValues = c(
              "neutral-corp",
              "haas-bioroid",
              "jinteki",
              "nbn",
              "weyland-consortium"
              ),
          selected = c(
              "neutral-corp",
              "haas-bioroid",
              "jinteki",
              "nbn",
              "weyland-consortium"
              )),
DTOutput("corp_cards")
    ),
    tabPanel(
      "Runner cards",
      checkboxGroupInput(
          "runner_filter",
          NULL,
          choiceNames = c(
              "Neutral",
              "Anarch",
              "Criminal",
              "Shaper",
              "Apex",
              "Adam",
              "Sunny-Lebeau"
          ),
          choiceValues = c(
              "neutral-runner",
              "anarch",
              "criminal",
              "shaper",
              "apex",
              "adam",
              "sunny-lebeau"
          ),
          selected = c(
              "neutral-runner",
              "anarch",
              "criminal",
              "shaper",
              "apex",
              "adam",
              "sunny-lebeau"
          )),
      DTOutput("runner_cards")
    ),
    tabPanel(
      "Options",
      uiOutput("collection")
    )
  )
)
