ID <- gsub(paste(X, collapse = "|"), "", input$forms)

if(is.null(input[[paste0("AddPlantCollection",ID)]][1])){
  N <- 20
} else {
  N <- input[[paste0("AddPlantCollection",ID)]][1] + 20
}

xy <- vector("list", N) # create an empty list into which values are to be filled

# run the loop N times...
for (i in 1:N) {
  
  # random number depends on the mean specified
  xy[[i]] <- data.frame(Site_ID = paste0(ID),
                        Botanist = input[[paste0("botanist_",ID)]],
                        Line = i,
                        Plant_Name = input[[paste0("plantname_",i,"_",ID)]],
                        Unknown = input[[paste0("unknown_",i,"_",ID)]],
                        Tree = input[[paste0("tree_",i,"_",ID)]],
                        Height_Class = input[[paste0("heightclass_",i,"_",ID)]],
                        Percent_Cover = input[[paste0("percentcover_",i,"_",ID)]],
                        Cover_less0.5m = ifelse(is.null(input[[paste0("treecoverless0.5_",i,"_",ID)]]),"",input[[paste0("treecoverless0.5_",i,"_",ID)]]),
                        Cover_0.5_2m = ifelse(is.null(input[[paste0("treecover0.5_2",i,"_",ID)]]),"",input[[paste0("treecover0.5_2",i,"_",ID)]]),
                        Cover_2_5m = ifelse(is.null(input[[paste0("treecover2_5",i,"_",ID)]]),"",input[[paste0("treecover2_5",i,"_",ID)]]),
                        Cover_5_15m = ifelse(is.null(input[[paste0("treecover5_15",i,"_",ID)]]),"",input[[paste0("treecover5_15",i,"_",ID)]]),
                        Cover_15_30m = ifelse(is.null(input[[paste0("treecover15_30",i,"_",ID)]]),"",input[[paste0("treecover15_30",i,"_",ID)]]),
                        Cover_great30m = ifelse(is.null(input[[paste0("treecovergreat30",i,"_",ID)]]),"",input[[paste0("treecovergreat30",i,"_",ID)]]),
                        DBHcount_5_10cm = ifelse(is.null(input[[paste0("treecount5_10",i,"_",ID)]]),"",input[[paste0("treecount5_10",i,"_",ID)]]),
                        DBHcount_11_25cm = ifelse(is.null(input[[paste0("treecount11_25",i,"_",ID)]]),"",input[[paste0("treecount11_25",i,"_",ID)]]),
                        DBHcount_26_50cm = ifelse(is.null(input[[paste0("treecount26_50",i,"_",ID)]]),"",input[[paste0("treecount26_50",i,"_",ID)]]),
                        DBHcount_51_75cm = ifelse(is.null(input[[paste0("treecount51_75",i,"_",ID)]]),"",input[[paste0("treecount51_75",i,"_",ID)]]),
                        DBHcount_76_100cm = ifelse(is.null(input[[paste0("treecount76_100",i,"_",ID)]]),"",input[[paste0("treecount76_100",i,"_",ID)]]),
                        DBHcount_101_200cm = ifelse(is.null(input[[paste0("treecount101_200",i,"_",ID)]]),"",input[[paste0("treecount101_200",i,"_",ID)]]),
                        DBHcount_great200cm = ifelse(is.null(input[[paste0("treecount200",i,"_",ID)]]),"",input[[paste0("treecount200",i,"_",ID)]]),
                        Comments = ifelse(is.null(input[[paste0(input$forms,"_Comment_",i)]]),"",input[[paste0(input$forms,"_Comment_",i)]])
  )
}


# result is a list of data.frames

# you can bind them together into one data.frame using do.call
# rbind means they will be merged row-wise
xy <- do.call(rbind, xy)
xy[!(xy$Plant_Name== "" & xy$Unknown==FALSE & xy$Tree==FALSE & xy$Percent_Cover == "" & xy$Comments== ""), ]



