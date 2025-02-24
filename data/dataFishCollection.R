ID <- gsub(paste(X, collapse = "|"), "", input$forms)

if(is.null(input[[paste0("AddFishCollection",ID)]][1])){
  N <- 15
} else {
  N <- input[[paste0("AddFishCollection",ID)]][1] + 15
}

xy <- vector("list", N) # create an empty list into which values are to be filled

# run the loop N times...
for (i in 1:N) {
  
  xy[[i]] <- data.frame(Site_ID = paste0(ID),
                        Fish_Lead = input[[paste0("fishlead_",ID)]],
                        Line = i,
                        Fish_Name = input[[paste0("fishname_",i,"_",ID)]],
                        Hybrid = input[[paste0("hybrid_",i,"_",ID)]],
                        Introduced = input[[paste0("introduced_",i,"_",ID)]],
                        Size_150mm = input[[paste0("FishCollection",ID,"fishless150_",i)]],
                        Size_150_300mm = input[[paste0("FishCollection",ID,"fish300_",i)]],
                        Size_301_460mm = input[[paste0("FishCollection",ID,"fish460_",i)]],
                        Size_460mm = input[[paste0("FishCollection",ID,"fishgreat460_",i)]],
                        Total_Count = ifelse(!(paste0("FishCollection",ID) %in% names(fishval$val)),0,fishval$val[[paste0("FishCollection",ID)]]),
                        Vouch_Tag = input[[paste0("vouchertag_",i,"_",ID)]],
                        Vouch_Photo = input[[paste0("voucherphoto_",i,"_",ID)]],
                        Vouch_Retain = input[[paste0("voucherretained_",i,"_",ID)]],
                        Comments = ifelse(is.null(input[[paste0(input$forms,"_Comment_",i)]]),"",input[[paste0(input$forms,"_Comment_",i)]])
  )
}


# result is a list of data.frames

# you can bind them together into one data.frame using do.call
# rbind means they will be merged row-wise
xy <- do.call(rbind, xy)
# xy[!(xy$Fish_Name=="" & xy$Hybrid==FALSE & xy$Introduced==FALSE & xy$Size_150mm== 0 & xy$Size_150_300mm== 0 & xy$Size_301_460mm==0 & xy$Size_460mm==0 & xy$Vouch_Tag=="" & xy$Vouch_Photo==FALSE & xy$Vouch_Retain=="" & xy$Comments==""), ]




