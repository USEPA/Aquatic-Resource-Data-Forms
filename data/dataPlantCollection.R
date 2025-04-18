ID <- input[[paste0("sitechoice",gsub(paste(X, collapse = "|"), "", input$forms))]]

xy <- data.frame() 
mylist <- list()
for (x in ID) {
  N <- ifelse(is.null(input[[paste0("AddPlantCollection",x)]][1]), 20, input[[paste0("AddPlantCollection",x)]][1] + 20)
  
  for (i in 1:N){ 
    mylist[[i]] <- data.frame(Site_ID = x,
                              Botanist = ifelse(is.null(input[[paste0("botanist",x)]]),"",input[[paste0("botanist",x)]]),
                              Line = i,
                              Plant_Name = ifelse(is.null(input[[paste0("plantname",i,x)]]),"",input[[paste0("plantname",i,x)]]),
                              Unknown = ifelse(is.null(input[[paste0("unknown",i,x)]]),"",input[[paste0("unknown",i,x)]]),
                              Tree = ifelse(is.null(input[[paste0("tree",i,x)]]),"",input[[paste0("tree",i,x)]]),
                              Height_Class = ifelse(is.null(input[[paste0("heightclass",i,x)]]),"",input[[paste0("heightclass",i,x)]]),
                              Percent_Cover = ifelse(is.null(input[[paste0("percentcover",i,x)]]),"",input[[paste0("percentcover",i,x)]]),
                              TreeCover_less0.5m = ifelse(is.null(input[[paste0("treecoverless0.5",i,x)]]),"",input[[paste0("treecoverless0.5",i,x)]]),
                              TreeCover_0.5_2m = ifelse(is.null(input[[paste0("treecover0.5_2",i,x)]]),"",input[[paste0("treecover0.5_2",i,x)]]),
                              TreeCover_2_5m = ifelse(is.null(input[[paste0("treecover2_5",i,x)]]),"",input[[paste0("treecover2_5",i,x)]]),
                              TreeCover_5_15m = ifelse(is.null(input[[paste0("treecover5_15",i,x)]]),"",input[[paste0("treecover5_15",i,x)]]),
                              TreeCover_15_30m = ifelse(is.null(input[[paste0("treecover15_30",i,x)]]),"",input[[paste0("treecover15_30",i,x)]]),
                              TreeCover_great30m = ifelse(is.null(input[[paste0("treecovergreat30",i,x)]]),"",input[[paste0("treecovergreat30",i,x)]]),
                              DBHcount_5_10cm = ifelse(is.null(input[[paste0("treecount5_10",i,x)]]),"",input[[paste0("treecount5_10",i,x)]]),
                              DBHcount_11_25cm = ifelse(is.null(input[[paste0("treecount11_25",i,x)]]),"",input[[paste0("treecount11_25",i,x)]]),
                              DBHcount_26_50cm = ifelse(is.null(input[[paste0("treecount26_50",i,x)]]),"",input[[paste0("treecount26_50",i,x)]]),
                              DBHcount_51_75cm = ifelse(is.null(input[[paste0("treecount51_75",i,x)]]),"",input[[paste0("treecount51_75",i,x)]]),
                              DBHcount_76_100cm = ifelse(is.null(input[[paste0("treecount76_100",i,x)]]),"",input[[paste0("treecount76_100",i,x)]]),
                              DBHcount_101_200cm = ifelse(is.null(input[[paste0("treecount101_200",i,x)]]),"",input[[paste0("treecount101_200",i,x)]]),
                              DBHcount_great200cm = ifelse(is.null(input[[paste0("treecount200",i,x)]]),"",input[[paste0("treecount200",i,x)]]),
                              Comments = ifelse(is.null(input[[paste0("PlantCollection",x,"Comment",i)]]),"",input[[paste0("PlantCollection",x,"Comment",i)]])
    )
    newlist <- do.call("rbind", mylist)
  }
  xy <- rbind(xy, newlist)
}

xy <- xy[order(xy$Site_ID, xy$Line), ]
xy <- unique(xy)
xy[!(xy$Plant_Name== "" & xy$Unknown==FALSE|xy$Unknown=="" & xy$Tree==FALSE|xy$Tree=="" & xy$Percent_Cover == "" & xy$Comments== ""), ]



