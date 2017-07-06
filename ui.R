library(ggplot2)
library(Cairo)   # For nicer ggplot2 output when deployed on Linux
library(shiny)
library(EBImage)
library(solefinder)

shinyUI(fluidPage(tabsetPanel(
  tabPanel("Introduction Page", 
           fluidRow(h1("Solefinder"))
  ), # End Intro Page
  tabPanel("Upload", 
           fluidRow(
             h1("Upload shoesoles images"),
             column(width = 12, class = "well",
                    fluidRow(
                      column(width = 12,
                             fileInput("img1", "First shoe-sole image"))
                    )))
  ), # End Intro Page
  tabPanel("Compare shoe-soles", 
           fluidRow(
             h4("Shoe 1"),
             column(width = 12, class = "well",
                    fluidRow(
                      column(width = 2,
                             radioButtons("radio_shoe1", label = "Select points to find parameters",
                                          choices = list("Point 1" = 1, "Point 2" = 2, "Point 3" = 3), 
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
             h4("Shoe 2"),
             column(width = 12, class = "well",
                    fluidRow(
                      column(width = 2,
                             radioButtons("radio_shoe2", label = "Select points to find parameters",
                                          choices = list("Point 1" = 1, "Point 2" = 2, "Point 3" = 3), 
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
             
           ),
           fluidRow(
             h4("Shoe 3"),
             column(width = 12, class = "well",
                    fluidRow(
                      column(width = 2,
                             radioButtons("radio_shoe3", label = "Select points to find parameters",
                                          choices = list("Point 1" = 1, "Point 2" = 2, "Point 3" = 3), 
                                          selected = 1),
                             tableOutput("shoe3_points")
                      ),
                      column(width = 5,
                             h4("Select area to zoom in"),
                             plotOutput("shoe3", height = 300,
                                        brush = brushOpts(
                                          id = "shoe3_brush",
                                          resetOnNew = TRUE
                                        )
                             )
                      ),
                      column(width = 5,
                             h4("Click to select a point"),
                             plotOutput("shoe3_zoomed_in", height = 300,
                                        click = "shoe3_click")
                      )
                    )
             )
           )
  ), # End Compare shoe-soles tab
  tabPanel("tab3", "contents")
) # End tabsetPanel
) # End fluidPage
) # End shinyUI

