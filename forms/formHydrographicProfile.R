formHydrographicProfile <- function(ID) {
  f7Tab(
    title = "Hydrographic Profile",
    tabName = "HydrographicProfile",
    icon = f7Icon("flowchart"),
    f7Card(
      outline = TRUE,
      raised = TRUE,
      f7Grid(
        cols = 4,
      f7Text(
        inputId = paste0("stationdepth_", ID),
        label = "Station Depth (m)",
        placeholder = "XX.X",
        style = list(outline = TRUE)
      )
      )),
    f7BlockTitle(title = "Secchi Depth", size="large") %>% f7Align(side = "left"),
    f7Card(
      outline = TRUE,
      raised = TRUE,
      f7Grid(
        cols = 6,
        f7Text(
          inputId = paste0("secchidepth_", ID),
          label = "Secchi Depth (m)",
          placeholder = "XX.X",
          style = list(outline = TRUE)
        ),
        f7Radio(
          inputId = paste0("cleartobottom_", ID),
          label = "Clear to bottom?",
          choices = c("Y", "N"),
          selected = "N",
          style = list(
            inset = TRUE
          )
      )
    )
    ),
    f7BlockTitle(title = "Profile", size="large") %>% f7Align(side = "left"),
    f7Card(
      outline = TRUE,
      raised = TRUE,
      f7Grid(
        cols = 6,
        p(align = "center", strong("Upcast?")),
        p(align = "center", strong("Depth (m)")),
        p(align = "center", strong("Temp (C)")),
        p(align = "center", strong("pH")),
        p(align = "center", strong("DO (mg/L)")),
        p(align = "center", strong("COND (uS/cm)"))
        # p(align = "center", strong("Light (AMB)")),
        # p(align = "center", strong("Light (UW)"))
      ),
      lapply(1:15, function(i) {
      f7Grid(
        cols = 6,
        div(style = "text-align: center;", 
        f7Toggle(
          inputId = paste0("ProfileUpcast_",i,"_",ID),
          label = NULL,
          color = "green"
        )),
        f7Text(
          inputId = paste0("ProfileDepth_",i,"_",ID),
          label = NULL,
          placeholder = "XX.X",
          style = list(outline = TRUE)
          ),
        f7Text(
          inputId = paste0("ProfileTemperature_",i,"_",ID),
          label = NULL,
          placeholder = "XX.X",
          style = list(outline = TRUE)
          ),
        f7Text(
          inputId = paste0("ProfilePH_",i,"_",ID),
          label = NULL,
          placeholder = "XX.X",
          style = list(outline = TRUE)
          ),
        f7Text(
          inputId = paste0("ProfileDO_",i,"_",ID),
          label = NULL,
          placeholder = "XX.X",
          style = list(outline = TRUE)
          ),
        f7Text(
          inputId = paste0("ProfileConductivity_",i,"_",ID),
          label = NULL,
          placeholder = "XX.X",
          style = list(outline = TRUE)
          )
        # f7Text(
        #   inputId = paste0("ProfileLightAMB_",i,"_",ID),
        #   label = NULL,
        #   placeholder = "XX.X",
        #   style = list(outline = TRUE)
        #   ),
        # f7Text(
        #   inputId = paste0("ProfileLightUW_",i,"_",ID),
        #   label = NULL,
        #   placeholder = "XX.X",
        #   style = list(outline = TRUE)
        #   )
        )
      }),
      
      conditionalPanel(
        condition = "input.AddLine >= 1",
      lapply(16:20, function(i) {
        f7Grid(
          cols = 9,
          f7Toggle(
            inputId = paste0("ProfileUpcast_",i,"_",ID),
            label = NULL,
            color = "green"
          ),
          f7Text(
            inputId = paste0("ProfileDepth_",i,"_",ID),
            label = NULL,
            placeholder = "XX.X",
            style = list(outline = TRUE)
          ),
          f7Text(
            inputId = paste0("ProfileTemperature_",i,"_",ID),
            label = NULL,
            placeholder = "XX.X",
            style = list(outline = TRUE)
          ),
          f7Text(
            inputId = paste0("ProfilePH_",i,"_",ID),
            label = NULL,
            placeholder = "XX.X",
            style = list(outline = TRUE)
          ),
          f7Text(
            inputId = paste0("ProfileDO_",i,"_",ID),
            label = NULL,
            placeholder = "XX.X",
            style = list(outline = TRUE)
          ),
          f7Text(
            inputId = paste0("ProfileConductivity_",i,"_",ID),
            label = NULL,
            placeholder = "XX.X",
            style = list(outline = TRUE)
          )
          # f7Text(
          #   inputId = paste0("ProfileLightAMB_",i,"_",ID),
          #   label = NULL,
          #   placeholder = "XX.X",
          #   style = list(outline = TRUE)
          #   ),
          # f7Text(
          #   inputId = paste0("ProfileLightUW_",i,"_",ID),
          #   label = NULL,
          #   placeholder = "XX.X",
          #   style = list(outline = TRUE)
          #   )
        )
      })),
      
      conditionalPanel(
        condition = "input.AddLine >= 2",
        lapply(21:25, function(i) {
          f7Grid(
            cols = 9,
            f7Toggle(
              inputId = paste0("ProfileUpcast_",i,"_",ID),
              label = NULL,
              color = "green"
            ),
            f7Text(
              inputId = paste0("ProfileDepth_",i,"_",ID),
              label = NULL,
              placeholder = "XX.X",
              style = list(outline = TRUE)
            ),
            f7Text(
              inputId = paste0("ProfileTemperature_",i,"_",ID),
              label = NULL,
              placeholder = "XX.X",
              style = list(outline = TRUE)
            ),
            f7Text(
              inputId = paste0("ProfilePH_",i,"_",ID),
              label = NULL,
              placeholder = "XX.X",
              style = list(outline = TRUE)
            ),
            f7Text(
              inputId = paste0("ProfileDO_",i,"_",ID),
              label = NULL,
              placeholder = "XX.X",
              style = list(outline = TRUE)
            ),
            f7Text(
              inputId = paste0("ProfileConductivity_",i,"_",ID),
              label = NULL,
              placeholder = "XX.X",
              style = list(outline = TRUE)
            )
            # f7Text(
            #   inputId = paste0("ProfileLightAMB_",i,"_",ID),
            #   label = NULL,
            #   placeholder = "XX.X",
            #   style = list(outline = TRUE)
            #   ),
            # f7Text(
            #   inputId = paste0("ProfileLightUW_",i,"_",ID),
            #   label = NULL,
            #   placeholder = "XX.X",
            #   style = list(outline = TRUE)
            #   )
          )
        })),
      
      conditionalPanel(
        condition = "input.AddLine >= 3",
        lapply(26:30, function(i) {
          f7Grid(
            cols = 9,
            f7Toggle(
              inputId = paste0("ProfileUpcast_",i,"_",ID),
              label = NULL,
              color = "green"
            ),
            f7Text(
              inputId = paste0("ProfileDepth_",i,"_",ID),
              label = NULL,
              placeholder = "XX.X",
              style = list(outline = TRUE)
            ),
            f7Text(
              inputId = paste0("ProfileTemperature_",i,"_",ID),
              label = NULL,
              placeholder = "XX.X",
              style = list(outline = TRUE)
            ),
            f7Text(
              inputId = paste0("ProfilePH_",i,"_",ID),
              label = NULL,
              placeholder = "XX.X",
              style = list(outline = TRUE)
            ),
            f7Text(
              inputId = paste0("ProfileDO_",i,"_",ID),
              label = NULL,
              placeholder = "XX.X",
              style = list(outline = TRUE)
            ),
            f7Text(
              inputId = paste0("ProfileConductivity_",i,"_",ID),
              label = NULL,
              placeholder = "XX.X",
              style = list(outline = TRUE)
            )
            # f7Text(
            #   inputId = paste0("ProfileLightAMB_",i,"_",ID),
            #   label = NULL,
            #   placeholder = "XX.X",
            #   style = list(outline = TRUE)
            #   ),
            # f7Text(
            #   inputId = paste0("ProfileLightUW_",i,"_",ID),
            #   label = NULL,
            #   placeholder = "XX.X",
            #   style = list(outline = TRUE)
            #   )
          )
        })),
      
      conditionalPanel(
        condition = "input.AddLine >= 4",
        lapply(31:35, function(i) {
          f7Grid(
            cols = 9,
            f7Toggle(
              inputId = paste0("ProfileUpcast_",i,"_",ID),
              label = NULL,
              color = "green"
            ),
            f7Text(
              inputId = paste0("ProfileDepth_",i,"_",ID),
              label = NULL,
              placeholder = "XX.X",
              style = list(outline = TRUE)
            ),
            f7Text(
              inputId = paste0("ProfileTemperature_",i,"_",ID),
              label = NULL,
              placeholder = "XX.X",
              style = list(outline = TRUE)
            ),
            f7Text(
              inputId = paste0("ProfilePH_",i,"_",ID),
              label = NULL,
              placeholder = "XX.X",
              style = list(outline = TRUE)
            ),
            f7Text(
              inputId = paste0("ProfileDO_",i,"_",ID),
              label = NULL,
              placeholder = "XX.X",
              style = list(outline = TRUE)
            ),
            f7Text(
              inputId = paste0("ProfileConductivity_",i,"_",ID),
              label = NULL,
              placeholder = "XX.X",
              style = list(outline = TRUE)
            )
            # f7Text(
            #   inputId = paste0("ProfileLightAMB_",i,"_",ID),
            #   label = NULL,
            #   placeholder = "XX.X",
            #   style = list(outline = TRUE)
            #   ),
            # f7Text(
            #   inputId = paste0("ProfileLightUW_",i,"_",ID),
            #   label = NULL,
            #   placeholder = "XX.X",
            #   style = list(outline = TRUE)
            #   )
          )
        })),
      
      f7Button("AddLine", "Add 5 Lines", color = "blue")
    )
    )}