library(shiny)
library(shinyMobile)
library(zip)

now_utc <- function() {
  now <- Sys.time()
  attr(now, "tzone") <- "UTC"
  now
}

# source modules
e <- environment()
path <- "forms/"
sapply(
  list.files(
    path,
    include.dirs = FALSE,
    pattern = ".R",
    ignore.case = TRUE
  ),
  function(f) {
    source(file.path(path, f), local = e)
  }
)

app_options <- list(
  theme = "auto",
  dark = FALSE,
 # color = "white",
  navbar = list(
    # hideOnPageScroll = TRUE,
    mdCenterTitle = TRUE
  )
)

shinyApp(
  ui = f7Page(
    title = "Aquatic Resources Field Forms",
    options = app_options,
    f7TabLayout(
      panels = tagList(
        f7Panel(
          title = "Options",
          side = "right",
          f7Radio(
            inputId = "dark",
            label = "Mode",
            choices = c("light", "dark"),
            selected = ifelse(app_options$dark, "dark", "light")
          ),
          effect = "floating",
        )
      ),
      navbar = f7Navbar(
        title = "Aquatic Resources Field Forms",
        leftPanel = FALSE,
        rightPanel = tagList(
          tags$a(
            class = "link icon-only panel-open",
            `data-panel` = "right",
            f7Icon("gear_alt")
          )
        )
      ),
      f7Tabs(
        animated = FALSE,
        swipeable = FALSE,
        id = "tabs",
     f7Tab(
          title = "Add Site",
          tabName = "tabAddSite",
          icon = f7Icon("plusminus_circle_fill"),
          active = TRUE,
          f7BlockTitle(title = "Add or Remove Site Tab", size="medium") %>% f7Align(side = "center"),
      f7Card(
            outline = TRUE,
            raised = TRUE,
            #title = "ADD SITE",
      f7Grid(
        cols = 2,
      f7Select(
        "resource",
        "Resource Type",
        selected = "Rivers and Streams",
        choices = c("Rivers and Streams",
                    "Lakes and Ponds",
                    "Wetlands",
                    "Estuaries"),
        style = list(outline = TRUE)),
      f7Text(
        "site_id",
        "Site ID",
        placeholder = "Site ID",
        style = list(outline = TRUE)
      )),
      f7Grid(
        cols = 2,
        f7Segment(
          f7Button("insertTab", "Insert", color = "blue"),
          f7Button("removeTab", "Remove", color = "red")
          )
      ))))
    )
  ),
  server = function(input, output, session) {
    
    VERIFICATION <- reactive({
      source("data/dataVerification.R", local = TRUE)$value
    })
    
    WATERCHEMISTRY <- reactive({
      source("data/dataWaterChemistry.R", local = TRUE)$value
    })
    
    
    
    # update mode
    observeEvent(input$dark, ignoreInit = TRUE, {
      updateF7App(
        options = list(
          dark = ifelse(input$dark == "dark", TRUE, FALSE)
        )
      )
    })
    
    # Add Site Tab
    observeEvent(input$insertTab, {
      # shinyMobile code does not work well with punctuation
      ID <- sub("[[:punct:][:blank:]]+", "_", input$site_id)
      
      insertF7Tab(
        id = "tabs",
        position = "after",
        target = "tabAddSite",
        tab = f7Tab(
          tabName = ID,
          icon = f7Icon("plus_square_fill"),
          f7Block(
            f7DownloadButton("download", "Export Data")
          ),
            #add the forms for each Resource Type here
            if(input$resource == "Rivers and Streams"){
              f7Tabs(
                style = "toolbar",
                animated = TRUE,
                swipeable = FALSE,
              formVerification(ID),
              formWaterChemistry(ID)
              )
            } else if(input$resource == "Lakes and Ponds"){
              f7Tabs(
                style = "toolbar",
                animated = TRUE,
                swipeable = FALSE,
                formVerification(ID),
                formHydrographicProfile(ID)
              )
            } else if(input$resource == "Wetlands"){
              f7Tabs(
                style = "toolbar",
                animated = TRUE,
                swipeable = FALSE,
                formVerification(ID),
                formWaterChemistry(ID)
              )
            } else {
              f7Tabs(
                style = "toolbar",
                animated = TRUE,
                swipeable = FALSE,
                formVerification(ID),
                formWaterChemistry(ID)
              )
            }
        )
      )
    })
    
  
    # Remove Site Tab
    observeEvent(input$removeTab, {
      ID <- sub("[[:punct:][:blank:]]+", "_", input$site_id)
      
      removeF7Tab(
        id = "tabs",
        target = ID
      )
    })
    
    #Download handler for zip
    output$download <- downloadHandler(
      filename = function() {
        shpdf <- input$filemap
        paste0(input$tabs, "_Field_Data_", format(Sys.Date(), "%Y-%m-%d"),
               ".zip", sep="")
      },
      content = function(file) {
        tmp.path <- dirname(file)

        write.csv(VERIFICATION(), file.path(tmp.path, "VERIFICATION.csv"), row.names = FALSE)
        VERIFICATION <- paste0(tmp.path, "/VERIFICATION.csv")
        write.csv(WATERCHEMISTRY(), file.path(tmp.path, "WATERCHEMISTRY.csv"), row.names = FALSE)
        WATERCHEMISTRY <- paste0(tmp.path, "/WATERCHEMISTRY.csv")
        
        fs <- c(VERIFICATION, WATERCHEMISTRY)

        zip::zipr(zipfile = file, files = fs)
        if(file.exists(paste0(file, ".zip"))) {file.rename(paste0(file, ".zip"), file)}
      },
      contentType = "application/zip"
    )

    
    
    }
  )