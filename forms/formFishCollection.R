formFishCollection <- function(ID) {
  f7Tab(
    title = div(id=paste0("fishtitle",ID), HTML("<center>Fish</br>Collection</center>")),
    tabName = paste0("FishCollection",ID),
    icon = div(id=paste0("fishbadge",ID), 
      icon("fish-fins", style="font-size: 2rem"), 
                      f7Badge(0, color="green")),
    f7Segment(
      f7Button(paste0("SaveFishCollection",ID), "Save Data", color = "blue"),
      f7Button(paste0("LoadFishCollection",ID), "Load Data", color = "orange")
    ),
    f7BlockTitle(title = "Fish Gear", size="large") %>% f7Align(side = "center"),
    f7Card(
      outline = TRUE,
      raised = TRUE,
      f7Grid(
        cols = 2,
        p(align = "center", strong("Primary Fishing Gear")),
        p(align = "center", strong("Fishing Reach Length (m)")),
      ),
      f7Grid(
        cols = 2,
        f7Text(
          inputId = paste0("fishgear",ID),
          label = NULL,
          style = list(outline = TRUE)
        ),
        f7Text(
          inputId = paste0("fishingreach",ID),
          label = NULL,
          style = list(outline = TRUE)
        ),
      ),
      p(align = "center", strong("General Fishing Comments")),
      f7TextArea(
        inputId = paste0("fishgeneralcomments", ID),
        label = NULL,
        style = list(outline = TRUE)
      )),
    f7BlockTitle(title = "Fish Collection", size="large") %>% f7Align(side = "center"),
    lapply(1:15, function(i) {
    f7Card(
      outline = TRUE,
      raised = TRUE,
      f7Grid(
        cols = 4,
        p(align = "center", strong("Line")),
        p(align = "center", strong("Fish Name")),
        p(align = "center", strong("Hybrid?")),
        p(align = "center", strong("Introduced?"))
      ),
      f7Grid(
        cols = 4,
        p(align = "center", strong(paste0(i))),
      f7Text(
        inputId = paste0("fishname",i,ID),
        label = NULL,
        placeholder = "XXXX",
        style = list(outline = TRUE)
      ),
      div(style = "text-align: center;", 
      f7Checkbox(
        inputId = paste0("hybrid",i,ID),
        label = NULL,
        value = FALSE
      )),
      div(style = "text-align: center;", 
      f7Checkbox(
        inputId = paste0("introduced",i,ID),
        label = NULL,
        value = FALSE
      ))),
      f7Grid(
        cols = 1,
        p(align = "center", strong("TOTAL LENGTH TALLY/COUNTS"))
      ),
      f7Grid(
        cols = 4,
        p(align = "center", strong("<150mm")),
        p(align = "center", strong("150-300mm")),
        p(align = "center", strong("301-460mm")),
        p(align = "center", strong(">460mm"))
      ),
      f7Grid(
        cols = 4,
        div(style = "display: flex; justify-content: center;",
      f7Stepper(
        inputId = paste0("FishCollection",ID,"fishless150",i),
        label = NULL,
        min = 0,
        max = 10000,
        value = 0,
        size = "small",
        wraps = FALSE,
        color = "black",
        autorepeat = TRUE,
        rounded = FALSE,
        raised = TRUE,
        manual = FALSE
      )),
      div(style = "display: flex; justify-content: center;",
      f7Stepper(
        inputId = paste0("FishCollection",ID,"fish300",i),
        label = NULL,
        min = 0,
        max = 10000,
        value = 0,
        size = "small",
        wraps = FALSE,
        color = "black",
        autorepeat = TRUE,
        rounded = FALSE,
        raised = TRUE,
        manual = FALSE
      )),
      div(style = "display: flex; justify-content: center;",
      f7Stepper(
        inputId = paste0("FishCollection",ID,"fish460",i),
        label = NULL,
        min = 0,
        max = 10000,
        value = 0,
        size = "small",
        wraps = FALSE,
        color = "black",
        autorepeat = TRUE,
        rounded = FALSE,
        raised = TRUE,
        manual = FALSE
      )),
      div(style = "display: flex; justify-content: center;",
      f7Stepper(
        inputId = paste0("FishCollection",ID,"fishgreat460",i),
        label = NULL,
        min = 0,
        max = 10000,
        value = 0,
        size = "small",
        wraps = FALSE,
        color = "black",
        autorepeat = TRUE,
        rounded = FALSE,
        raised = TRUE,
        manual = FALSE
      ))),
      f7Grid(
        cols = 4,
        p(align = "center", strong("Voucher Tag #")),
        p(align = "center", strong("Voucher Photo")),
        p(align = "center", strong("Vouchers Retained")),
        p(align = "center", strong(""))
      ),
      f7Grid(
        cols = 4,
      f7Text(
        inputId = paste0("vouchertag",i,ID),
        label = NULL,
        placeholder = "XX",
        style = list(outline = TRUE)
      ),
      div(style = "text-align: center;", 
          f7Checkbox(
            inputId = paste0("voucherphoto",i,ID),
            label = NULL,
            value = FALSE
          )),
      f7Text(
        inputId = paste0("voucherretained",i,ID),
        label = NULL,
        placeholder = "XX",
        style = list(outline = TRUE)
      ),
      #Notice difference in Button ID 
      f7Button(paste0("FishCollection",ID,"_",i), label=NULL, fill=FALSE,
               icon = f7Icon("text_bubble_fill",
                             style = "font-size: 45px;")),
      f7Sheet(
        id = paste0("FishCollection",ID,i),
        orientation = "bottom",
        closeByOutsideClick = TRUE,
        swipeHandler = FALSE,
        options = list(breakpoints = c(0.8)),
        p(align = "left", strong(paste0("Comment ",i))),
        f7Block(
          f7TextArea(inputId = paste0("FishCollection",ID,"Comment",i),
                     value="",
                     label = NULL,
                     style = list(outline = TRUE))
        )
        )
      )
    )
    }),
    f7Button(paste0("AddFishCollection",ID), "Add Line", color = "blue")
  )}
     