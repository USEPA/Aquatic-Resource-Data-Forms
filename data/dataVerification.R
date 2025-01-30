x <- c("Verification","WaterChemistry","FishCollection","HydrographicProfile")
ID <- trimws(sub(paste(x, collapse = "|"), "", input$forms))


data.frame(
  Site_ID = input[[paste0("siteId_", ID)]],
  Resource = input[[paste0("resource_", ID)]],
  Date_Collected = input[[paste0("dateCol_", ID)]],
  Site_Name = input[[paste0("siteName_", ID)]],
  Latitude = input[[paste0("latitude_", ID)]],
  Longitude = input[[paste0("longitude_", ID)]]
)