formFishCollection <- function(ID) {
  f7Tab(
    title = div(id=paste0("fishtitle",ID), HTML("<center>Fish</br>Collection</center>")),
    tabName = paste0("FishCollection",ID),
    icon = div(id=paste0("fishbadge",ID), 
      icon("fish-fins", style="font-size: 2rem"), 
                      f7Badge(0, color="green")),
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
          inputId = paste0("FishGear_",ID),
          label = NULL,
          placeholder = "",
          value="",
          style = list(outline = TRUE)
        ),
        f7Text(
          inputId = paste0("FishLength_",ID),
          label = NULL,
          placeholder = "",
          value="",
          style = list(outline = TRUE)
        ),
      ),
      p(align = "center", strong("General Fishing Comments")),
      f7TextArea(
        inputId = paste0("FishGeneralComments_", ID),
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
        inputId = paste0("fishname_",i,"_",ID),
        label = NULL,
        placeholder = "XXXX",
        value="",
        style = list(outline = TRUE)
      ),
      div(style = "text-align: center;", 
      f7Checkbox(
        inputId = paste0("hybrid_",i,"_",ID),
        label = NULL,
        value = FALSE
      )),
      div(style = "text-align: center;", 
      f7Checkbox(
        inputId = paste0("introduced_",i,"_",ID),
        label = NULL,
        value = FALSE
      ))),
      f7Grid(
        cols = 1,
        p(align = "center", strong("TALLY/COUNTS"))
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
        inputId = paste0("FishCollection",ID,"fishless150_",i),
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
        inputId = paste0("FishCollection",ID,"fish300_",i),
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
        inputId = paste0("FishCollection",ID,"fish460_",i),
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
        inputId = paste0("FishCollection",ID,"fishgreat460_",i),
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
        inputId = paste0("vouchertag_",i,"_",ID),
        label = NULL,
        placeholder = "XX",
        value="",
        style = list(outline = TRUE)
      ),
      div(style = "text-align: center;", 
          f7Checkbox(
            inputId = paste0("voucherphoto_",i,"_",ID),
            label = NULL,
            value = FALSE
          )),
      f7Text(
        inputId = paste0("voucherretained_",i,"_",ID),
        label = NULL,
        placeholder = "XX",
        value="",
        style = list(outline = TRUE)
      ),
      #Notice difference in Button ID 
      f7Button(paste0("FishCollection",ID,"_",i), label=NULL, fill=FALSE,
               icon = f7Icon("text_bubble_fill",
                             style = "font-size: 45px;"))
      )
    )
    }),
    f7Button(paste0("AddFishCollection",ID), "Add Line", color = "blue")
  )}
     