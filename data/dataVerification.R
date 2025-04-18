ID <- input[[paste0("sitechoice",gsub(paste(X, collapse = "|"), "", input$forms))]]

xy <- data.frame() 
mylist <- list()

for (x in ID) {
  mylist[[x]] <- data.frame(
    Site_ID = input[[paste0("siteId",x)]],
    Site_Name = input[[paste0("siteName",x)]],
    Resource = input[[paste0("resource",x)]],
    Date_Collected = input[[paste0("dateCol",x)]],
    Latitude = input[[paste0("latitude",x)]],
    Longitude = input[[paste0("longitude",x)]],
    Crew_Leader = input[[paste0("crewlead",x)]],
    Crew_Members = paste0(input[[paste0("crewmember1",x)]], "; ",
                          input[[paste0("crewmember2",x)]], "; ",
                          input[[paste0("crewmember3",x)]], "; ",
                          input[[paste0("crewmember4",x)]], "; ",
                          input[[paste0("crewmember5",x)]], "; ",
                          input[[paste0("crewmember6",x)]]),
    Gen_Comments = input[[paste0("generalComments",x)]],
    Directions = input[[paste0("directions",x)]]
  )
  
  xy <- do.call("rbind", mylist)
}
xy