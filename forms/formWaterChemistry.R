formWaterChemistry <- function(ID) {
  f7Tab(
    title = HTML("<center>Water</br>Chemistry</center>"),
    tabName = paste0("WaterChemistry",ID),
    icon = icon("glass-water-droplet", style="font-size: 2rem"),
    f7Segment(
      f7Button(paste0("SaveWaterChemistry",ID), "Save Data", color = "blue"),
      f7Button(paste0("LoadWaterChemistry",ID), "Load Data", color = "orange")
    ),
    f7BlockTitle(title = "In Situ Water Collection", size="large") %>% f7Align(side = "center"),
    f7Card(
      outline = TRUE,
      raised = TRUE,
      f7Grid(
        cols = 3,
        p(align = "center", strong("Location (1)")),
        p(align = "center", strong("pH")),
        p(align = "center", strong(""))
      ),
      f7Grid(
        cols = 3,
        f7Text(
          inputId = paste0("LocationChem1",ID),
          label = NULL,
          placeholder = "XX.XX",
          style = list(outline = TRUE)
        ),
        f7Text(
          inputId = paste0("pHChem1",ID),
          label = NULL,
          placeholder = "X.X",
          style = list(outline = TRUE)
        ),
        #Notice difference in Button ID 
        f7Button(paste0("WaterChemistry",ID,"_1"), label=NULL, fill=FALSE,
                 icon = f7Icon("text_bubble_fill",
                               style = "font-size: 45px;")),
        f7Sheet(
          id = paste0("WaterChemistry",ID,"1"),
          orientation = "bottom",
          closeByOutsideClick = TRUE,
          swipeHandler = FALSE,
          options = list(breakpoints = c(0.8)),
          p(align = "left", strong("Comment 1")),
          f7Block(
            f7TextArea(inputId = paste0("WaterChemistry",ID,"Comment1"),
                       value="",
                       label = NULL,
                       style = list(outline = TRUE))
          )
        )
      ),
      f7Grid(
        cols = 4,
        p(align = "center", strong("Depth")),
        p(align = "center", strong("Units")),
        p(align = "center", strong("DO")),
        p(align = "center", strong("Units"))
      ),
      f7Grid(
        cols = 4,
      f7Text(
        inputId = paste0("DepthChem1", ID),
        label = NULL,
        placeholder = "XX.XX",
        style = list(outline = TRUE)
      ),
      f7Select(
        inputId = paste0("DepthUnits1", ID),
        label = NULL,
        choices = c("cm", "m", "ft"),
        selected = "cm",
        width = NULL,
        style = list(outline = TRUE)
      ),
      f7Text(
        inputId = paste0("DOChem1", ID),
        label = NULL,
        placeholder = "XX.X",
        style = list(outline = TRUE)
      ),
      f7Select(
        inputId = paste0("DOUnits1", ID),
        label = NULL,
        choices = c("mg/L", "% Saturation"),
        selected = "mg/L",
        width = NULL,
        style = list(outline = TRUE)
      )),
      f7Grid(
        cols = 4,
        p(align = "center", strong("Conductivity")),
        p(align = "center", strong("Units")),
        p(align = "center", strong("Temperature")),
        p(align = "center", strong("Units"))
      ),
      f7Grid(
        cols = 4,
        f7Text(
          inputId = paste0("ConductivityChem1", ID),
          label = NULL,
          placeholder = "XX.XX",
          style = list(outline = TRUE)
        ),
        f7Select(
          inputId = paste0("ConductivityUnits1", ID),
          label = NULL,
          choices = c("uS/cm", "umhos/cm"),
          selected = "uS/cm",
          width = NULL,
          style = list(outline = TRUE)
        ),
        f7Text(
          inputId = paste0("TemperatureChem1", ID),
          label = NULL,
          placeholder = "XX.X",
          style = list(outline = TRUE)
        ),
        f7Select(
          inputId = paste0("TemperatureUnits1", ID),
          label = NULL,
          choices = c("C", "F"),
          selected = "C",
          width = NULL,
          style = list(outline = TRUE)
        ))
    ),
    f7Button(paste0("AddWaterChemistry",ID), "Add Location", color = "blue")
  )
}

   