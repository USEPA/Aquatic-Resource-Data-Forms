x <- c("Verification","WaterChemistry","FishCollection","HydrographicProfile")
ID <- trimws(sub(paste(x, collapse = "|"), "", input$forms))

if(is.null(input[[paste0("AddFishCollection",ID)]][1])){
  N <- 1
} else {
  N <- input[[paste0("AddFishCollection",ID)]][1] + 15
}

xy <- vector("list", N) # create an empty list into which values are to be filled

# run the loop N times and on each loop...
for (i in 1:N) {
  
  # random number depends on the mean specified
  xy[[i]] <- data.frame(Site_ID = paste0(ID),
                        Line = i,
                        Fish_Name = input[[paste0("fishname_",i,"_", ID)]],
                        Hybrid = input[[paste0("hybrid_",i,"_", ID)]],
                        Introduced = input[[paste0("introduced_",i,"_", ID)]],
                        Size_150mm = input[[paste0("fishless150_",i,"_", ID)]],
                        Size_150_300mm = input[[paste0("fish300_",i,"_", ID)]],
                        Size_301_460mm = input[[paste0("fish460_",i,"_", ID)]],
                        Size_460mm = input[[paste0("fishgreat460_",i,"_", ID)]],
                        Vouch_Tag = input[[paste0("vouchertag_",i,"_", ID)]],
                        Vouch_Photo = input[[paste0("voucherphoto_",i,"_", ID)]],
                        Vouch_Retain = input[[paste0("voucherretained_",i,"_", ID)]],
                        Comments = input[[paste0("fishcomment_",i,"_", ID)]]
  )
}


# result is a list of data.frames

# you can bind them together into one data.frame using do.call
# rbind means they will be merged row-wise
xy <- do.call(rbind, xy)
xy[!(xy$Fish_Name=="" & xy$Hybrid==FALSE & xy$Introduced==FALSE & xy$Size_150mm== 0 & xy$Size_150_300mm== 0 & xy$Size_301_460mm==0 & xy$Size_460mm==0 & xy$Vouch_Tag=="" & xy$Vouch_Photo==FALSE & xy$Vouch_Retain==""), ]




