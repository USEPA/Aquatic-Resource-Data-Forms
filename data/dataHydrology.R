ID <- input[[paste0("sitechoice",gsub(paste(X, collapse = "|"), "", input$forms))]]


mylist <- list()
for (x in ID) {
  mylist[[x]] <- data.frame(
    #We use is.null because some forms are not created depending on resource type.
    Site_ID = x,
    Site_Name = ifelse(is.null(input[[paste0("siteName_",x)]]),"",input[[paste0("siteName_",x)]]),
    Resource = ifelse(is.null(input[[paste0("resource_",x)]]),"",input[[paste0("resource_",x)]]),
    Sample_Time = ifelse(is.null(input[[paste0("HydrologyTime",x)]]),"",input[[paste0("HydrologyTime",x)]]),
    Curr_Weather = ifelse(is.null(input[[paste0("HydrologyWeather",x)]]),"",input[[paste0("HydrologyWeather",x)]]),
    Past_Weather = ifelse(is.null(input[[paste0("HydrologyPastWeather",x)]]),"",input[[paste0("HydrologyPastWeather",x)]]),
    Outflows = ifelse(is.null(input[[paste0("Outflows",x)]]),"",input[[paste0("Outflows",x)]]),
    Outflow_Desc = ifelse(is.null(input[[paste0("OutflowsDescribe",x)]]),"",input[[paste0("OutflowsDescribe",x)]]),
    Tidal_Stage = ifelse(is.null(input[[paste0("TidalStage",x)]]),"",input[[paste0("TidalStage",x)]])
    )
  
  primary <- do.call("rbind", mylist)
}

# Hydrology Sources
secondary <- data.frame() 
mylist <- list()
for (x in ID) {
  for(i in watersource) {
  mylist[[i]] <- data.frame(
    Present = ifelse(is.null(input[[paste0(i,"Present",x)]]),"",input[[paste0(i,"Present",x)]]),
    Rank = ifelse(is.null((input[[paste0(i,"Rank",x)]])),"",input[[paste0(i,"Rank",x)]])
  )
  newlist <- do.call("cbind", mylist)
  }
  secondary <- rbind(secondary, newlist)
}

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
mylist <- list()
tertiary <- data.frame() 
for (x in ID) {
  for(i in indicators) {
    mylist[[i]] <- data.frame(
      present = ifelse(is.null(input[[paste0(i,x)]]),"",input[[paste0(i,x)]])
    )
    newlist <- do.call("cbind", mylist)
  }
  tertiary <- rbind(tertiary, newlist)
}
 
names(tertiary) <- indicators

# #Hydrology Comments


xy <- list() 
other <- do.call("rbind", lapply(ID, function(x) {
  xy[[x]] <- data.frame(Other_Source = input[[paste0("OtherSourceComment",x)]])
})
)

xy <- list() 
comments <- do.call("rbind", lapply(ID, function(x) {
  xy[[x]] <- data.frame(Hydrology_Comments = input[[paste0("HydrologyComments",x)]])
})
)

cbind(primary, secondary, other, tertiary, comments)

