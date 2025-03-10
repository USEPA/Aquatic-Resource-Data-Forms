ID <- input[[paste0("sitechoice",gsub(paste(X, collapse = "|"), "", input$forms))]]

xy <- data.frame() 
mylist <- list()
for (x in ID) {
  N <- ifelse(is.null(input[[paste0("AddHydrographicProfile",x)]][1]), 15, input[[paste0("AddHydrographicProfile",x)]][1] + 15)
  
  for (i in 1:N){ 
    mylist[[i]] <- data.frame(Site_ID = x,
                              Station_Depth = ifelse(is.null(input[[paste0("stationdepth_",x)]]),"",input[[paste0("stationdepth_",x)]]),
                              Cable_Length = ifelse(is.null(input[[paste0("cablelength_",x)]]),"",input[[paste0("cablelength_",x)]]),
                              Secchi_Depth = ifelse(is.null(input[[paste0("secchidepth_",x)]]),"",input[[paste0("secchidepth_",x)]]),
                              CleartoBottom = ifelse(is.null(input[[paste0("cleartobottom_",x)]]),"",input[[paste0("cleartobottom_",x)]]),
                              Line = i,
                              Upcast = ifelse(is.null(input[[paste0("ProfileUpcast_",i,"_",x)]]),"",input[[paste0("ProfileUpcast_",i,"_",x)]]),
                              Depth = ifelse(is.null(input[[paste0("ProfileDepth_",i,"_",x)]]),"",input[[paste0("ProfileDepth_",i,"_",x)]]),
                              Depth_Unit = ifelse(is.null(input[[paste0("ProfileDepthUnit_",x)]]),"",input[[paste0("ProfileDepthUnit_",x)]]),
                              Temperature = ifelse(is.null(input[[paste0("ProfileTemperature_",i,"_",x)]]),"",input[[paste0("ProfileTemperature_",i,"_",x)]]),
                              Temperature_Unit = ifelse(is.null(input[[paste0("ProfileTempUnit_",x)]]),"",input[[paste0("ProfileTempUnit_",x)]]),
                              pH = ifelse(is.null(input[[paste0("ProfilePH_",i,"_",x)]]),"",input[[paste0("ProfilePH_",i,"_",x)]]),
                              DO = ifelse(is.null(input[[paste0("ProfileDO_",i,"_",x)]]),"",input[[paste0("ProfileDO_",i,"_",x)]]),
                              DO_Unit = ifelse(is.null(input[[paste0("ProfileDOUnit_",x)]]),"",input[[paste0("ProfileDOUnit_",x)]]),
                              Conductivity = ifelse(is.null(input[[paste0("ProfileConductivity_",i,"_",x)]]),"",input[[paste0("ProfileConductivity_",i,"_",x)]]),
                              COND_Unit = ifelse(is.null(input[[paste0("ProfileCONDUnit_",x)]]),"",input[[paste0("ProfileCONDUnit_",x)]]),
                              Comments = ifelse(is.null(input[[paste0("HydrographicProfile",x,"_Comment_",i)]]),"",input[[paste0("HydrographicProfile",x,"_Comment_",i)]])
    )
    newlist <- do.call("rbind", mylist)
  }
  xy <- rbind(xy, newlist)
}


xy <- xy[order(xy$Site_ID, xy$Line), ]
xy[!(xy$Upcast==FALSE & xy$Depth=="" & xy$Temperature=="" & xy$pH=="" & xy$DO=="" & xy$Conductivity==""& xy$Comments==""), ]






