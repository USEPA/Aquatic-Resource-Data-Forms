ID <- trimws(sub(paste(X, collapse = "|"), "", input$forms))


data.frame(
  Site_ID = input[[paste0("siteId_", ID)]],
  Site_Name = input[[paste0("siteName_", ID)]],
  Resource = input[[paste0("resource_", ID)]],
  Date_Collected = input[[paste0("dateCol_", ID)]],
  Latitude = input[[paste0("latitude_", ID)]],
  Longitude = input[[paste0("longitude_", ID)]],
  Crew_Leader = input[[paste0("crewlead_", ID)]],
  Crew_Members = paste0(input[[paste0("crewmember1_", ID)]], "; ",
                        input[[paste0("crewmember2_", ID)]], "; ",
                        input[[paste0("crewmember3_", ID)]], "; ",
                        input[[paste0("crewmember4_", ID)]], "; ",
                        input[[paste0("crewmember5_", ID)]], "; ",
                        input[[paste0("crewmember6_", ID)]]),
  Gen_Comments = input[[paste0("generalComments_", ID)]],
  Directions = input[[paste0("directions_", ID)]]
)
