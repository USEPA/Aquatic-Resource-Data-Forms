formWaterChemistry <- function(ID) {
  f7Tab(
    title = "Water Chemistry",
    tabName = "WaterChemistry",
    icon = f7Icon("drop"),
    f7BlockTitle(title = "In Situ Water Collection", size="large") %>% f7Align(side = "center"),
    f7Card(
      outline = TRUE,
      raised = TRUE,
    f7Grid(
      cols = 4,
      f7Text(
        inputId = paste0("DO_", ID),
        label = "Dissolved Oxygen mg/L",
        placeholder = "XX.XX",
        style = list(outline = TRUE)
      ),
      f7Text(
        inputId = paste0("DOSaturation_", ID),
        label = "Dissolved Oxygen Saturation %",
        placeholder = "XX.XX",
        style = list(outline = TRUE)
      ),
      f7Text(
        inputId = paste0("Conductivity_", ID),
        label = "Conductivity",
        placeholder = "XX.XX",
        style = list(outline = TRUE)
      ),
      f7Text(
        inputId = paste0("Temperature_", ID),
        label = "Temperature C",
        placeholder = "XX.XX",
        style = list(outline = TRUE)
      )
      )
    )
    )
}