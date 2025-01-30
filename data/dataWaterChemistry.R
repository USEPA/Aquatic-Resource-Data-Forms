x <- c("Verification","WaterChemistry","FishCollection","HydrographicProfile")
ID <- trimws(sub(paste(x, collapse = "|"), "", input$forms))

if(is.null(input[[paste0("AddWaterChemistry",ID)]][1])){
  N <- 1
} else {
  N <- input[[paste0("AddWaterChemistry",ID)]][1] + 1
}

xy <- vector("list", N) # create an empty list into which values are to be filled

# run the loop N times and on each loop...
for (i in 1:N) {
  # random number depends on the mean specified
  xy[[i]] <- data.frame(Site_ID = paste0(ID),
                        Location = input[[paste0("LocationChem_",i,"_", ID)]],
                        Depth = input[[paste0("DepthChem_",i,"_", ID)]],
                        DO = input[[paste0("DOChem_",i,"_", ID)]],
                        pH = input[[paste0("pHChem_",i,"_", ID)]],
                        Conductivity = input[[paste0("ConductivityChem_",i,"_", ID)]],
                        Temperature = input[[paste0("TemperatureChem_",i,"_", ID)]]
  )
  }

# result is a list of data.frames

# you can bind them together into one data.frame using do.call
# rbind means they will be merged row-wise
xy <- do.call(rbind, xy)
xy[!(xy$Location=="" & xy$Depth=="" & xy$DO=="" & xy$pH=="" & xy$Conductivity=="" & xy$Temperature==""), ]



