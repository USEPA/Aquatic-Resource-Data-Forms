ID <- gsub(paste(X, collapse = "|"), "", input$forms)

if(is.null(input[[paste0("AddPlantCollection",ID)]][1])){
  N <- 20
} else {
  N <- input[[paste0("AddPlantCollection",ID)]][1] + 20
}

xy <- vector("list", N) # create an empty list into which values are to be filled

# run the loop N times...
for (i in 1:N) {
  if(is.null(input[[paste0(input$forms,"_Comment_",i)]])){
    comment <- ""
  } else{
    comment <- input[[paste0(input$forms,"_Comment_",i)]]
  }
  
  # random number depends on the mean specified
  xy[[i]] <- data.frame(Site_ID = paste0(ID),
                        Botanist = input[[paste0("botanist_",ID)]],
                        Line = i,
                        Plant_Name = input[[paste0("plantname_",i,"_",ID)]],
                        Unknown = input[[paste0("unknown_",i,"_",ID)]],
                        Tree = input[[paste0("tree_",i,"_",ID)]],
                        Height_Class = input[[paste0("heightclass_",i,"_",ID)]],
                        Percent_Cover = input[[paste0("percentcover_",i,"_",ID)]],
                        Comments = comment
  )
}


# result is a list of data.frames

# you can bind them together into one data.frame using do.call
# rbind means they will be merged row-wise
xy <- do.call(rbind, xy)
xy[!(xy$Plant_Name== "" & xy$Unknown==FALSE & xy$Tree==FALSE & xy$Percent_Cover == "" & xy$Comments== ""), ]



