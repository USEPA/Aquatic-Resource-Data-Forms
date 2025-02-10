insertHydrographicProfile <- function(ID,n) {
  f7Grid(
    cols = 7,
    #Notice difference in Button ID 
    f7Button(paste0("HydrographicProfile",ID,"_",n), label=NULL, fill=FALSE,
             icon = f7Icon("text_bubble_fill",
                           style = "font-size: 45px;")),
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