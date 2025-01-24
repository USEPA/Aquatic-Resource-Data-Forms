N <- vals$count # number of loops

xy <- vector("list", N) # create an empty list into which values are to be filled

# run the loop N times and on each loop...
for (i in 1:N) {
  # generate a data.frame with 4 columns, and add a random number into each one
  # random number depends on the mean specified
  xy[[i]] <- data.frame(Site_ID = paste0(input$tabs),
                        Line = i,
                        Fish_Name = input[[paste0("fishname_",i,"_", input$tabs)]],
                        Hybrid = input[[paste0("hybrid_",i,"_", input$tabs)]],
                        Introduced = input[[paste0("introduced_",i,"_", input$tabs)]],
                        `Size_150mm` = input[[paste0("fishless150_",i,"_", input$tabs)]],
                        `Size_150-300mm` = input[[paste0("fish300_",i,"_", input$tabs)]],
                        `Size_301-460mm` = input[[paste0("fish460_",i,"_", input$tabs)]],
                        `Size_460mm` = input[[paste0("fishgreat460_",i,"_", input$tabs)]],
                        Vouch_Tag = input[[paste0("vouchertag_",i,"_", input$tabs)]],
                        Vouch_Photo = input[[paste0("vouchertag_",i,"_", input$tabs)]],
                        Vouch_Retain = input[[paste0("voucherretained_",i,"_", input$tabs)]]
  )
}


# result is a list of data.frames

# you can bind them together into one data.frame using do.call
# rbind means they will be merged row-wise
xy <- do.call(rbind, xy)

xy[!(xy$Fish_Name=="" & xy$`Size_150mm`=="" & xy$`Size_150-300mm`=="" & xy$`Size_301-460mm`=="" & xy$`Size_460mm`==""), ]




