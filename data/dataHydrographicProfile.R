ID <- trimws(sub(paste(X, collapse = "|"), "", input$forms))

if(is.null(input[[paste0("AddHydrographicProfile",ID)]][1])){
  N <- 15
} else {
  N <- input[[paste0("AddHydrographicProfile",ID)]][1] + 15
}

xy <- vector("list", N) # create an empty list into which values are to be filled

# run the loop N times and on each loop...
for (i in 1:N) {
  if(is.null(input[[paste0(input$forms,"_Comment_",i)]])){
    comment <- ""
  } else{
    comment <- input[[paste0(input$forms,"_Comment_",i)]]
  }
  
  # random number depends on the mean specified
  xy[[i]] <- data.frame(Site_ID = paste0(ID),
                        Station_Depth = input[[paste0("stationdepth_", ID)]],
                        Cable_Length = input[[paste0("cablelength_", ID)]],
                        Secchi_Depth = input[[paste0("secchidepth_", ID)]],
                        CleartoBottom = input[[paste0("cleartobottom_", ID)]],
                        Line = i,
                        Upcast = input[[paste0("ProfileUpcast_",i,"_", ID)]],
                        Depth = input[[paste0("ProfileDepth_",i,"_", ID)]],
                        Depth_Unit = input[[paste0("ProfileDepthUnit_", ID)]],
                        Temperature = input[[paste0("ProfileTemperature_",i,"_", ID)]],
                        Temperature_Unit = input[[paste0("ProfileTempUnit_", ID)]],
                        pH = input[[paste0("ProfilePH_",i,"_", ID)]],
                        DO = input[[paste0("ProfileDO_",i,"_", ID)]],
                        Temperature_Unit = input[[paste0("ProfileDOUnit_", ID)]],
                        Conductivity = input[[paste0("ProfileConductivity_",i,"_", ID)]],
                        COND_Unit = input[[paste0("ProfileCONDUnit_", ID)]],
                        Comments = comment
                        
  )
  }

# result is a list of data.frames

# you can bind them together into one data.frame using do.call
# rbind means they will be merged row-wise
xy <- do.call(rbind, xy)
xy[!(xy$Upcast==FALSE & xy$Depth=="" & xy$Temperature=="" & xy$pH=="" & xy$DO=="" & xy$Conductivity==""& xy$Comments==""), ]






