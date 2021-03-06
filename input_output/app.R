library(shiny)

server <- function(input, output) {
  output$input_value <- renderPrint({
    cat(input$slide)                # cat() is an alternative to print(), see: ?cat()
  })                                ## I'm only using it here to hide the index that
                                    ## would be otherwise outputted. For example:
                                    ## > print(2)
                                    ## [1] 2
                                    ## > cat(2)
                                    ## 2
  
  output$input_class <- renderPrint({
    cat(class(input$slide))
  })
  
  output$input_mode <- renderPrint({
    cat(mode(input$slide))
  })
  
  output$input_str <- renderPrint({
    cat(str(input$slide))
  })
  
  output$input_halved <- renderPrint({
    cat(input$slide / 2)
  })
  
  output$input_sqrt <- renderPrint({
    cat(sqrt(input$slide))
  })
}

ui <- fluidPage(
  titlePanel("Demo"),
  withMathJax(),       # MathJax is JavaSript library for rendering mathematical notation.
                       # If equations are desired, you can use LaTeX. Examples below.
  sidebarLayout(
    sidebarPanel(
      sliderInput("slide", "Select value from slider",
                  min = 0, max = 5,
                  value = 2)
      ),
    
    mainPanel(
      tags$h2(tags$strong("How R Sees the Slider's Input")),
      
      tags$h4("Input Value:"),
      textOutput("input_value"),
      
      tags$h4("Input Class:"),
      textOutput("input_class"),       # integer
      
      tags$h4("Input Storage Mode:"),
      textOutput("input_mode"),        # numeric
      
      tags$h4("Input Structure:"),
      textOutput("input_str"),         # int [value of `input$slide`]
      
      tags$h2(tags$strong("Results of Operations Performed on Slider Input")),
       
      tags$h4("$$ \\frac {x_{input}} {2} $$"),
      tags$h4(textOutput("input_halved")),
      
      tags$h4("$$ \\sqrt {x_{input}} $$"),
      tags$h4(textOutput("input_sqrt"))
      )
    )
  )


shinyApp(ui, server)



