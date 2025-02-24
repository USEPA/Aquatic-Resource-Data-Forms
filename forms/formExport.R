formExport<- function(ID,FC) {
  f7Tab(
    title = "Export Data",
    tabName = paste0("Export",ID),
    icon = icon("download", style="font-size: 2rem"),
  f7Block(
    div(id=paste0("formsitechoice",ID),
    div(
      f7CheckboxGroup(
        inputId = paste0("sitechoice",ID),
        label = "Choose which sites you want to save:",
        choices = ID,
        selected = ID,
        position = "left"
      ), style = "font-size:18px;"),
    div(
    f7CheckboxGroup(
      inputId = paste0("formchoice",ID),
      label = "Choose which forms you want to save:",
      choices = FC,
      selected = "Verification",
      position = "left"
    ), style = "font-size:18px;")
    ),
    div(id=paste0("exportchoicetitle",ID),
    f7Radio(
      inputId = paste0("exportchoice",ID),
      label = "Choose how you want the data saved:",
      choices = list(
        f7RadioChoice(
          "csv"="Export the forms as individual Comma Delimited (.csv) files and have them zipped up.",
          title = "Comma Delimited (*.csv)",
          subtitle = NULL,
          after = NULL
        ),
        f7RadioChoice(
          "xlsx"="Export the forms as multiple sheets in a single Excel Workbook (.xlsx) file.",
          title = "Excel Workbook (*.xlsx)",
          subtitle = NULL,
          after = NULL
        )
      ),
      selected = 1,
      style = list(
        outline = TRUE,
        strong = TRUE,
        inset = TRUE,
        dividers = TRUE
      )
    ), style = "font-size:18px"),
    f7DownloadButton("download", "Export Data")
  )
  )
}
