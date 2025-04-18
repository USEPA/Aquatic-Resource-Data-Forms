insertPlantCollection <- function(ID,n) {
  f7Card(
    outline = TRUE,
    raised = TRUE,
    f7Grid(
      cols = 3,
      p(align = "center", strong("Line")),
      p(align = "center", strong("Plant Name")),
      p(align = "center", strong("Unknown Species?"))
    ),
    f7Grid(
      cols = 3,
      p(align = "center", strong(paste0(n))),
      f7Text(
        inputId = paste0("plantname",n,ID),
        label = NULL,
        value="",
        placeholder = "Enter New Species",
        style = list(outline = TRUE)
      ),
      div(style = "text-align: center;", 
          f7Checkbox(
            inputId = paste0("unknown",n,ID),
            label = NULL,
            value = FALSE
          ))
    ),
    f7Grid(
      cols = 3,
      p(align = "center", strong("Plot")),
      p(align = "center", strong("Height Class")),
      p(align = "center", strong("Percent Cover")),
    ),
    f7Grid(
      cols = 3,
      f7Text(
        inputId = paste0("plot",n,ID),
        label = NULL,
        value="",
        style = list(outline = TRUE)
      ),
      f7Select(
        inputId = paste0("heightclass",n,ID),
        label = NULL,
        selected = NULL,
        choices = c("Less than 0.5m",
                    "Between 0.5m and 2m",
                    "Between 2m and 5m",
                    "Between 5m and 15m",
                    "Between 15m and 30m",
                    "Greater than 30m",
                    "Liana, vine, or epiphyte"),
        style = list(outline = TRUE)),
      f7Text(
        inputId = paste0("percentcover",n,ID),
        label = NULL,
        value="",
        style = list(outline = TRUE)
      )
    ),
    f7Grid(
      cols = 3,
      p(align = "center", strong("Tree Species?")),
      p(align = "center", strong("")),
      p(align = "center", strong(""))
    ),
    f7Grid(
      cols = 3,
      div(style = "text-align: center;", 
          f7Checkbox(
            inputId = paste0("tree",n,ID),
            label = NULL,
            value = FALSE
          )),
      conditionalPanel(
        condition = paste0('input.tree',n,ID),
        f7Button(paste0("TreePlantCollection",ID,"_",n), "Enter Tree Data", color = "blue"),
        f7Sheet(
          id = paste0("TreePlantCollection",ID,n),
          orientation = "bottom",
          closeByOutsideClick = TRUE,
          swipeHandler = FALSE,
          insertTreeData(ID,n)
        )
      ),
      #Notice difference in Button ID 
      f7Button(paste0("PlantCollection",ID,"_",n), label=NULL, fill=FALSE,
               icon = f7Icon("text_bubble_fill",
                             style = "font-size: 45px;")),
      f7Sheet(
        id = paste0("PlantCollection",ID,n),
        orientation = "bottom",
        closeByOutsideClick = TRUE,
        swipeHandler = FALSE,
        options = list(breakpoints = c(0.8)),
        p(align = "left", strong(paste0("Comment ",n))),
        f7Block(
          f7TextArea(inputId = paste0("PlantCollection",ID,"Comment",n),
                     value="",
                     label = NULL,
                     style = list(outline = TRUE))
        )
      )
    )
  )
}