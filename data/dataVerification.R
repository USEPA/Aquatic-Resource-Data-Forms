ID <- input[[paste0("sitechoice",gsub(paste(X, collapse = "|"), "", input$forms))]]

xy <- data.frame() 
mylist <- list()

for (x in ID) {
  mylist[[x]] <- data.frame(
    Site_ID = input[[paste0("siteId_",x)]],
    Site_Name = input[[paste0("siteName_",x)]],
    Resource = input[[paste0("resource_",x)]],
    Date_Collected = input[[paste0("dateCol_",x)]],
    Latitude = input[[paste0("latitude_",x)]],
    Longitude = input[[paste0("longitude_",x)]],
    Crew_Leader = input[[paste0("crewlead_",x)]],
    Crew_Members = paste0(input[[paste0("crewmember1_",x)]], "; ",
                          input[[paste0("crewmember2_",x)]], "; ",
                          input[[paste0("crewmember3_",x)]], "; ",
                          input[[paste0("crewmember4_",x)]], "; ",
                          input[[paste0("crewmember5_",x)]], "; ",
                          input[[paste0("crewmember6_",x)]]),
    Gen_Comments = input[[paste0("generalComments_",x)]],
    Directions = input[[paste0("directions_",x)]]
  )
  
  xy <- do.call("rbind", mylist)
}
xy