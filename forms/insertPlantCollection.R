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
        inputId = paste0("plantname_",n,"_",ID),
        label = NULL,
        value="",
        placeholder = "Enter New Species",
        style = list(outline = TRUE)
      ),
      div(style = "text-align: center;", 
          f7Checkbox(
            inputId = paste0("unknown_",n,"_",ID),
            label = NULL,
            value = FALSE
          ))
    ),
    f7Grid(
      cols = 3,
      p(align = "center", strong("Height Class")),
      p(align = "center", strong("Percent Cover")),
      p(align = "center", strong("")),
    ),
    f7Grid(
      cols = 3,
      f7Select(
        inputId = paste0("heightclass_",n,"_",ID),
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
        inputId = paste0("percentcover_",n,"_",ID),
        label = NULL,
        value="",
        style = list(outline = TRUE)
      ),
      #Notice difference in Button ID 
      f7Button(paste0("PlantCollection",ID,"_",n), label=NULL, fill=FALSE,
               icon = f7Icon("text_bubble_fill",
                             style = "font-size: 45px;"))
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
            inputId = paste0("tree_",n,"_",ID),
            label = NULL,
            value = FALSE
          )),
      conditionalPanel(
        condition = paste0('input.tree_',n,'_',ID),
        f7Button(paste0("TreePlantCollection",ID,"_",n), "Enter Tree Data", color = "blue")
      ),
      p(align = "center", strong("")),
    )
  )
}