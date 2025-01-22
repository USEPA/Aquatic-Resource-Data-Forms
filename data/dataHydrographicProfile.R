N <- vals$count # number of loops

xy <- vector("list", N) # create an empty list into which values are to be filled

# run the loop N times and on each loop...
for (i in 1:N) {
  # generate a data.frame with 4 columns, and add a random number into each one
  # random number depends on the mean specified
  xy[[i]] <- data.frame(Site_ID = paste(input$tabs),
                        Station_Depth = input[[paste0("stationdepth_", input$tabs)]],
                        Secchi_Depth = input[[paste0("secchidepth_", input$tabs)]],
                        CleartoBottom = input[[paste0("cleartobottom_", input$tabs)]],
                        Line = i,
                        Upcast = input[[paste0("ProfileUpcast_",i,"_", input$tabs)]],
                        Depth = input[[paste0("ProfileDepth_",i,"_", input$tabs)]],
                        Temperature = input[[paste0("ProfileTemperature_",i,"_", input$tabs)]],
                        pH = input[[paste0("ProfilePH_",i,"_", input$tabs)]],
                        DO = input[[paste0("ProfileDO_",i,"_", input$tabs)]],
                        Conductivity = input[[paste0("ProfileConductivity_",i,"_", input$tabs)]]
                        )
}


# result is a list of data.frames with 1 row and 4 columns

# you can bind them together into one data.frame using do.call
# rbind means they will be merged row-wise
xy <- do.call(rbind, xy)

xy






