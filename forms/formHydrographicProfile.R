formHydrographicProfile <- function(ID) {
  f7Tab(
    title = HTML("<center>Hydrographic</br>Profile</center>"),
    tabName = paste0("HydrographicProfile",ID),
    icon = f7Icon("flowchart", style="font-size: 2rem"),
    f7Segment(
      f7Button(paste0("SaveHydrographicProfile",ID), "Save Data", color = "blue"),
      f7Button(paste0("LoadHydrographicProfile",ID), "Load Data", color = "orange")
    ),
    f7BlockTitle(title = "Profile Units", size="large") %>% f7Align(side = "left"),
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
          inputId = paste0("ProfileDepthUnit", ID),
          label = NULL,
          choices = c("m", "ft", "cm"),
          selected = "m",
          width = NULL,
          style = list(outline = TRUE)
        ),
        f7Select(
          inputId = paste0("ProfileTempUnit", ID),
          label = NULL,
          choices = c("C", "F"),
          selected = "C",
          width = NULL,
          style = list(outline = TRUE)
        ),
        f7Select(
          inputId = paste0("ProfileDOUnit", ID),
          label = NULL,
          choices = c("mg/L", "% Saturation"),
          selected = "mg/L",
          width = NULL,
          style = list(outline = TRUE)
        ),
        f7Select(
          inputId = paste0("ProfileCONDUnit", ID),
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
        cols = 2,
        p(align = "center", strong("Station Depth")),
        p(align = "left", strong(HTML("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Clear to Bottom?")))
        ),
      f7Grid(
        cols = 2,
        f7Text(
          inputId = paste0("stationdepth", ID),
          label = NULL,
          placeholder = "XX.X",
          style = list(outline = TRUE)
        ),
        div(id = "radio", class = "horizontal-radio",style = "display: flex; justify-content: left;",
            f7Radio(
              inputId = paste0("cleartobottom", ID),
              label = NULL,
              choices = c("Y", "N"),
              selected = "N"))
        ),
      conditionalPanel(
        condition = paste0('input.cleartobottom',ID,'=="N"'),
      f7Grid(
        cols = 2,
        p(align = "center", strong("Secchi Depth")),
        p(align = "center", strong("Cable Length"))
      ),
    f7Grid(
      cols = 2,
        f7Text(
          inputId = paste0("secchidepth", ID),
          label = NULL,
          placeholder = "XX.X",
          style = list(outline = TRUE)
        ),
      f7Text(
        inputId = paste0("cablelength", ID),
        label = NULL,
        placeholder = "XX.X",
        style = list(outline = TRUE)
      ))
    )),
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
        f7Sheet(
          id = paste0("HydrographicProfile",ID,i),
          orientation = "bottom",
          closeByOutsideClick = TRUE,
          swipeHandler = FALSE,
          options = list(breakpoints = c(0.8)),
          p(align = "left", strong(paste0("Comment ",i))),
          f7Block(
            f7TextArea(inputId = paste0("HydrographicProfile",ID,"Comment",i),
                       value="",
                       label = NULL,
                       style = list(outline = TRUE))
          )
        ),
        div(style = "text-align: center;", 
        f7Toggle(
          inputId = paste0("ProfileUpcast",i,ID),
          label = NULL,
          color = "green"
        )),
        f7Text(
          inputId = paste0("ProfileDepth",i,ID),
          label = NULL,
          placeholder = "X.X",
          style = list(outline = TRUE)
          ),
        f7Text(
          inputId = paste0("ProfileTemperature",i,ID),
          label = NULL,
          placeholder = "X.X",
          style = list(outline = TRUE)
          ),
        f7Text(
          inputId = paste0("ProfilePH",i,ID),
          label = NULL,
          placeholder = "X.X",
          style = list(outline = TRUE)
          ),
        f7Text(
          inputId = paste0("ProfileDO",i,ID),
          label = NULL,
          placeholder = "X.X",
          style = list(outline = TRUE)
          ),
        f7Text(
          inputId = paste0("ProfileConductivity",i,ID),
          label = NULL,
          placeholder = "X.X",
          style = list(outline = TRUE)
          )
        )
      }),
      
      
      f7Button(paste0("AddHydrographicProfile",ID), "Add Line", color = "blue")
    )
    )}