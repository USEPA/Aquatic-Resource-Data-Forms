library(shiny)
library(shinyMobile)
library(zip)

now_utc <- function() {
  now <- Sys.time()
  attr(now, "tzone") <- "UTC"
  now
}

#Available Form IDs
X <- c("Verification", "WaterChemistry", "FishCollection", "HydrographicProfile")

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
    title = "Collector",
    options = app_options,
    allowPWA = TRUE,
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
        title = h1("Collector", style="font-family: Cascadia Code Light"),
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
          icon = f7Icon("plusminus_circle_fill", style="font-size: 2rem"),
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
        div(id="instructions",
        h3(strong("Instructions:"))),
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
    
    
    rv <- reactiveValues(tab_names=character(0))
    
    # update mode
    observeEvent(input$dark, ignoreInit = TRUE, {
      updateF7App(
        options = list(
          dark = ifelse(input$dark == "dark", TRUE, FALSE)
        )
      )
    })
    
    #Brings user back to Verification form when selecting new site
    observeEvent(input$tabs,{
      
      ID <- trimws(sub(paste(X, collapse = "|"), "", input$forms))
      updateF7Tabs(id="forms", selected = paste0("Verification", ID))
    })

    # Remove Site Tab
    observeEvent(input$removeTab, {
    req(length(rv$tab_names)>0)
    f7Dialog(
      id = "confirm_dialog",
      type = "confirm",
      title = paste0("Permanently Remove ", input$site_id,"?"),
      text = ""
    )
    })
    
    observeEvent(input$confirm_dialog, {
      req(input$confirm_dialog==TRUE)
      ID <- sub("[[:punct:][:blank:]]+", "_", input$site_id)
      #Remove tabnames from reactiveValue
      rv$tab_names <- rv$tab_names[! rv$tab_names %in% ID]
      
      removeF7Tab(
        id = "tabs",
        target = ID
      )
    })
    
    # Add Site Tab ----
    observeEvent(input$insertTab, {
      
      # shinyMobile code does not work well with punctuation
      ID <- sub("[[:punct:][:blank:]]+", "_", input$site_id)
      RESOURCE <- input$resource
      
      if(input$insertTab > 1){
      validate(
        need(!(ID %in% rv$tab_names),
             "Can't have two Site ID's."))
      }
      # progress bar ----
      showF7Preloader(type = "dialog", id = "loader")
      
      updateF7Preloader(
        id = "loader",
        title = "Building Forms...")
      
      #Adds tabnames to reactiveValue (for validate there are no duplicate site ids)
      rv$tab_names <- c(rv$tab_names, ID)
      
      ICON <- if(input$resource == "Rivers and Streams"){
          icon("water", style="font-size: 2rem")
      } else if(input$resource == "Lakes and Ponds"){
          icon("ship", style="font-size: 2rem")
      } else if(input$resource == "Wetlands"){
          icon("tree", style="font-size: 2rem")
      } else if(input$resource == "Estuaries"){ 
          icon("sailboat", style="font-size: 2rem")
      }
      
      insertF7Tab(
        id = "tabs",
        position = "after",
        target = "tabAddSite",
        select = FALSE,
        tab = f7Tab(
          tabName = ID,
          icon = ICON,
          #export data button to show when form is chosen (app is reliant on input$forms)
          conditionalPanel(
            condition = "input.forms &&
                         input.forms.indexOf(input.tabs) > -1",
          f7Block(
            f7DownloadButton("download", "Export Data")
          )),
            #add the forms for each Resource Type here
            if(input$resource == "Rivers and Streams"){
              f7Tabs(
                id="forms",
                style = "toolbar",
                animated = TRUE,
                swipeable = FALSE,
                formVerification(ID,RESOURCE),
                formWaterChemistry(ID),
                formFishCollection(ID) ,
                formHydrology(ID)
              )
            } else if(input$resource == "Lakes and Ponds"){
              f7Tabs(
                id="forms",
                style = "toolbar",
                animated = TRUE,
                swipeable = FALSE,
                formVerification(ID,RESOURCE),
                formWaterChemistry(ID),
                formHydrographicProfile(ID),
                formFishCollection(ID) 
              )
            } else if(input$resource == "Wetlands"){
              f7Tabs(
                id="forms",
                style = "toolbar",
                animated = TRUE,
                swipeable = FALSE,
                formVerification(ID,RESOURCE),
                formWaterChemistry(ID),
                formHydrology(ID)
              )
            } else if(input$resource == "Estuaries"){ 
              f7Tabs(
                id="forms",
                style = "toolbar",
                animated = TRUE,
                swipeable = FALSE,
                formVerification(ID,RESOURCE),
                formWaterChemistry(ID),
                formHydrographicProfile(ID),
                formFishCollection(ID) 
              )
            }
        )
      ) 
      hideF7Preloader(id = "loader")
    })
    
    # data Reactives ----
    VERIFICATION <- reactive({
      source("data/dataVerification.R", local = TRUE)$value
    })
    
    WATERCHEMISTRY <- reactive({
      source("data/dataWaterChemistry.R", local = TRUE)$value
    })

    HYDROGRAPHICPROFILE <- reactive({
      source("data/dataHydrographicProfile.R", local = TRUE)$value
    })
     
    FISHCOLLECTION <- reactive({
      source("data/dataFishCollection.R", local = TRUE)$value
    })
    
    
    values <- reactiveValues(forms=0)
   
    # Insert UI forms ----
    observeEvent(input[[paste0("Add", input$forms)]], {
      
      if(!(input$forms %in% names(values$forms))){
        values$forms[[paste0(input$forms)]] <- 1
      }
      #prevents triggering when switching between forms
      req(values$forms[[paste0(input$forms)]] == input[[paste0("Add", input$forms)]][1])
      
      ID <- gsub(paste(X, collapse="|"), "", input$forms)
      if(input$forms==paste0("FishCollection",ID)){
        
        n <- input[[paste0("Add", input$forms)]][1] + 15
        insertUI(
          selector = paste0("#Add",input$forms),
          where = "beforeBegin",
          ui = insertFishCollection(ID,n)
        )
      } else if(input$forms==paste0("WaterChemistry",ID)){
        
        n <- input[[paste0("Add", input$forms)]][1] + 1
        insertUI(
          selector = paste0("#Add",input$forms),
          where = "beforeBegin",
          ui = insertWaterChemistry(ID,n)
        )
      } else if(input$forms==paste0("HydrographicProfile",ID)){
        
        n <- input[[paste0("Add", input$forms)]][1] + 15
        insertUI(
          selector = paste0("#Add",input$forms),
          where = "beforeBegin",
          ui = insertHydrographicProfile(ID,n)
        )
      }
      #Keeps track of how many times button is pressed for each ID and form
      values$forms[[paste0(input$forms)]] <- values$forms[[paste0(input$forms)]] + 1
      })
    
    
    # Comments ----
    # This code will work for all forms to create a popup window for comments.
    commentval <- reactiveValues(forms=0)
    lapply(1:100, function(i) {
      observeEvent(input[[paste0(input$forms,"_",i)]], {
        ID <- gsub(paste(X, collapse="|"), "", input$forms)
        n <- gsub(paste0(input$forms,"_", collapse = "|"), "", paste0(input$forms,"_",i))
        
        if(!(paste0(input$forms,"_",n) %in% names(commentval$forms))){
          commentval$forms[[paste0(input$forms,"_",n)]] <- 1
        }
        #prevents triggering when switching between forms
        req(commentval$forms[[paste0(input$forms,"_",n)]] == input[[paste0(input$forms,"_",n)]][1])
        
      f7Popup(
        id = paste0(input$forms,"_popup_",i),
        title = paste0("Comment ",i),
        f7Block(
          f7TextArea(inputId = paste0(input$forms,"_Comment_",i),
                     value="",
                     label = NULL,
                     style = list(outline = TRUE))
        )
      )
      commentval$forms[[paste0(input$forms,"_",n)]] <- commentval$forms[[paste0(input$forms,"_",n)]] + 1
      })
    })
    
    
    # Export Data ----
    output$download <- downloadHandler(
      filename = function() {
        shpdf <- input$filemap
        paste0(input$tabs, "_Field_Data_", format(Sys.Date(), "%Y-%m-%d"),
               ".zip", sep="")
      },
      content = function(file) {
        tmp.path <- dirname(file)
        ID <- trimws(sub(paste(X, collapse = "|"), "", input$forms))
        
        if(input[[paste0("resource_", ID)]] == "Rivers and Streams"){
          write.csv(VERIFICATION(), file.path(tmp.path, "VERIFICATION.csv"), row.names = FALSE)
          VERIFICATION <- paste0(tmp.path, "/VERIFICATION.csv")
          write.csv(WATERCHEMISTRY(), file.path(tmp.path, "WATERCHEMISTRY.csv"), row.names = FALSE)
          WATERCHEMISTRY <- paste0(tmp.path, "/WATERCHEMISTRY.csv")
          write.csv(FISHCOLLECTION(), file.path(tmp.path, "FISHCOLLECTION.csv"), row.names = FALSE)
          FISHCOLLECTION <- paste0(tmp.path, "/FISHCOLLECTION.csv")
          
          fs <- c(VERIFICATION, WATERCHEMISTRY, FISHCOLLECTION)
        } else if(input[[paste0("resource_", ID)]] == "Lakes and Ponds"){
          write.csv(VERIFICATION(), file.path(tmp.path, "VERIFICATION.csv"), row.names = FALSE)
          VERIFICATION <- paste0(tmp.path, "/VERIFICATION.csv")
          write.csv(WATERCHEMISTRY(), file.path(tmp.path, "WATERCHEMISTRY.csv"), row.names = FALSE)
          WATERCHEMISTRY <- paste0(tmp.path, "/WATERCHEMISTRY.csv")
          write.csv(HYDROGRAPHICPROFILE(), file.path(tmp.path, "HYDROGRAPHICPROFILE.csv"), row.names = FALSE)
          HYDROGRAPHICPROFILE <- paste0(tmp.path, "/HYDROGRAPHICPROFILE.csv")
          write.csv(FISHCOLLECTION(), file.path(tmp.path, "FISHCOLLECTION.csv"), row.names = FALSE)
          FISHCOLLECTION <- paste0(tmp.path, "/FISHCOLLECTION.csv") 
          
          fs <- c(VERIFICATION, WATERCHEMISTRY, HYDROGRAPHICPROFILE, FISHCOLLECTION)
        } else if(input[[paste0("resource_", ID)]] == "Wetlands"){
          write.csv(VERIFICATION(), file.path(tmp.path, "VERIFICATION.csv"), row.names = FALSE)
          VERIFICATION <- paste0(tmp.path, "/VERIFICATION.csv")
          write.csv(WATERCHEMISTRY(), file.path(tmp.path, "WATERCHEMISTRY.csv"), row.names = FALSE)
          WATERCHEMISTRY <- paste0(tmp.path, "/WATERCHEMISTRY.csv")
          
          fs <- c(VERIFICATION, WATERCHEMISTRY)
        } else if(input[[paste0("resource_", ID)]] == "Estuaries"){
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