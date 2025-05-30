insertWaterChemistry <- function(ID,n) {
  f7Card(
    outline = TRUE,
    raised = TRUE,
    f7Grid(
      cols = 3,
      p(align = "center", strong(paste0("Location (",n,")"))),
      p(align = "center", strong("pH")),
      p(align = "center", strong(""))
    ),
    f7Grid(
      cols = 3,
      f7Text(
        inputId = paste0("LocationChem",n,ID),
        label = NULL,
        placeholder = "XX.XX",
        style = list(outline = TRUE)
      ),
      f7Text(
        inputId = paste0("pHChem",n,ID),
        label = NULL,
        placeholder = "X.X",
        style = list(outline = TRUE)
      ),
      #Notice difference in Button ID 
      f7Button(paste0("WaterChemistry",ID,"_",n), label=NULL, fill=FALSE,
               icon = f7Icon("text_bubble_fill",
                             style = "font-size: 45px;")),
      f7Sheet(
        id = paste0("WaterChemistry",ID,n),
        orientation = "bottom",
        closeByOutsideClick = TRUE,
        swipeHandler = FALSE,
        options = list(breakpoints = c(0.8)),
        p(align = "left", strong(paste0("Comment ",n))),
        f7Block(
          f7TextArea(inputId = paste0("WaterChemistry",ID,"Comment",n),
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
        inputId = paste0("DepthChem",n,ID),
        label = NULL,
        placeholder = "XX.XX",
        style = list(outline = TRUE)
      ),
      f7Select(
        inputId = paste0("DepthUnits",n,ID),
        label = NULL,
        choices = c("cm", "m", "ft"),
        selected = "cm",
        width = NULL,
        style = list(outline = TRUE)
      ),
      f7Text(
        inputId = paste0("DOChem",n,ID),
        label = NULL,
        placeholder = "XX.X",
        style = list(outline = TRUE)
      ),
      f7Select(
        inputId = paste0("DOUnits",n,ID),
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
        inputId = paste0("ConductivityChem",n,ID),
        label = NULL,
        placeholder = "XX.XX",
        style = list(outline = TRUE)
      ),
      f7Select(
        inputId = paste0("ConductivityUnits",n,ID),
        label = NULL,
        choices = c("uS/cm", "umhos/cm"),
        selected = "uS/cm",
        width = NULL,
        style = list(outline = TRUE)
      ),
      f7Text(
        inputId = paste0("TemperatureChem",n,ID),
        label = NULL,
        placeholder = "XX.X",
        style = list(outline = TRUE)
      ),
      f7Select(
        inputId = paste0("TemperatureUnits",n,ID),
        label = NULL,
        choices = c("C", "F"),
        selected = "C",
        width = NULL,
        style = list(outline = TRUE)
      ))
  )
  
}
      
