library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Predicting MPG using Two Models"),
  sidebarLayout(
    sidebarPanel(
      
      sliderInput("sliderwt", "Input weight (in 1000s):", 1.5, 5, value = 3.5), 
      sliderInput("sliderhp", "Input gross horsepower:", 55, 300, value = 150),
      radioButtons("radiotrans", "Select Transmission Type:",
                          choices = list("Automatic" = 0, "Manual" = 1), selected = 0),
      radioButtons("radiocyl", "Select Number of Cylinders:",
                          choices = list("4" = 4, "6" = 6, "8" = 8), selected = 4),
      submitButton("Submit") 
      )
      ,
    
    mainPanel(
      p("This application helps to illustrate the predicted MPG between two linear regression models: 
        One using just transmission type as the independent variable (the simple model),
        and a one using transmission type, number of cylinders, weight, and horsepower as input variables
        (the advanced model)."),
      br(),  
      p("Select your desired inputs and click 'Submit'. The predicted values for the two models
        based on your inputs will appear below."),
      br(),
      h3("Predicted MPG from Simple Model:"), 
      textOutput("pred1"), 
      h3("Predicted MPG from Advanced Model:"),
      textOutput("pred2")
    )
  )
))

