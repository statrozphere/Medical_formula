# Medical Formula

library(shiny)

sex <- c("Male", "Female")

# Define UI for application 
ui <- fluidPage(
    navbarPage(
    "Lazy",
    navbarMenu("Cardiovascular",
      tabPanel("Estimated Glomerular Filtration Rate", "eGFR Cockrouft Gault",
              #Input Form
              fluidRow(
                column(width = 4,
                  numericInput("age", "Age (Years)", value = 0, min = 0, max=100),
                  numericInput("wei", "Ideal Body Weight (Kg)", value = 0, min = 0, max=100),
                  numericInput("cre", "Creatinin Value (mg/dl)", value = 0, min = 0, max=100),
                  radioButtons("sex", "Gender", sex),
                  ),
                  column(width = 6,
              # Output Pane
                textOutput("Cockroft Gault"),
                verbatimTextOutput("egfr")   
               ))
              )),
    navbarMenu("Renal",
      tabPanel("Estimated Glomerular Filtration Rate", "eGFR Cockrouft Gault",
               #Input Form
               fluidRow(
                 column(width = 4,
                  numericInput("age", "Age (Years)", value = 0, min = 0, max=100),
                  numericInput("wei", "Ideal Body Weight (Kg)", value = 0, min = 0, max=100),
                  numericInput("cre", "Creatinin Value (mg/dl)", value = 0, min = 0, max=100),
                  radioButtons("sex", "Gender", sex),
                 ),
                 column(width = 6,
               # Output Pane
               textOutput("Cockroft Gault"),
               verbatimTextOutput("egfr")
               )
            )
          )
      )
  )
)
    

    
###############################################################################

# Define server logic 
server <- function(input, output) {
    output$cg <- renderText({
      "Estimated Glomerular Filtration Rate  ~ Cockroft Gault Formula"
    })
    output$egfr <- renderPrint({
       ifelse(input$sex == "Male", 
         ((140 - input$age) * input$wei) / (input$cre * 72),
         (((140 - input$age) * input$wei) / (input$cre * 72))*0.85
       )
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
