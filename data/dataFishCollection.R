ID <- input[[paste0("sitechoice",gsub(paste(X, collapse = "|"), "", input$forms))]]

mylist <- list()
for (x in ID) {
  N <- ifelse(is.null(input[[paste0("AddFishCollection",x)]][1]), 15, input[[paste0("AddFishCollection",x)]][1] + 15)
  
  xy <- data.frame() 
  for (i in 1:N){ 
      mylist[[i]] <- data.frame(Site_ID = paste0(ID),
                                Fish_Lead = input[[paste0("fishlead_",x)]],
                                Line = i,
                                Fish_Name = input[[paste0("fishname_",i,"_",x)]],
                                Hybrid = input[[paste0("hybrid_",i,"_",x)]],
                                Introduced = input[[paste0("introduced_",i,"_",x)]],
                                Size_150mm = input[[paste0("FishCollection",x,"fishless150_",i)]],
                                Size_150_300mm = input[[paste0("FishCollection",x,"fish300_",i)]],
                                Size_301_460mm = input[[paste0("FishCollection",x,"fish460_",i)]],
                                Size_460mm = input[[paste0("FishCollection",x,"fishgreat460_",i)]],
                                Total_Count = ifelse(!(paste0("FishCollection",x) %in% names(fishval$val)),0,fishval$val[[paste0("FishCollection",x)]]),
                                Vouch_Tag = input[[paste0("vouchertag_",i,"_",x)]],
                                Vouch_Photo = input[[paste0("voucherphoto_",i,"_",x)]],
                                Vouch_Retain = input[[paste0("voucherretained_",i,"_",x)]],
                                Comments = ifelse(is.null(input[[paste0("FishCollection",x,"_Comment_",i)]]),"",input[[paste0("FishCollection",x,"_Comment_",i)]])
      )
      xy <- do.call("rbind", mylist)
  }
}
 
                       
xy <- xy[order(xy$Site_ID, xy$Line), ]
xy[!(xy$Fish_Name=="" & xy$Hybrid==FALSE & xy$Introduced==FALSE & xy$Size_150mm== 0 & xy$Size_150_300mm== 0 & xy$Size_301_460mm==0 & xy$Size_460mm==0 & xy$Vouch_Tag=="" & xy$Vouch_Photo==FALSE & xy$Vouch_Retain=="" & xy$Comments==""), ]




