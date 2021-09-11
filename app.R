# Medical Formula

library(shiny)

sex <- c("Male", "Female")

# Define UI for application 
ui <- fluidPage(
    # Application title
    titlePanel("Medical Formula"),
    fluidRow(
    #Input Form
    numericInput("age", "Age (Years)", value = 0, min = 0, max=100),
    numericInput("wei", "Ideal Body Weight (Kg)", value = 0, min = 0, max=100),
    numericInput("cre", "Creatinin Value (mg/dl)", value = 0, min = 0, max=100),
    radioButtons("sex", "Gender", sex),
    
    # Output Pane
    verbatimTextOutput("egfr")
    ),
    
    fluidRow(
      
    #Input Form
    numericInput("age", "Age (Years)", value = 0, min = 0, max=100),
    numericInput("wei", "Ideal Body Weight (Kg)", value = 0, min = 0, max=100),
    numericInput("cre", "Creatinin Value (mg/dl)", value = 0, min = 0, max=100),
    radioButtons("sex", "Gender", sex),
    
    # Output Pane
    verbatimTextOutput("egfr")
    )
)

# Define server logic 
server <- function(input, output) {

    output$egfr <- renderPrint({
       ifelse(input$sex == "Male", 
         ((140 - input$age) * input$wei) / (input$cre * 72),
         (((140 - input$age) * input$wei) / (input$cre * 72))*0.85
       )
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
