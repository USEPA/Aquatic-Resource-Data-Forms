insertHydrographicProfile <- function(ID,n) {
  f7Grid(
    cols = 6,
    div(style = "text-align: center;", 
        f7Toggle(
          inputId = paste0("ProfileUpcast_",n,"_",ID),
          label = NULL,
          color = "green"
        )),
    f7Text(
      inputId = paste0("ProfileDepth_",n,"_",ID),
      label = NULL,
      placeholder = "XX.X",
      style = list(outline = TRUE)
    ),
    f7Text(
      inputId = paste0("ProfileTemperature_",n,"_",ID),
      label = NULL,
      placeholder = "XX.X",
      style = list(outline = TRUE)
    ),
    f7Text(
      inputId = paste0("ProfilePH_",n,"_",ID),
      label = NULL,
      placeholder = "XX.X",
      style = list(outline = TRUE)
    ),
    f7Text(
      inputId = paste0("ProfileDO_",n,"_",ID),
      label = NULL,
      placeholder = "XX.X",
      style = list(outline = TRUE)
    ),
    f7Text(
      inputId = paste0("ProfileConductivity_",n,"_",ID),
      label = NULL,
      placeholder = "XX.X",
      style = list(outline = TRUE)
    )
  )
}