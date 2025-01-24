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
  theme = "md",
  dark = FALSE,
  #preloader = TRUE,
  # color = "white",
  # fill = "green",
  navbar = list(
    # hideOnPageScroll = TRUE,
    mdCenterTitle = TRUE
  )
)
#### UI ----
shinyApp(
  ui = f7Page(
    title = "Mobile Field Forms",
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
        title = h2("Mobile Field Forms"),
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
         # f7BlockTitle(title = "Add or Remove Site Tab", size="medium") %>% f7Align(side = "center"),
      f7Card(
            outline = TRUE,
            raised = TRUE,
      f7Grid(
        cols = 2,
        h2(align = "center", strong("Resource Type")),
        h2(align = "center", strong("Site ID"))
        ),
      f7Grid(
        cols = 2,
      f7Select(
        "resource",
        label = NULL,
        selected = "Rivers and Streams",
        choices = c("Rivers and Streams",
                    "Lakes and Ponds",
                    "Wetlands",
                    "Estuaries"),
        style = list(outline = TRUE)),
      f7Text(
        "site_id",
        label = NULL,
        placeholder = "Site ID",
        style = list(outline = TRUE)
      )),
      f7Grid(
        cols = 2,
        f7Segment(
          f7Button("insertTab", "Insert", color = "blue"),
          f7Button("removeTab", "Remove", color = "red")
          )
      )),
      tags$ol(
        h3(strong("Instructions:")),
        tags$ul(
          tags$li("Choose Resource Type, input a Site ID and click the", strong("Insert")," button."),
          tags$li("A tab with the Site ID you input will be added to the navbar. In the tab relevant forms will be assembled for you."),
          tags$li("Once field work is complete, click the ",strong("Export Data")," button to download a .zip file of all of the forms for that site."),
          style="font-size: 16px"
        ))
      ))
    )
  ),
  server = function(input, output, session) {
    
    vals <- reactiveValues(count = 15)
    observeEvent(c(input$AddFish, input$AddLine), {
      vals$count <- vals$count + 5})
    
    # update mode
    observeEvent(input$dark, ignoreInit = TRUE, {
      updateF7App(
        options = list(
          dark = ifelse(input$dark == "dark", TRUE, FALSE)
        )
      )
    })
    
    #### Add Site Tab ----
    observeEvent(input$insertTab, {
      # shinyMobile code does not work well with punctuation
      ID <- sub("[[:punct:][:blank:]]+", "_", input$site_id)
      
      insertF7Tab(
        id = "tabs",
        position = "after",
        target = "tabAddSite",
        select = TRUE,
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
              formWaterChemistry(ID),
              formFishCollection(ID) 
              )
            } else if(input$resource == "Lakes and Ponds"){
              f7Tabs(
                style = "toolbar",
                animated = TRUE,
                swipeable = FALSE,
                formVerification(ID),
                formWaterChemistry(ID),
                formHydrographicProfile(ID),
                formFishCollection(ID) 
              )
            } else if(input$resource == "Wetlands"){
              f7Tabs(
                style = "toolbar",
                animated = TRUE,
                swipeable = FALSE,
                formVerification(ID),
                formWaterChemistry(ID)
              )
            } else if(input$resource == "Estuaries"){ 
              f7Tabs(
                style = "toolbar",
                animated = TRUE,
                swipeable = FALSE,
                formVerification(ID),
                formWaterChemistry(ID),
                formHydrographicProfile(ID),
                formFishCollection(ID) 
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
    
    
    #### data Reactives ----
    VERIFICATION <- reactive({
      source("data/dataVerification.R", local = TRUE)$value
    })
    
    WATERCHEMISTRY <- reactive({
      source("data/dataWaterChemistry.R", local = TRUE)$value
    })
    
    HYDROGRAPHICPROFILE <- reactive({
      req(vals)
      source("data/dataHydrographicProfile.R", local = TRUE)$value
    })
    
    FISHCOLLECTION <- reactive({
      req(vals)
      source("data/dataFishCollection.R", local = TRUE)$value
    })
    
    
    ##### Download----
    output$download <- downloadHandler(
      filename = function() {
        shpdf <- input$filemap
        paste0(input$tabs, "_Field_Data_", format(Sys.Date(), "%Y-%m-%d"),
               ".zip", sep="")
      },
      content = function(file) {
        tmp.path <- dirname(file)
        if(input$resource == "Rivers and Streams"){
         write.csv(VERIFICATION(), file.path(tmp.path, "VERIFICATION.csv"), row.names = FALSE)
         VERIFICATION <- paste0(tmp.path, "/VERIFICATION.csv")
         write.csv(WATERCHEMISTRY(), file.path(tmp.path, "WATERCHEMISTRY.csv"), row.names = FALSE)
         WATERCHEMISTRY <- paste0(tmp.path, "/WATERCHEMISTRY.csv")
         write.csv(FISHCOLLECTION(), file.path(tmp.path, "FISHCOLLECTION.csv"), row.names = FALSE)
         FISHCOLLECTION <- paste0(tmp.path, "/FISHCOLLECTION.csv") 
         fs <- c(VERIFICATION, WATERCHEMISTRY, FISHCOLLECTION)
       } else if(input$resource == "Lakes and Ponds"){
         write.csv(VERIFICATION(), file.path(tmp.path, "VERIFICATION.csv"), row.names = FALSE)
         VERIFICATION <- paste0(tmp.path, "/VERIFICATION.csv")
         write.csv(WATERCHEMISTRY(), file.path(tmp.path, "WATERCHEMISTRY.csv"), row.names = FALSE)
         WATERCHEMISTRY <- paste0(tmp.path, "/WATERCHEMISTRY.csv")
         write.csv(HYDROGRAPHICPROFILE(), file.path(tmp.path, "HYDROGRAPHICPROFILE.csv"), row.names = FALSE)
         HYDROGRAPHICPROFILE <- paste0(tmp.path, "/HYDROGRAPHICPROFILE.csv")
         write.csv(FISHCOLLECTION(), file.path(tmp.path, "FISHCOLLECTION.csv"), row.names = FALSE)
         FISHCOLLECTION <- paste0(tmp.path, "/FISHCOLLECTION.csv") 
         fs <- c(VERIFICATION, WATERCHEMISTRY, HYDROGRAPHICPROFILE, FISHCOLLETION)
       } else if(input$resource == "Wetlands"){
         write.csv(VERIFICATION(), file.path(tmp.path, "VERIFICATION.csv"), row.names = FALSE)
         VERIFICATION <- paste0(tmp.path, "/VERIFICATION.csv")
         write.csv(WATERCHEMISTRY(), file.path(tmp.path, "WATERCHEMISTRY.csv"), row.names = FALSE)
         WATERCHEMISTRY <- paste0(tmp.path, "/WATERCHEMISTRY.csv")
         
         fs <- c(VERIFICATION, WATERCHEMISTRY)
       } else if(input$resource == "Estuaries"){
         write.csv(VERIFICATION(), file.path(tmp.path, "VERIFICATION.csv"), row.names = FALSE)
         VERIFICATION <- paste0(tmp.path, "/VERIFICATION.csv")
         write.csv(WATERCHEMISTRY(), file.path(tmp.path, "WATERCHEMISTRY.csv"), row.names = FALSE)
         WATERCHEMISTRY <- paste0(tmp.path, "/WATERCHEMISTRY.csv")
         write.csv(HYDROGRAPHICPROFILE(), file.path(tmp.path, "HYDROGRAPHICPROFILE.csv"), row.names = FALSE)
         HYDROGRAPHICPROFILE <- paste0(tmp.path, "/HYDROGRAPHICPROFILE.csv")
         write.csv(FISHCOLLECTION(), file.path(tmp.path, "FISHCOLLECTION.csv"), row.names = FALSE)
         FISHCOLLECTION <- paste0(tmp.path, "/FISHCOLLECTION.csv") 
         fs <- c(VERIFICATION, WATERCHEMISTRY, HYDROGRAPHICPROFILE, FISHCOLLECTION)
       }

        zip::zipr(zipfile = file, files = fs)
        if(file.exists(paste0(file, ".zip"))) {file.rename(paste0(file, ".zip"), file)}
      },
      contentType = "application/zip"
    )

    
    
    }
  )