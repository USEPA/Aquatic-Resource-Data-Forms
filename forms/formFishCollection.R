formFishCollection <- function(ID) {
  f7Tab(
    title = "Fish Collection",
    tabName = "FishCollection",
    icon = f7Icon("flowchart"),
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
      f7Stepper(
        inputId = paste0("fishless150_",i,"_",ID),
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
        inputId = paste0("fish300_",i,"_",ID),
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
        inputId = paste0("fish460_",i,"_",ID),
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
        inputId = paste0("fishgreat460_",i,"_",ID),
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
        inputId = paste0("vouchertag_",i,"_",ID),
        label = NULL,
        placeholder = "XX",
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
        style = list(outline = TRUE)
      )
     )
    )
    }),
    
    conditionalPanel(
      condition = "input.AddFish >= 1",
    lapply(16:20, function(i) {
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
              f7Stepper(
                inputId = paste0("fishless150_",i,"_",ID),
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
                inputId = paste0("fish300_",i,"_",ID),
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
                inputId = paste0("fish460_",i,"_",ID),
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
                inputId = paste0("fishgreat460_",i,"_",ID),
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
            inputId = paste0("vouchertag_",i,"_",ID),
            label = NULL,
            placeholder = "XX",
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
            style = list(outline = TRUE)
          )
        )
      )
    })
    ),
    
    conditionalPanel(
      condition = "input.AddFish >= 2",
      lapply(21:25, function(i) {
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
                f7Stepper(
                  inputId = paste0("fishless150_",i,"_",ID),
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
                  inputId = paste0("fish300_",i,"_",ID),
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
                  inputId = paste0("fish460_",i,"_",ID),
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
                  inputId = paste0("fishgreat460_",i,"_",ID),
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
              inputId = paste0("vouchertag_",i,"_",ID),
              label = NULL,
              placeholder = "XX",
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
              style = list(outline = TRUE)
            )
          )
        )
      })
    ),
    
    conditionalPanel(
      condition = "input.AddFish >= 3",
      lapply(26:30, function(i) {
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
                f7Stepper(
                  inputId = paste0("fishless150_",i,"_",ID),
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
                  inputId = paste0("fish300_",i,"_",ID),
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
                  inputId = paste0("fish460_",i,"_",ID),
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
                  inputId = paste0("fishgreat460_",i,"_",ID),
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
              inputId = paste0("vouchertag_",i,"_",ID),
              label = NULL,
              placeholder = "XX",
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
              style = list(outline = TRUE)
            )
          )
        )
      })
    ),
    
    conditionalPanel(
      condition = "input.AddFish >= 4",
      lapply(31:35, function(i) {
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
                f7Stepper(
                  inputId = paste0("fishless150_",i,"_",ID),
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
                  inputId = paste0("fish300_",i,"_",ID),
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
                  inputId = paste0("fish460_",i,"_",ID),
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
                  inputId = paste0("fishgreat460_",i,"_",ID),
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
              inputId = paste0("vouchertag_",i,"_",ID),
              label = NULL,
              placeholder = "XX",
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
              style = list(outline = TRUE)
            )
          )
        )
      })
    ),
    
    conditionalPanel(
      condition = "input.AddFish >= 5",
      lapply(36:40, function(i) {
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
                f7Stepper(
                  inputId = paste0("fishless150_",i,"_",ID),
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
                  inputId = paste0("fish300_",i,"_",ID),
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
                  inputId = paste0("fish460_",i,"_",ID),
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
                  inputId = paste0("fishgreat460_",i,"_",ID),
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
              inputId = paste0("vouchertag_",i,"_",ID),
              label = NULL,
              placeholder = "XX",
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
              style = list(outline = TRUE)
            )
          )
        )
      })
    ),
    
    
    conditionalPanel(
      condition = "input.AddFish >= 6",
      lapply(41:45, function(i) {
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
                f7Stepper(
                  inputId = paste0("fishless150_",i,"_",ID),
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
                  inputId = paste0("fish300_",i,"_",ID),
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
                  inputId = paste0("fish460_",i,"_",ID),
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
                  inputId = paste0("fishgreat460_",i,"_",ID),
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
              inputId = paste0("vouchertag_",i,"_",ID),
              label = NULL,
              placeholder = "XX",
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
              style = list(outline = TRUE)
            )
          )
        )
      })
    ),
    
    conditionalPanel(
      condition = "input.AddFish >= 7",
      lapply(46:50, function(i) {
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
                f7Stepper(
                  inputId = paste0("fishless150_",i,"_",ID),
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
                  inputId = paste0("fish300_",i,"_",ID),
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
                  inputId = paste0("fish460_",i,"_",ID),
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
                  inputId = paste0("fishgreat460_",i,"_",ID),
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
              inputId = paste0("vouchertag_",i,"_",ID),
              label = NULL,
              placeholder = "XX",
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
              style = list(outline = TRUE)
            )
          )
        )
      })
    ),
    
    f7Button("AddFish", "Add 5 Lines", color = "blue")
  )}