ID <- input[[paste0("sitechoice",gsub(paste(X, collapse = "|"), "", input$forms))]]

xy <- data.frame() 
mylist <- list()
for (x in ID) {
  N <- ifelse(is.null(input[[paste0("AddPlantCollection",x)]][1]), 20, input[[paste0("AddPlantCollection",x)]][1] + 20)
  
  for (i in 1:N){ 
    mylist[[i]] <- data.frame(Site_ID = x,
                              Botanist = ifelse(is.null(input[[paste0("botanist_",x)]]),"",input[[paste0("botanist_",x)]]),
                              Line = i,
                              Plant_Name = ifelse(is.null(input[[paste0("plantname_",i,"_",x)]]),"",input[[paste0("plantname_",i,"_",x)]]),
                              Unknown = ifelse(is.null(input[[paste0("unknown_",i,"_",x)]]),"",input[[paste0("unknown_",i,"_",x)]]),
                              Tree = ifelse(is.null(input[[paste0("tree_",i,"_",x)]]),"",input[[paste0("tree_",i,"_",x)]]),
                              Height_Class = ifelse(is.null(input[[paste0("heightclass_",i,"_",x)]]),"",input[[paste0("heightclass_",i,"_",x)]]),
                              Percent_Cover = ifelse(is.null(input[[paste0("percentcover_",i,"_",x)]]),"",input[[paste0("percentcover_",i,"_",x)]]),
                              Cover_less0.5m = ifelse(is.null(input[[paste0("treecoverless0.5_",i,"_",x)]]),"",input[[paste0("treecoverless0.5_",i,"_",x)]]),
                              Cover_0.5_2m = ifelse(is.null(input[[paste0("treecover0.5_2",i,"_",x)]]),"",input[[paste0("treecover0.5_2",i,"_",x)]]),
                              Cover_2_5m = ifelse(is.null(input[[paste0("treecover2_5",i,"_",x)]]),"",input[[paste0("treecover2_5",i,"_",x)]]),
                              Cover_5_15m = ifelse(is.null(input[[paste0("treecover5_15",i,"_",x)]]),"",input[[paste0("treecover5_15",i,"_",x)]]),
                              Cover_15_30m = ifelse(is.null(input[[paste0("treecover15_30",i,"_",x)]]),"",input[[paste0("treecover15_30",i,"_",x)]]),
                              Cover_great30m = ifelse(is.null(input[[paste0("treecovergreat30",i,"_",x)]]),"",input[[paste0("treecovergreat30",i,"_",x)]]),
                              DBHcount_5_10cm = ifelse(is.null(input[[paste0("treecount5_10",i,"_",x)]]),"",input[[paste0("treecount5_10",i,"_",x)]]),
                              DBHcount_11_25cm = ifelse(is.null(input[[paste0("treecount11_25",i,"_",x)]]),"",input[[paste0("treecount11_25",i,"_",x)]]),
                              DBHcount_26_50cm = ifelse(is.null(input[[paste0("treecount26_50",i,"_",x)]]),"",input[[paste0("treecount26_50",i,"_",x)]]),
                              DBHcount_51_75cm = ifelse(is.null(input[[paste0("treecount51_75",i,"_",x)]]),"",input[[paste0("treecount51_75",i,"_",x)]]),
                              DBHcount_76_100cm = ifelse(is.null(input[[paste0("treecount76_100",i,"_",x)]]),"",input[[paste0("treecount76_100",i,"_",x)]]),
                              DBHcount_101_200cm = ifelse(is.null(input[[paste0("treecount101_200",i,"_",x)]]),"",input[[paste0("treecount101_200",i,"_",x)]]),
                              DBHcount_great200cm = ifelse(is.null(input[[paste0("treecount200",i,"_",x)]]),"",input[[paste0("treecount200",i,"_",x)]]),
                              Comments = ifelse(is.null(input[[paste0("PlantCollection",x,"_Comment_",i)]]),"",input[[paste0("PlantCollection",x,"_Comment_",i)]])
    )
    newlist <- do.call("rbind", mylist)
  }
  xy <- rbind(xy, newlist)
}

xy <- xy[order(xy$Site_ID, xy$Line), ]
xy[!(xy$Plant_Name== "" & xy$Unknown==FALSE & xy$Tree==FALSE & xy$Percent_Cover == "" & xy$Comments== ""), ]



