ID <- input[[paste0("sitechoice",gsub(paste(X, collapse = "|"), "", input$forms))]]

xy <- data.frame() 
mylist <- list()
for (x in ID) {
  N <- ifelse(is.null(input[[paste0("AddWaterChemistry",x)]][1]), 1, input[[paste0("AddWaterChemistry",x)]][1] + 1)
  
  for (i in 1:N){ 
    mylist[[i]] <- data.frame(Site_ID = x,
                              Location = input[[paste0("LocationChem_",i,"_",x)]],
                              Depth = input[[paste0("DepthChem_",i,"_",x)]],
                              Depth_units = input[[paste0("DepthUnits_",i,"_",x)]],
                              DO = input[[paste0("DOChem_",i,"_",x)]],
                              DO_units = input[[paste0("DOUnits_",i,"_",x)]],
                              pH = input[[paste0("pHChem_",i,"_",x)]],
                              Conductivity = input[[paste0("ConductivityChem_",i,"_",x)]],
                              Cond_Units = input[[paste0("ConductivityUnits_",i,"_",x)]],
                              Temperature = input[[paste0("TemperatureChem_",i,"_",x)]],
                              Temp_Units = input[[paste0("TemperatureUnits_",i,"_",x)]],
                              Comments = ifelse(is.null(input[[paste0("WaterChemistry",x,"_Comment_",i)]]),"",input[[paste0("WaterChemistry",x,"_Comment_",i)]])
    )
    newlist <- do.call("rbind", mylist)
  }
  xy <- rbind(xy, newlist)
}

xy[!(xy$Location=="" & xy$Depth=="" & xy$DO=="" & xy$pH=="" & xy$Conductivity=="" & xy$Temperature=="" & xy$Comments==""), ]



