ID <- input[[paste0("sitechoice",gsub(paste(X, collapse = "|"), "", input$forms))]]

xy <- data.frame() 
mylist <- list()
for (x in ID) {
  N <- ifelse(is.null(input[[paste0("AddWaterChemistry",x)]][1]), 1, input[[paste0("AddWaterChemistry",x)]][1] + 1)
  
  for (i in 1:N){ 
    mylist[[i]] <- data.frame(Site_ID = x,
                              Location = input[[paste0("LocationChem",i,x)]],
                              Depth = input[[paste0("DepthChem",i,x)]],
                              Depth_Units = input[[paste0("DepthUnits",i,x)]],
                              DO = input[[paste0("DOChem",i,x)]],
                              DO_units = input[[paste0("DOUnits",i,x)]],
                              pH = input[[paste0("pHChem",i,x)]],
                              Conductivity = input[[paste0("ConductivityChem",i,x)]],
                              Cond_Units = input[[paste0("ConductivityUnits",i,x)]],
                              Temperature = input[[paste0("TemperatureChem",i,x)]],
                              Temp_Units = input[[paste0("TemperatureUnits",i,x)]],
                              Comments = ifelse(is.null(input[[paste0("WaterChemistry",x,"Comment",i)]]),"",input[[paste0("WaterChemistry",x,"Comment",i)]])
    )
    newlist <- do.call("rbind", mylist)
  }
  xy <- rbind(xy, newlist)
}

xy <- unique(xy)

xy[!(xy$Location=="" & xy$Depth=="" & xy$DO=="" & xy$pH=="" & xy$Conductivity=="" & xy$Temperature=="" & xy$Comments==""), ]



