#dateCol_, siteId_, latitude_, longitude_

formVerification <- function(ID,RESOURCE) {
  f7Tab(
  title = "Verification",
  tabName = paste0("Verification",ID),
  icon = f7Icon("location_circle"),
  active = FALSE,
  f7BlockTitle(title = "Site Information", size="large") %>% f7Align(side = "center"),
  f7Card(
    outline = TRUE,
    raised = TRUE,
    f7Grid(
      cols = 1,
      p(align = "left", strong("Date Collected"))
    ),
    f7List(
      strong=TRUE,
      dividers=TRUE,
      f7DatePicker(
        inputId = paste0("dateCol_", ID),
        label = NULL,
        value = now_utc(),
        openIn = "auto",
        direction = "horizontal",
        timePicker = FALSE,
        dateFormat = "mm-dd-yyyy",
        style = list(outline = TRUE)
      )
      ),
     br(),
    f7Grid(
      cols = 2,
      p(align = "center", strong("Resource Type"))
    ),
    f7Grid(
      cols = 2,
      f7Text(
        inputId = paste0("resource_", ID),
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
        inputId = paste0("siteId_", ID),
        label = NULL,
        value = paste(ID),
        style = list(outline = TRUE)
      ),
      f7Text(
        inputId = paste0("siteName_", ID),
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
        inputId = paste0("latitude_", ID),
        label = NULL,
        placeholder = "XX.XXXX",
        style = list(outline = TRUE)
        ),
      f7Text(
        inputId = paste0("longitude_", ID),
        label = NULL,
        placeholder = "XX.XXXX",
        style = list(outline = TRUE)
        )
      )
    )
  )
  }
