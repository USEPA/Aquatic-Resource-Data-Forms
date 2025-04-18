#dateCol_, siteId_, latitude_, longitude_

formVerification <- function(ID,RESOURCE) {
  f7Tab(
  title = "Verification",
  tabName = paste0("Verification",ID),
  icon = f7Icon("location_circle", style="font-size: 2rem",
                f7Badge(paste0(ID), color="blue")),
  active = TRUE,
  # f7Fabs(
  #   extended = TRUE,
  #   label = "Menu",
  #   position = "left-top",
  #   color = "blue",
  #   sideOpen = "center",
  #   lapply(c("Save", "Load"), function(i) f7Fab(inputId = paste0(i,"Verification",ID), width= "100%", label = i))
  # ),
    f7Segment(
      f7Button(paste0("SaveVerification",ID), "Save Data", color = "blue"),
      f7Button(paste0("LoadVerification",ID), "Load Data", color = "orange")
      ),
  f7BlockTitle(title = "Site Information", size="large") %>% f7Align(side = "center"),
  f7Card(
    outline = TRUE,
    raised = TRUE,
    f7Grid(
      cols = 2,
      p(align = "center", strong("Date Collected")),
      p(align = "center", strong("Resource Type"))
    ),
    f7Grid(
      cols = 2,
    f7List(
      strong=TRUE,
      dividers=TRUE,
      f7DatePicker(
        inputId = paste0("dateCol",ID),
        label = NULL,
        value = now_utc(),
        openIn = "auto",
        direction = "horizontal",
        timePicker = FALSE,
        dateFormat = "yyyy-mm-dd",
        style = list(outline = TRUE)
      )
      ),
    f7Text(
      inputId = paste0("resource",ID),
      label = NULL,
      value = paste(RESOURCE),
      style = list(outline = TRUE)
    )),
    f7Grid(
      cols = 2,
      p(align = "center", strong("Site ID")),
      p(align = "center", strong("Site Name"))
    ),
    f7Grid(
      cols = 2,
      f7Text(
        inputId = paste0("siteId",ID),
        label = NULL,
        value = paste(ID),
        style = list(outline = TRUE)
      ),
      f7Text(
        inputId = paste0("siteName",ID),
        label = NULL,
        style = list(outline = TRUE, strong=TRUE)
      )), 
    f7Grid(
      cols = 2,
      p(align = "center", strong("Latitude")),
      p(align = "center", strong("Longitude"))
    ),
    f7Grid(
      cols = 2,
      f7Text(
        inputId = paste0("latitude",ID),
        label = NULL,
        placeholder = "XX.XXXX",
        style = list(outline = TRUE)
        ),
      f7Text(
        inputId = paste0("longitude",ID),
        label = NULL,
        placeholder = "-XX.XXXX",
        style = list(outline = TRUE)
        )
      )
    ),
  
  f7BlockTitle(title = "Personnel", size="large") %>% f7Align(side = "center"),
  f7Card(
    outline = TRUE,
    raised = TRUE,
    f7Grid(
      cols = 2,
      p(align = "center", strong("Crew Leader")),
      conditionalPanel(
        condition = 'input.resource == "Wetlands"',
      p(align = "center", strong("Botanist"))),
      conditionalPanel(
        condition = 'input.resource != "Wetlands"',
      p(align = "center", strong("Fish Lead")))
    ),
    f7Grid(
      cols = 2,
      f7Text(
        inputId = paste0("crewlead",ID),
        label = NULL,
        placeholder = "XXXXX XXXXX",
        style = list(outline = TRUE)),
      conditionalPanel(
        condition = 'input.resource == "Wetlands"',
      f7Text(
        inputId = paste0("botanist", ID),
        label = NULL,
        placeholder = "XXXXX XXXXX",
        style = list(outline = TRUE)
      )),
      conditionalPanel(
        condition = 'input.resource != "Wetlands"',
      f7Text(
        inputId = paste0("fishlead",ID),
        label = NULL,
        placeholder = "XXXXX XXXXX",
        style = list(outline = TRUE)
      ))),
    f7Grid(
      cols = 1,
      p(align = "center", strong("Crew Member(s)"))
    ),
    f7Grid(
      cols = 2,
      f7Text(
        inputId = paste0("crewmember1",ID),
        label = NULL,
        placeholder = "XXXXX XXXXX",
        style = list(outline = TRUE)
      ),
      f7Text(
        inputId = paste0("crewmember2",ID),
        label = NULL,
        placeholder = "XXXXX XXXXX",
        style = list(outline = TRUE)
      )
    ),
    f7Grid(
      cols = 2,
      f7Text(
        inputId = paste0("crewmember3",ID),
        label = NULL,
        placeholder = "XXXXX XXXXX",
        style = list(outline = TRUE)
      ),
      f7Text(
        inputId = paste0("crewmember4",ID),
        label = NULL,
        placeholder = "XXXXX XXXXX",
        style = list(outline = TRUE)
      )
      ),
      f7Grid(
        cols = 2,
        f7Text(
          inputId = paste0("crewmember5",ID),
          label = NULL,
          placeholder = "XXXXX XXXXX",
          style = list(outline = TRUE)
        ),
        f7Text(
          inputId = paste0("crewmember6",ID),
          label = NULL,
          placeholder = "XXXXX XXXXX",
          style = list(outline = TRUE)
        )
        )
      ),
  f7BlockTitle(title = "Comments/Descriptions", size="large") %>% f7Align(side = "center"),
  f7Card(
    outline = TRUE,
    raised = TRUE,
    p(align = "left", strong("General Comments")),
    f7TextArea(
      inputId = paste0("generalComments",ID),
      label = NULL,
      style = list(outline = TRUE)
    ),
    p(align = "left", strong("Directions to site")),
    f7TextArea(
      inputId = paste0("directions",ID),
      label = NULL,
      style = list(outline = TRUE)
    )
  )
  )
  
  }

     
    
