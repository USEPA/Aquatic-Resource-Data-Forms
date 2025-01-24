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
        p(align = "center", strong("Dissolved Oxygen mg/L")),
        p(align = "center", strong("pH")),
        p(align = "center", strong("Conductivity")),
        p(align = "center", strong("Temperature C"))
      ),
    f7Grid(
      cols = 4,
      f7Text(
        inputId = paste0("DO_", ID),
        label = NULL,
        placeholder = "XX.XX",
        style = list(outline = TRUE)
      ),
      f7Text(
        inputId = paste0("pH_", ID),
        label = NULL,
        placeholder = "XX.XX",
        style = list(outline = TRUE)
      ),
      f7Text(
        inputId = paste0("Conductivity_", ID),
        label = NULL,
        placeholder = "XX.XX",
        style = list(outline = TRUE)
      ),
      f7Text(
        inputId = paste0("Temperature_", ID),
        label = NULL,
        placeholder = "XX.XX",
        style = list(outline = TRUE)
      )
      )
    )
    )
}