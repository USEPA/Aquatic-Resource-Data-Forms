formWaterChemistry <- function(ID) {
  f7Tab(
    title = "Water Chemistry",
    tabName = paste0("WaterChemistry",ID),
    icon = f7Icon("drop"),
    f7BlockTitle(title = "In Situ Water Collection", size="large") %>% f7Align(side = "center"),
    f7Card(
      outline = TRUE,
      raised = TRUE,
      f7Grid(
        cols = 2,
        p(align = "center", strong("Location (1)")),
        p(align = "center", strong("Depth"))
      ),
      f7Grid(
        cols = 2,
        f7Text(
          inputId = paste0("LocationChem_1_", ID),
          label = NULL,
          placeholder = "XX.XX",
          style = list(outline = TRUE)
        ),
        f7Text(
          inputId = paste0("DepthChem_1_", ID),
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
        inputId = paste0("DOChem_1_", ID),
        label = NULL,
        placeholder = "XX.X",
        style = list(outline = TRUE)
      ),
      f7Text(
        inputId = paste0("pHChem_1_", ID),
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
        inputId = paste0("ConductivityChem_1_", ID),
        label = NULL,
        placeholder = "XX.X",
        style = list(outline = TRUE)
      ),
      f7Text(
        inputId = paste0("TemperatureChem_1_", ID),
        label = NULL,
        placeholder = "XX.X",
        style = list(outline = TRUE)
      )
      )
    ),
    f7Button(paste0("AddWaterChemistry",ID), "Add Line", color = "blue")
    )
}