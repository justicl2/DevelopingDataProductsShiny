

library(shiny)


shinyServer(function(input, output) {
  
  model1 <- lm(mpg~as.factor(am), data = mtcars)
  model2 <- lm(mpg~as.factor(am)+as.factor(cyl) + wt + hp, data = mtcars)
  
  model1pred <- reactive({
    amInput <- input$radiotrans 
    predict(model1, newdata = data.frame(am = amInput))
  })
  
  model2pred <- reactive({
    amInput <- input$radiotrans
    cylInput <- input$radiocyl
    hpInput <- input$sliderhp
    wtInput <- input$sliderwt
    predict(model2, newdata = data.frame(am = amInput, 
                                         cyl = cylInput,
                                         hp = hpInput,
                                         wt = wtInput))
    
  })

  
  output$pred1 <- renderText({
    model1pred()
  })
  
  output$pred2 <- renderText({
    model2pred()
  })
 
})