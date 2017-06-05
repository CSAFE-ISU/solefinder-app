
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {
  
  ## First Row ---------------------------------------------------------
  
  # Linked plots (left and right, first row)
  ranges_shoe1 <- reactiveValues(x = NULL, y = NULL)

  
  
  # Create a spot where we can store additional
  # reactive values for this session
  shoe1_points <- reactiveValues(pt1 = data.frame(x = 0, y = 0),    
                                 pt2 = data.frame(x = 0, y = 0))    
  
  # Listen for clicks
  observe({
    # Initially will be empty
    if (is.null(input$shoe1_click)){
      return()
    }

    if (input$radio_shoe1 == 1) {
      isolate({
        shoe1_points$pt1 <- update_click(ranges_shoe1, input$shoe1_click)
      })
    } else if (input$radio_shoe1 == 2) {
      isolate({
        shoe1_points$pt2 <- update_click(ranges_shoe1, input$shoe1_click)
      })
    }
    
  })
  
  ## Complete image
  output$shoe1 <- renderPlot({
    display(t(lena), method = "raster")
    })

  ## Zoomed in image
  output$shoe1_zoomed_in <- renderPlot({
    shoe1_cropped <- crop_image(t(lena), ranges_shoe1$x, ranges_shoe1$y)
    display(shoe1_cropped, method = "raster")
  })
  
  ## Current point
  output$shoe1_points <- renderTable({
    rbind(shoe1_points$pt1, shoe1_points$pt2)
  })
  
  # When a double-click happens, check if there's a brush on the plot.
  # If so, zoom to the brush bounds; if not, reset the zoom.
  observe({
    brush1 <- input$shoe1_brush
    if (!is.null(brush1)) {
      ranges_shoe1$x <- c(brush1$xmin, brush1$xmax)
      ranges_shoe1$y <- c(brush1$ymin, brush1$ymax)
    } else {
      ranges_shoe1$x <- NULL
      ranges_shoe1$y <- NULL
    }
  })

  ## Second Row ---------------------------------------------------------
  
  # Linked plots (left and right, first row)
  ranges_shoe2 <- reactiveValues(x = NULL, y = NULL)
  
  
  
  # Create a spot where we can store additional
  # reactive values for this session
  shoe2_points <- reactiveValues(pt1 = data.frame(x = 0, y = 0),    
                                 pt2 = data.frame(x = 0, y = 0))    
  
  # # Listen for clicks
  # observe({
  #   # Initially will be empty
  #   if (is.null(input$shoe2_click)){
  #     return()
  #   }
  #   
  #   if (input$radio_shoe2 == 1) {
  #     isolate({
  #       shoe2_points$pt1 <- data.frame(x = input$shoe2_click$x,
  #                                      y = input$shoe2_click$y)
  #     })
  #   } else if (input$radio_shoe2 == 2) {
  #     isolate({
  #       shoe2_points$pt2 <- data.frame(x = input$shoe2_click$x,
  #                                      y = input$shoe2_click$y)
  #     })
  #     
  #   }
  # })
  # 
  
  # Listen for clicks
  observe({
    # Initially will be empty
    if (is.null(input$shoe2_click)){
      return()
    }
    
    if (input$radio_shoe2 == 1) {
      isolate({
        shoe2_points$pt1 <- update_click(ranges_shoe2, input$shoe2_click)
      })
    } else if (input$radio_shoe2 == 2) {
      isolate({
        shoe2_points$pt2 <- update_click(ranges_shoe2, input$shoe2_click)
      })
    }
    
  })
  
  
  ## Complete image
  output$shoe2 <- renderPlot({
    display(t(lena), method = "raster")
  })
  
  ## Zoomed in image
  output$shoe2_zoomed_in <- renderPlot({
    shoe2_cropped <- crop_image(t(lena), ranges_shoe2$x, ranges_shoe2$y)
    display(shoe2_cropped, method = "raster")
  })
  
  ## Current point
  output$shoe2_points <- renderTable({
    rbind(shoe2_points$pt1, shoe2_points$pt2)
  })
  
  # When a double-click happens, check if there's a brush on the plot.
  # If so, zoom to the brush bounds; if not, reset the zoom.
  observe({
    brush2 <- input$shoe2_brush
    if (!is.null(brush2)) {
      ranges_shoe2$x <- c(brush2$xmin, brush2$xmax)
      ranges_shoe2$y <- c(brush2$ymin, brush2$ymax)
    } else {
      ranges_shoe2$x <- NULL
      ranges_shoe2$y <- NULL
    }
  })
  
})
