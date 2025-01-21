data.frame(
  Site_ID = input[[paste0("siteId_", input$tabs)]],
  Date_Collected = input[[paste0("dateCol_", input$tabs)]],
  Site_Name = input[[paste0("siteName_", input$tabs)]],
  Latitude = input[[paste0("latitude_", input$tabs)]],
  Longitude = input[[paste0("longitude_", input$tabs)]]
)