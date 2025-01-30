insertWaterChemistry <- function(ID,n) {
  f7Card(
    outline = TRUE,
    raised = TRUE,
    f7Grid(
      cols = 2,
      p(align = "center", strong(paste0("Location (", n,")"))),
      p(align = "center", strong("Depth"))
    ),
    f7Grid(
      cols = 2,
      f7Text(
        inputId = paste0("LocationChem_",n,"_",ID),
        label = NULL,
        placeholder = "XX.XX",
        style = list(outline = TRUE)
      ),
      f7Text(
        inputId = paste0("DepthChem_",n,"_",ID),
        label = NULL,
        placeholder = "XX.XX",
        style = list(outline = TRUE)
      )),
    f7Grid(
      cols = 2,
      p(align = "center", strong("Dissolved Oxygen")),
      p(align = "center", strong("pH"))
    ),
    f7Grid(
      cols = 2,
      f7Text(
        inputId = paste0("DOChem_",n,"_",ID),
        label = NULL,
        placeholder = "XX.X",
        style = list(outline = TRUE)
      ),
      f7Text(
        inputId = paste0("pHChem_",n,"_",ID),
        label = NULL,
        placeholder = "X.X",
        style = list(outline = TRUE)
      )),
    f7Grid(
      cols = 2,
      p(align = "center", strong("Conductivity")),
      p(align = "center", strong("Temperature"))
    ),
    f7Grid(
      cols = 2,
      f7Text(
        inputId = paste0("ConductivityChem_",n,"_",ID),
        label = NULL,
        placeholder = "XX.X",
        style = list(outline = TRUE)
      ),
      f7Text(
        inputId = paste0("TemperatureChem_",n,"_",ID),
        label = NULL,
        placeholder = "XX.X",
        style = list(outline = TRUE)
      )
    )
  )
}