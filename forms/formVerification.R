#dateCol_, siteId_, latitude_, longitude_

formVerification <- function(ID) {
  f7Tab(
  title = "Verification",
  tabName = "Verification",
  active = TRUE,
  f7BlockTitle(title = "Site Information", size="large") %>% f7Align(side = "center"),
  f7Card(
    outline = TRUE,
    raised = TRUE,
    f7List(
      strong=TRUE,
      dividers=TRUE,
      f7DatePicker(
        inputId = paste0("dateCol_", ID),
        label = "Date Collected",
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
      cols = 4,
      f7Text(
        inputId = paste0("siteId_", ID),
        label = "Site ID",
        value = paste(ID),
        style = list(outline = TRUE)
      ),
      f7Text(
        inputId = paste0("siteName_", ID),
        label = "Site Name",
        style = list(outline = TRUE, strong=TRUE)
      )), br(),
    f7Grid(
      cols = 4,
      f7Text(
        inputId = paste0("latitude_", ID),
        label = "Latitude",
        placeholder = "XX.XXXX",
        style = list(outline = TRUE)
        ),
      f7Text(
        inputId = paste0("longitude_", ID),
        label = "Longitude",
        placeholder = "XX.XXXX",
        style = list(outline = TRUE)
        )
    )
      )
    )
  }
