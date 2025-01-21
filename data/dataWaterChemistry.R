data.frame(
  Site_ID = paste(input$tabs),
  `DO_mg/L` = input[[paste0("DO_", input$tabs)]],
  `DO_%Sat` = input[[paste0("DOSaturation_", input$tabs)]],
  Conductivity = input[[paste0("Conductivity_", input$tabs)]],
  Temperature_C = input[[paste0("Temperature_", input$tabs)]]
)