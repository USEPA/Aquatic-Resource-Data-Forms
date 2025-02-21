ID <- gsub(paste(X, collapse = "|"), "", input$forms)

primary <- data.frame(
  Site_ID = input[[paste0("siteId_", ID)]],
  Site_Name = input[[paste0("siteName_", ID)]],
  Resource = input[[paste0("resource_", ID)]],
  Sample_Time = input[[paste0("HydrologyTime", ID)]],
  Curr_Weather = input[[paste0("HydrologyWeather", ID)]],
  Past_Weather = input[[paste0("HydrologyPastWeather", ID)]],
  Outflows = input[[paste0("Outflows", ID)]],
  Outflow_Desc = input[[paste0("OutflowsDescribe", ID)]],
  Tidal_Stage = input[[paste0("TidalStage",ID)]]
)


# Hydrology Sources
xy <- vector("list", length(watersource))
secondary <- do.call("cbind", lapply(watersource, function(i) {
  xy[[i]] <- data.frame(
    Present = input[[paste0(i,"Present",ID)]],
    Rank = ifelse(is.null((input[[paste0(i,"Rank",ID)]])),"",input[[paste0(i,"Rank",ID)]])
  )
})
)

source_names <- c()
for(i in watersource){
  source_names[[i]] <- c(paste0(i,"_Present"),
                         paste0(i,"_Rank"))
}
names(secondary) <- unlist(source_names, use.names=FALSE)

#Hydrology Indicators
indicators <- c("A1","A2","A3","B1","B2","B3","B4","B5","B6","B8","B9","B10","B11","B12","B13","B14","B15","B16",
                "C1","C2","C3","C4","C5","C6","C7","C8","C10","D1","D2","D3","D4","D6","D7","D8")
# Hydrology Indicators
y <- vector("list", length(indicators))
tertiary <- do.call("cbind", lapply(indicators, function(i) {
  y[[i]] <- data.frame(
    present = input[[paste0(i,ID)]]
  )
})
)
names(tertiary) <- indicators

# #Hydrology Comments
other <- data.frame(Other_Source = input[[paste0("OtherSourceComment",ID)]])
comments <- data.frame(Hydrology_Comments = input[[paste0("HydrologyComments", ID)]])

cbind(primary, secondary, other, tertiary, comments)

