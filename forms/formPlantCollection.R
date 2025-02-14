formPlantCollection <- function(ID,n) {
  f7Tab(
    title = div(id=paste0("planttitle",ID), HTML("<center>Plant</br>Collection</center>")),
    tabName = paste0("PlantCollection",ID),
    icon = icon("leaf", style="font-size: 2rem"),
    f7BlockTitle(title = "Species Presence and Cover", size="large") %>% f7Align(side = "center"),
    lapply(1:20, function(i) {
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
        p(align = "center", strong(paste0(i))),
        f7Text(
          inputId = paste0("plantname_",i,"_",ID),
          label = NULL,
          value="",
          placeholder = "Enter New Species",
          style = list(outline = TRUE)
        ),
        div(style = "text-align: center;", 
        f7Checkbox(
          inputId = paste0("unknown_",i,"_",ID),
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
          inputId = paste0("heightclass_",i,"_",ID),
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
          inputId = paste0("percentcover_",i,"_",ID),
          label = NULL,
          value="",
          style = list(outline = TRUE)
        ),
        #Notice difference in Button ID 
        f7Button(paste0("PlantCollection",ID,"_",i), label=NULL, fill=FALSE,
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
              inputId = paste0("tree_",i,"_",ID),
              label = NULL,
              value = FALSE
            )),
        conditionalPanel(
          condition = paste0('input.tree_',i,'_',ID),
          f7Button(paste0("TreePlantCollection",ID,"_",i), "Enter Tree Data", color = "blue")
        ),
        p(align = "center", strong("")),
      )
    ) 
    }),
    f7Button(paste0("AddPlantCollection",ID), "Add Line", color = "blue")
  )
}

        
