ID <- input[[paste0("sitechoice",gsub(paste(X, collapse = "|"), "", input$forms))]]

xy <- data.frame() 
mylist <- list()
for (x in ID) {
  N <- ifelse(is.null(input[[paste0("AddFishCollection",x)]][1]), 15, input[[paste0("AddFishCollection",x)]][1] + 15)
  
  for (i in 1:N){ 
      mylist[[i]] <- data.frame(Site_ID = x,
                                Fish_Lead = ifelse(is.null(input[[paste0("fishlead",x)]]),"",input[[paste0("fishlead",x)]]),
                                Fish_Gear = ifelse(is.null(input[[paste0("fishgear",x)]]),"",input[[paste0("fishgear",x)]]),
                                Fish_Reach = ifelse(is.null(input[[paste0("fishingreach",x)]]),"",input[[paste0("fishingreach",x)]]),
                                Fish_Comments = ifelse(is.null(input[[paste0("fishgeneralcomments",x)]]),"",input[[paste0("fishgeneralcomments",x)]]),
                                Line = i,
                                Fish_Name = ifelse(is.null(input[[paste0("fishname",i,x)]]),"",input[[paste0("fishname",i,x)]]),
                                Hybrid = ifelse(is.null(input[[paste0("hybrid",i,x)]]),"",input[[paste0("hybrid",i,x)]]),
                                Introduced = ifelse(is.null(input[[paste0("introduced",i,x)]]),"",input[[paste0("introduced",i,x)]]),
                                Size_150mm = ifelse(is.null(input[[paste0("FishCollection",x,"fishless150",i)]]),"",input[[paste0("FishCollection",x,"fishless150",i)]]),
                                Size_150_300mm = ifelse(is.null(input[[paste0("FishCollection",x,"fish300",i)]]),"",input[[paste0("FishCollection",x,"fish300",i)]]),
                                Size_301_460mm = ifelse(is.null(input[[paste0("FishCollection",x,"fish460",i)]]),"",input[[paste0("FishCollection",x,"fish460",i)]]),
                                Size_460mm = ifelse(is.null(input[[paste0("FishCollection",x,"fishgreat460",i)]]),"",input[[paste0("FishCollection",x,"fishgreat460",i)]]),
                                Total_Count = ifelse(!(paste0("FishCollection",x) %in% names(fishval$val)),0,fishval$val[[paste0("FishCollection",x)]]),
                                Vouch_Tag = ifelse(is.null(input[[paste0("vouchertag",i,x)]]),"",input[[paste0("vouchertag",i,x)]]),
                                Vouch_Photo = ifelse(is.null(input[[paste0("voucherphoto",i,x)]]),"",input[[paste0("voucherphoto",i,x)]]),
                                Vouch_Retain = ifelse(is.null(input[[paste0("voucherretained",i,x)]]),"",input[[paste0("voucherretained",i,x)]]),
                                Comments = ifelse(is.null(input[[paste0("FishCollection",x,"Comment",i)]]),"",input[[paste0("FishCollection",x,"Comment",i)]])
      )
      newlist <- do.call("rbind", mylist)
  }
  xy <- rbind(xy, newlist)
}
                       
xy <- xy[order(xy$Site_ID, xy$Line), ]
xy <- unique(xy)
xy[!(xy$Fish_Name=="" & xy$Hybrid==FALSE|xy$Hybrid=="" & xy$Introduced==FALSE|xy$Introduced=="" & xy$Size_150mm== 0 & xy$Size_150_300mm== 0 & xy$Size_301_460mm==0 & xy$Size_460mm==0 & xy$Vouch_Tag=="" & xy$Vouch_Photo==FALSE|xy$Vouch_Photo=="" & xy$Vouch_Retain=="" & xy$Comments==""), ]




