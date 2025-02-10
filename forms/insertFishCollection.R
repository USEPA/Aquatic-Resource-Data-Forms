insertFishCollection <- function(ID,n) {
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
      p(align = "center", strong(paste0(n))),
      f7Text(
        inputId = paste0("fishname_",n,"_",ID),
        label = NULL,
        placeholder = "XXXX",
        style = list(outline = TRUE)
      ),
      div(style = "text-align: center;", 
          f7Checkbox(
            inputId = paste0("hybrid_",n,"_",ID),
            label = NULL,
            value = FALSE
          )),
      div(style = "text-align: center;", 
          f7Checkbox(
            inputId = paste0("introduced_",n,"_",ID),
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
      f7Stepper(
        inputId = paste0("fishless150_",n,"_",ID),
        label = NULL,
        min = 0,
        max = 10000,
        value = 0,
        size = "small",
        wraps = FALSE,
        autorepeat = TRUE,
        rounded = FALSE,
        raised = TRUE,
        manual = FALSE
      ),
      f7Stepper(
        inputId = paste0("fish300_",n,"_",ID),
        label = NULL,
        min = 0,
        max = 10000,
        value = 0,
        size = "small",
        wraps = FALSE,
        autorepeat = TRUE,
        rounded = FALSE,
        raised = TRUE,
        manual = FALSE
      ),
      f7Stepper(
        inputId = paste0("fish460_",n,"_",ID),
        label = NULL,
        min = 0,
        max = 10000,
        value = 0,
        size = "small",
        wraps = FALSE,
        autorepeat = TRUE,
        rounded = FALSE,
        raised = TRUE,
        manual = FALSE
      ),
      f7Stepper(
        inputId = paste0("fishgreat460_",n,"_",ID),
        label = NULL,
        min = 0,
        max = 10000,
        value = 0,
        size = "small",
        wraps = FALSE,
        autorepeat = TRUE,
        rounded = FALSE,
        raised = TRUE,
        manual = FALSE
      )),
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
        inputId = paste0("vouchertag_",n,"_",ID),
        label = NULL,
        placeholder = "XX",
        style = list(outline = TRUE)
      ),
      div(style = "text-align: center;", 
          f7Checkbox(
            inputId = paste0("voucherphoto_",n,"_",ID),
            label = NULL,
            value = FALSE
          )),
      f7Text(
        inputId = paste0("voucherretained_",n,"_",ID),
        label = NULL,
        placeholder = "XX",
        style = list(outline = TRUE)
      ),
      #Notice difference in Button ID 
      f7Button(paste0("fishbutton_",ID,"_",n), label=NULL, fill=FALSE,
               icon = f7Icon("text_bubble_fill",
                             style = "font-size: 45px;"))
    )
  )
}
