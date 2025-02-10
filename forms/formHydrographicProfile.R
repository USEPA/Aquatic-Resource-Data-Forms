formHydrographicProfile <- function(ID) {
  f7Tab(
    title = "Hydrographic Profile",
    tabName = paste0("HydrographicProfile",ID),
    icon = f7Icon("flowchart", style="font-size: 2rem"),
    f7BlockTitle(title = "Profile Unit", size="large") %>% f7Align(side = "left"),
    f7Card(
      outline = TRUE,
      raised = TRUE,
      f7Grid(
        cols = 4,
        p(align = "center", strong("Depth")),
        p(align = "center", strong("Temperature")),
        p(align = "center", strong("Dissolved Oxygen")),
        p(align = "center", strong("Conductivity"))
      ),
      f7Grid(
        cols = 4,
        f7Select(
          inputId = paste0("ProfileDepthUnit_", ID),
          label = NULL,
          choices = c("m", "ft", "cm"),
          selected = "m",
          width = NULL,
          style = list(outline = TRUE)
        ),
        f7Select(
          inputId = paste0("ProfileTempUnit_", ID),
          label = NULL,
          choices = c("C", "F"),
          selected = "C",
          width = NULL,
          style = list(outline = TRUE)
        ),
        f7Select(
          inputId = paste0("ProfileDOUnit_", ID),
          label = NULL,
          choices = c("mg/L", "% Saturation"),
          selected = "mg/L",
          width = NULL,
          style = list(outline = TRUE)
        ),
        f7Select(
          inputId = paste0("ProfileCONDUnit_", ID),
          label = NULL,
          choices = c("uS/cm", "umhos/cm"),
          selected = "uS/cm",
          width = NULL,
          style = list(outline = TRUE)
        )
      )),
    f7BlockTitle(title = "Station Information", size="large") %>% f7Align(side = "left"),
    f7Card(
      outline = TRUE,
      raised = TRUE,
      f7Grid(
        cols = 4,
        p(align = "center", strong("Station Depth")),
        p(align = "center", strong("Cable Length")),
        p(align = "center", strong("Secchi Depth")),
        p(align = "left", strong("Clear to bottom?")),
      ),
      f7Grid(
        cols = 4,
        f7Text(
          inputId = paste0("stationdepth_", ID),
          label = NULL,
          placeholder = "XX.X",
          style = list(outline = TRUE)
        ),
        f7Text(
          inputId = paste0("cablelength_", ID),
          label = NULL,
          placeholder = "XX.X",
          style = list(outline = TRUE)
        ),
        f7Text(
          inputId = paste0("secchidepth_", ID),
          label = NULL,
          placeholder = "XX.X",
          style = list(outline = TRUE)
        ),
        div(style = "text-align: center;", 
        f7Radio(
          inputId = paste0("cleartobottom_", ID),
          label = NULL,
          choices = c("Y", "N"),
          selected = "N",
          style = list(
            inset = TRUE
          ))
      )
    )
    ),
    f7BlockTitle(title = "Profile", size="large") %>% f7Align(side = "left"),
    f7Card(
      outline = TRUE,
      raised = TRUE,
      f7Grid(
        cols = 7,
        p(align = "center", strong("")),
        p(align = "center", strong("Upcast?")),
        p(align = "center", strong("Depth")),
        p(align = "center", strong("Temp")),
        p(align = "center", strong("pH")),
        p(align = "center", strong("DO")),
        p(align = "center", strong("COND"))
        # p(align = "center", strong("Light (AMB)")),
        # p(align = "center", strong("Light (UW)"))
      ),
      lapply(1:15, function(i) {
      f7Grid(
        cols = 7,
        #Notice difference in Button ID 
        f7Button(paste0("HydrographicProfile",ID,"_",i), label=NULL, fill=FALSE,
                 icon = f7Icon("text_bubble_fill",
                               style = "font-size: 45px;")),
        div(style = "text-align: center;", 
        f7Toggle(
          inputId = paste0("ProfileUpcast_",i,"_",ID),
          label = NULL,
          color = "green"
        )),
        f7Text(
          inputId = paste0("ProfileDepth_",i,"_",ID),
          label = NULL,
          placeholder = "X.X",
          style = list(outline = TRUE)
          ),
        f7Text(
          inputId = paste0("ProfileTemperature_",i,"_",ID),
          label = NULL,
          placeholder = "X.X",
          style = list(outline = TRUE)
          ),
        f7Text(
          inputId = paste0("ProfilePH_",i,"_",ID),
          label = NULL,
          placeholder = "X.X",
          style = list(outline = TRUE)
          ),
        f7Text(
          inputId = paste0("ProfileDO_",i,"_",ID),
          label = NULL,
          placeholder = "X.X",
          style = list(outline = TRUE)
          ),
        f7Text(
          inputId = paste0("ProfileConductivity_",i,"_",ID),
          label = NULL,
          placeholder = "X.X",
          style = list(outline = TRUE)
          )
        # f7Text(
        #   inputId = paste0("ProfileLightAMB_",i,"_",ID),
        #   label = NULL,
        #   placeholder = "X.X",
        #   style = list(outline = TRUE)
        #   ),
        # f7Text(
        #   inputId = paste0("ProfileLightUW_",i,"_",ID),
        #   label = NULL,
        #   placeholder = "X.X",
        #   style = list(outline = TRUE)
        #   )
        )
      }),
      
      
      f7Button(paste0("AddHydrographicProfile",ID), "Add Line", color = "blue")
    )
    )}