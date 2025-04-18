insertHydrographicProfile <- function(ID,n) {
  f7Grid(
    cols = 7,
    #Notice difference in Button ID 
    f7Button(paste0("HydrographicProfile",ID,"_",n), label=NULL, fill=FALSE,
             icon = f7Icon("text_bubble_fill",
                           style = "font-size: 45px;")),
    f7Sheet(
      id = paste0("HydrographicProfile",ID,n),
      orientation = "bottom",
      closeByOutsideClick = TRUE,
      swipeHandler = FALSE,
      options = list(breakpoints = c(0.8)),
      p(align = "left", strong(paste0("Comment ",n))),
      f7Block(
        f7TextArea(inputId = paste0("HydrographicProfile",ID,"Comment",n),
                   value="",
                   label = NULL,
                   style = list(outline = TRUE))
      )
    ),
    div(style = "text-align: center;", 
        f7Toggle(
          inputId = paste0("ProfileUpcast",n,ID),
          label = NULL,
          color = "green"
        )),
    f7Text(
      inputId = paste0("ProfileDepth",n,ID),
      label = NULL,
      placeholder = "XX.X",
      style = list(outline = TRUE)
    ),
    f7Text(
      inputId = paste0("ProfileTemperature",n,ID),
      label = NULL,
      placeholder = "XX.X",
      style = list(outline = TRUE)
    ),
    f7Text(
      inputId = paste0("ProfilePH",n,ID),
      label = NULL,
      placeholder = "XX.X",
      style = list(outline = TRUE)
    ),
    f7Text(
      inputId = paste0("ProfileDO",n,ID),
      label = NULL,
      placeholder = "XX.X",
      style = list(outline = TRUE)
    ),
    f7Text(
      inputId = paste0("ProfileConductivity",n,ID),
      label = NULL,
      placeholder = "XX.X",
      style = list(outline = TRUE)
    )
  )
}