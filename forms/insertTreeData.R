insertTreeData <- function(ID,n) {
  f7Block(
  f7BlockTitle(title = "Tree Cover by Height Class", size="large") %>% f7Align(side = "center"),
  f7Card(
    outline = TRUE,
    raised = TRUE,
    f7Grid(
      cols = 3,
      p(align = "center", strong("<0.5m")),
      p(align = "center", strong(">0.5-2m")),
      p(align = "center", strong(">2-5m"))
      ),
    f7Grid(
      cols = 3,
      f7Text(
        inputId = paste0("treecoverless0.5_",n,"_",ID),
        label = NULL,
        value="",
        style = list(outline = TRUE)
      ),
      f7Text(
        inputId = paste0("treecover0.5_2",n,"_",ID),
        label = NULL,
        value="",
        style = list(outline = TRUE)
      ),
      f7Text(
        inputId = paste0("treecover2_5",n,"_",ID),
        label = NULL,
        value="",
        style = list(outline = TRUE)
      )),
      f7Grid(
        cols = 3,
      p(align = "center", strong(">5-15m")),
      p(align = "center", strong(">15-30m")),
      p(align = "center", strong(">30m"))
    ),
    f7Grid(
      cols = 3,
      f7Text(
        inputId = paste0("treecover5_15",n,"_",ID),
        label = NULL,
        value="",
        style = list(outline = TRUE)
      ),
      f7Text(
        inputId = paste0("treecover15_30",n,"_",ID),
        label = NULL,
        value="",
        style = list(outline = TRUE)
      ),
      f7Text(
        inputId = paste0("treecovergreat30",n,"_",ID),
        label = NULL,
        value="",
        style = list(outline = TRUE)
      ))
    ),
    f7BlockTitle(title = "Tree Count by DBH", size="large") %>% f7Align(side = "center"),
    f7Card(
      outline = TRUE,
      raised = TRUE,
      f7Grid(
        cols = 2,
        p(align = "center", strong("5-10cm")),
        p(align = "center", strong("11-25cm"))
        ),
      f7Grid(
        cols = 2,
        div(style = "display: flex; justify-content: center;",
        f7Stepper(
          inputId = paste0("treecount5_10",n,"_",ID),
          label = NULL,
          min = 0,
          max = 10000,
          value = 0,
          size = "small",
          raised = TRUE
        )),
        div(style = "display: flex; justify-content: center;",
        f7Stepper(
          inputId = paste0("treecount11_25",n,"_",ID),
          label = NULL,
          min = 0,
          max = 10000,
          value = 0,
          size = "small",
          raised = TRUE
        )
      )),
      f7Grid(
        cols = 2,
        p(align = "center", strong("26-50cm")),
        p(align = "center", strong("51-75cm"))
      ),
      f7Grid(
        cols = 2,
        div(style = "display: flex; justify-content: center;",
        f7Stepper(
          inputId = paste0("treecount26_50",n,"_",ID),
          label = NULL,
          min = 0,
          max = 10000,
          value = 0,
          size = "small",
          raised = TRUE
        )),
        div(style = "display: flex; justify-content: center;",
        f7Stepper(
          inputId = paste0("treecount51_75",n,"_",ID),
          label = NULL,
          min = 0,
          max = 10000,
          value = 0,
          size = "small",
          raised = TRUE
        )
      )),
      f7Grid(
        cols = 2,
        p(align = "center", strong("76-100cm")),
        p(align = "center", strong("101-200cm")),
      ),
      f7Grid(
        cols = 2,
        div(style = "display: flex; justify-content: center;",
        f7Stepper(
          inputId = paste0("treecount76_100",n,"_",ID),
          label = NULL,
          min = 0,
          max = 10000,
          value = 0,
          size = "small",
          raised = TRUE
        )),
        div(style = "display: flex; justify-content: center;",
        f7Stepper(
          inputId = paste0("treecount101_200",n,"_",ID),
          label = NULL,
          min = 0,
          max = 10000,
          value = 0,
          size = "small",
          raised = TRUE
        )
      )),
      f7Grid(
        cols = 2,
        p(align = "center", strong(">200cm"))
      ),
      f7Grid(
        cols = 2,
        div(style = "display: flex; justify-content: center;",
        f7Stepper(
          inputId = paste0("treecount200",n,"_",ID),
          label = NULL,
          min = 0,
          max = 10000,
          value = 0,
          size = "small",
          raised = TRUE
        )))
    )
  )
  }
      