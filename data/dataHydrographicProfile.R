ID <- input[[paste0("sitechoice",gsub(paste(X, collapse = "|"), "", input$forms))]]

xy <- data.frame() 
mylist <- list()
for (x in ID) {
  N <- ifelse(is.null(input[[paste0("AddHydrographicProfile",x)]][1]), 15, input[[paste0("AddHydrographicProfile",x)]][1] + 15)
  
  for (i in 1:N){ 
    mylist[[i]] <- data.frame(Site_ID = x,
                              Station_Depth = ifelse(is.null(input[[paste0("stationdepth",x)]]),"",input[[paste0("stationdepth",x)]]),
                              Cable_Length = ifelse(is.null(input[[paste0("cablelength",x)]]),"",input[[paste0("cablelength",x)]]),
                              Secchi_Depth = ifelse(is.null(input[[paste0("secchidepth",x)]]),"",input[[paste0("secchidepth",x)]]),
                              CleartoBottom = ifelse(is.null(input[[paste0("cleartobottom",x)]]),"",input[[paste0("cleartobottom",x)]]),
                              Line = i,
                              Upcast = ifelse(is.null(input[[paste0("ProfileUpcast",i,x)]]),"",input[[paste0("ProfileUpcast",i,x)]]),
                              Depth = ifelse(is.null(input[[paste0("ProfileDepth",i,x)]]),"",input[[paste0("ProfileDepth",i,x)]]),
                              Depth_Unit = ifelse(is.null(input[[paste0("ProfileDepthUnit",x)]]),"",input[[paste0("ProfileDepthUnit",x)]]),
                              Temperature = ifelse(is.null(input[[paste0("ProfileTemperature",i,x)]]),"",input[[paste0("ProfileTemperature",i,x)]]),
                              Temperature_Unit = ifelse(is.null(input[[paste0("ProfileTempUnit",x)]]),"",input[[paste0("ProfileTempUnit",x)]]),
                              pH = ifelse(is.null(input[[paste0("ProfilePH",i,x)]]),"",input[[paste0("ProfilePH",i,x)]]),
                              DO = ifelse(is.null(input[[paste0("ProfileDO",i,x)]]),"",input[[paste0("ProfileDO",i,x)]]),
                              DO_Unit = ifelse(is.null(input[[paste0("ProfileDOUnit",x)]]),"",input[[paste0("ProfileDOUnit",x)]]),
                              Conductivity = ifelse(is.null(input[[paste0("ProfileConductivity",i,x)]]),"",input[[paste0("ProfileConductivity",i,x)]]),
                              COND_Unit = ifelse(is.null(input[[paste0("ProfileCONDUnit",x)]]),"",input[[paste0("ProfileCONDUnit",x)]]),
                              Comments = ifelse(is.null(input[[paste0("HydrographicProfile",x,"Comment",i)]]),"",input[[paste0("HydrographicProfile",x,"Comment",i)]])
    )
    newlist <- do.call("rbind", mylist)
  }
  xy <- rbind(xy, newlist)
}


xy <- xy[order(xy$Site_ID, xy$Line), ]
xy <- unique(xy)
xy[!(xy$Depth=="" & xy$Temperature=="" & xy$pH=="" & xy$DO=="" & xy$Conductivity==""& xy$Comments==""), ]






