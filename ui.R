library(ggplot2)
library(Cairo)   # For nicer ggplot2 output when deployed on Linux
library(shiny)
library(EBImage)
library(solefinder)

shinyUI(fluidPage(
  fluidRow(
    column(width = 12, class = "well",
           h4("Lena!"),
           fluidRow(
             column(width = 2,
                    radioButtons("radio_shoe1", label = h3("Shoe 1"),
                                 choices = list("Point 1" = 1, "Point 2" = 2), 
                                 selected = 1),
                    tableOutput("shoe1_points")
             ),
             column(width = 5,
                    h4("Select area to zoom in"),
                    plotOutput("shoe1", height = 300,
                               brush = brushOpts(
                                 id = "shoe1_brush",
                                 resetOnNew = TRUE
                               )
                    )
             ),
             column(width = 5,
                    h4("Click to select a point"),
                    plotOutput("shoe1_zoomed_in", height = 300,
                               click = "shoe1_click")
             )
           )
    )
    
  ),
  fluidRow(
    column(width = 12, class = "well",
           h4("Lena1!"),
           fluidRow(
             column(width = 2,
                    radioButtons("radio_shoe2", label = h3("Shoe 2"),
                                 choices = list("Point 1" = 1, "Point 2" = 2), 
                                 selected = 1),
                    tableOutput("shoe2_points")
             ),
             column(width = 5,
                    h4("Select area to zoom in"),
                    plotOutput("shoe2", height = 300,
                               brush = brushOpts(
                                 id = "shoe2_brush",
                                 resetOnNew = TRUE
                               )
                    )
             ),
             column(width = 5,
                    h4("Click to select a point"),
                    plotOutput("shoe2_zoomed_in", height = 300,
                               click = "shoe2_click")
             )
           )
    )
    
  )
))
