source("global.R")

#### UI ----
shinyApp(
  ui = f7Page(
    tags$link(rel = "stylesheet", type = "text/css", href = "www/style.css"),
    title = "Collector",
    options = app_options,
    allowPWA = TRUE,
    f7SplitLayout(
      sidebar = f7Panel(
        id="menu",
        title = "Site List",
        side = "left",
        effect = "push",
        options = list(
          visibleBreakpoint = 1024
        ),
        f7PanelMenu(
          id = "tabs",
          inset = TRUE,
          outline = TRUE,
          f7PanelItem(
            title = "Add Site",
            tabName = "tabAddSite",
            icon = f7Icon("plusminus_circle_fill", style="font-size: 2rem")
          )
        )
      ),
      panel = tagList(
        f7Panel(
          title = "Options",
          side = "right",
          f7Radio(
            inputId = "dark",
            label = "Mode",
            choices = c("light", "dark"),
            selected = ifelse(app_options$dark, "dark", "light")
          ),
          effect = "floating"
        )
      ),
      navbar = f7Navbar(
        title = h1("Collector", style="font-family: Cascadia Code Light"),
        leftPanel = TRUE,
        rightPanel = tagList(
          tags$a(
            class = "link icon-only panel-open",
            `data-panel` = "right",
            f7Icon("gear_alt")
          )
        )
      ),
      # addSite content
          f7Items(
            f7Item(
              tabName = "tabAddSite",
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
                  tags$li("Choose a Resource Type, input a unique Site ID and click the", strong("Insert")," button."),
                  tags$li("A tab with the Site ID you input will be added to the sidebar panel. In the tab, relevant forms will be assembled for you."),
                  tags$li("Once field work is complete, navigate to the", strong("Export Data"),"tab to download the forms for that site."),
                  style="font-size: 16px"
                )),
              tags$ol(
                h3(strong("Best Practices:")),
                tags$ul(
                  tags$li("User's should regularly save forms to prevent data loss if connection is lost."),
                  tags$li("If the user's connection is disconnected or if the applications failed, lost data can be reloaded by adding the same Site ID as the lost data, navigate to the form of interest and press", strong("Load Data.")),
                  tags$li("If user's had more than the alotted lines of data saved, users must add in empty lines before loading data to allow saved data to appear."),
                  tags$li("User's cannot export a site without having previously opened the site from the site list. Therefore, it best to enter Site ID's as you go instead of all at once."),
                style="font-size: 16px"
                )
              )
            )
          )
    )
  ),
                
  server = function(input, output, session) {
    
    rv <- reactiveValues(tab_names=character(0))
    res <- reactiveValues(resource_names=character(0), label=character(0))
    
    # update mode
    observeEvent(input$dark, ignoreInit = TRUE, {
      updateF7App(
        options = list(
          dark = ifelse(input$dark == "dark", TRUE, FALSE)
        )
      )
    })
   
    
    #Brings user back to Verification form when selecting new site
    # observeEvent(input$tabs,{
    #   print(input$tabs)
    #   print(input$forms)
    #   ID <- trimws(sub(paste(X, collapse = "|"), "", input$forms))
    #   print(ID)
    #   updateF7Tabs(id="forms", selected = paste0("Verification", ID))
    # })

    # Remove Site if Permanently Remove dialog box is confirmed
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
      RESOURCE <- input$resource
      
      #Remove tabnames from reactiveValue
      rv$tab_names <- rv$tab_names[! rv$tab_names %in% ID]
      res$resource_names <- res$resource_names[! res$resource_names %in% RESOURCE]
      
      removeUI(
        selector = paste0("#Panel",ID),
        multiple = TRUE
      )
      removeUI(
        selector = paste0("#tab",ID)
      )
    })

    # Add Site Tab ----
    observeEvent(input$insertTab, {

      # shinyMobile code does not work well with punctuation
      ID <- sub("[[:punct:][:blank:]]+", "_", input$site_id)
      RESOURCE <- input$resource
      
      # Validates there are not two sites with the same Site ID
      if(input$insertTab > 1){
        if(ID %in% rv$tab_names){
        f7Toast(
          position = "center",
          text = HTML("<b>Can't have duplicate Site ID's.</b>"),
          closeButton=FALSE
        )
      validate(
        need(!(ID %in% rv$tab_names),
             "Can't have two Site ID's."))
        }
      }
      # progress bar ----
      showF7Preloader(type = "dialog", id = "loader")

      updateF7Preloader(
        id = "loader",
        title = "Building Forms...")

      #Adds tabnames to reactiveValue (for validate there are no duplicate site ids)
      rv$tab_names <- c(rv$tab_names, ID)
      res$resource_names <- c(res$resource_names, RESOURCE)
      
      FC <- c()
      if("Rivers and Streams" %in% res$resource_names){
        FC <- unique(append(FC, c("Verification", "Water Chemistry", "Fish Collection")))
      }
      if("Lakes and Ponds" %in% res$resource_names){
        FC <- unique(append(FC, c("Verification", "Water Chemistry", "Hydrographic Profile", "Fish Collection")))
      }
      if("Wetlands" %in% res$resource_names){
        FC <- unique(append(FC, c("Verification", "Water Chemistry", "Plant Collection", "Hydrology")))
      }
      if("Estuaries" %in% res$resource_names){
        FC <- unique(append(FC, c("Verification", "Water Chemistry", "Hydrographic Profile", "Fish Collection")))
      }
      
      # Resource type Icons and export choices
      if(input$resource == "Rivers and Streams"){
        ICON <- icon("water", style="font-size: 2rem")
      } else if(input$resource == "Lakes and Ponds"){
        ICON <- icon("ship", style="font-size: 2rem")
      } else if(input$resource == "Wetlands"){
        ICON <- icon("tree", style="font-size: 2rem")
      } else if(input$resource == "Estuaries"){
        ICON <- icon("sailboat", style="font-size: 2rem")
      }

      insertUI(
        selector = "#tabs",
        where = "afterEnd",
        ui = div(id = paste0("Panel",ID),
                 f7PanelMenu(id="tabs", #only way we could get input$tabs to work on newly input tabs
                             inset = FALSE,
                             outline = FALSE,
                             mode = "contacts",
                  f7PanelItem(
                   tabName = paste0("tab",ID),
                   title = ID,
                   icon = ICON,
                   active = TRUE
                 )
        ))
      )
        
      insertUI(
        selector = "#tabAddSite",
        where = "beforeBegin",
        ui = f7Item(
          tabName = paste0("tab",ID),
                if(input$resource == "Rivers and Streams"){
                  f7Tabs(
                    id="forms",
                    style = "toolbar",
                    animated = TRUE,
                    swipeable = FALSE,
                    formVerification(ID,RESOURCE),
                    formWaterChemistry(ID),
                    formFishCollection(ID),
                    formExport(ID,FC)
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
                    formFishCollection(ID),
                    formExport(ID,FC)
                  )
                } else if(input$resource == "Wetlands"){
                  f7Tabs(
                    id="forms",
                    style = "toolbar",
                    animated = TRUE,
                    swipeable = FALSE,
                    formVerification(ID,RESOURCE),
                    formPlantCollection(ID),
                    formWaterChemistry(ID),
                    formHydrology(ID),
                    formExport(ID,FC)
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
                    formFishCollection(ID),
                    formExport(ID,FC)
                  )
                }
            )
          )
      updateF7Panel(id = "menu")
      hideF7Preloader(id = "loader")
    })
    
    observeEvent(input$insertTab, {
      ID <- sub("[[:punct:][:blank:]]+", "_", input$site_id)
      RESOURCE <- input$resource
      
      req(ID %in% rv$tab_names, RESOURCE %in% res$resource_names)
      tabs <- rv$tab_names
      resource <- res$resource_names
      
      FC <- c()
      if("Rivers and Streams" %in% res$resource_names){
        FC <- unique(append(FC, c("Verification", "Water Chemistry", "Fish Collection")))
      }
      if("Lakes and Ponds" %in% res$resource_names){
        FC <- unique(append(FC, c("Verification", "Water Chemistry", "Hydrographic Profile", "Fish Collection")))
      }
      if("Wetlands" %in% res$resource_names){
        FC <- unique(append(FC, c("Verification", "Water Chemistry", "Plant Collection", "Hydrology")))
      }
      if("Estuaries" %in% res$resource_names){
        FC <- unique(append(FC, c("Verification", "Water Chemistry", "Hydrographic Profile", "Fish Collection")))
      }
      
      
      lapply(tabs, function(i) {
        removeUI(
          selector = paste0("#formsitechoice",i)
        )
      })

      lapply(tabs, function(i) {
        insertUI(
          selector = paste0("#exportchoicetitle",i),
          where = "beforeBegin",
          ui =
            div(id=paste0("formsitechoice",i),
            div(
                f7CheckboxGroup(
                  inputId = paste0("sitechoice",i),
                  label = "Choose which sites you want to save:",
                  choices = rev(tabs),
                  selected = i,
                  position = "left"
                ), style = "font-size:18px;"),
          div(
              f7CheckboxGroup(
                inputId = paste0("formchoice",i),
                label = "Choose which forms you want to save:",
                choices = FC,
                selected = "Verification",
                position = "left"
              ), style = "font-size:18px;")
        ))
      })
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

    PLANTCOLLECTION <- reactive({
      source("data/dataPlantCollection.R", local = TRUE)$value
    })
    
    HYDROLOGY <- reactive({
      source("data/dataHydrology.R", local = TRUE)$value
    })
    

    # Insert UI forms ----
    # Adds additional rows for many forms
    values <- reactiveValues(forms=0)
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
      } else if(input$forms==paste0("PlantCollection",ID)){

        n <- input[[paste0("Add", input$forms)]][1] + 20
        insertUI(
          selector = paste0("#Add",input$forms),
          where = "beforeBegin",
          ui = insertPlantCollection(ID,n)
        )
      }
      #Keeps track of how many times button is pressed for each ID and form
      values$forms[[paste0(input$forms)]] <- values$forms[[paste0(input$forms)]] + 1
      })
   

    # Comments ----
    # This code will work for all forms to create a popup window for comments.
    commentval <- reactiveValues(forms=0)
    lapply(1:150, function(i) {
      observeEvent(input[[paste0(input$forms,"_",i)]], {
        ID <- gsub(paste(X, collapse="|"), "", input$forms)
        n <- gsub(paste0(input$forms,"_", collapse = "|"), "", paste0(input$forms,"_",i))

        if(!(paste0(input$forms,"_",n) %in% names(commentval$forms))){
          commentval$forms[[paste0(input$forms,"_",n)]] <- 1
        }
        #prevents triggering when switching between forms
        req(commentval$forms[[paste0(input$forms,"_",n)]] == input[[paste0(input$forms,"_",n)]][1])
        
        updateF7Sheet(id = paste0(input$forms,i))
        
      commentval$forms[[paste0(input$forms,"_",n)]] <- commentval$forms[[paste0(input$forms,"_",n)]] + 1
      })
    })

    # Fish Counter ----
    fishval <- reactiveValues(val=0)
    lapply(1:150, function(i) {
      observeEvent(
        c(input[[paste0(input$forms,"fishless150",i)]],
          input[[paste0(input$forms,"fish300",i)]],
          input[[paste0(input$forms,"fish460",i)]],
          input[[paste0(input$forms,"fishgreat460",i)]]), {

            ID <- gsub(paste("FishCollection", collapse="|"), "", input$forms)

            if(!(input$forms %in% names(fishval$val))){
              fishval$val[[paste0(input$forms)]] <- 0
            }
            if(is.null(input[[paste0("AddFishCollection",ID)]][1])){
              N <- 15
            } else {
              N <- input[[paste0("AddFishCollection",ID)]][1] + 15
            }

            my.sum = 0
            for(i in 1:N){
              current = input[[paste0(input$forms,"fishless150",i)]] + input[[paste0(input$forms,"fish300",i)]] +
                input[[paste0(input$forms,"fish460",i)]] + input[[paste0(input$forms,"fishgreat460",i)]]

              # Update variable storing sum
              my.sum = my.sum + current
            }
            req(fishval$val[[paste0(input$forms)]] != my.sum)
            fishval$val[[paste0(input$forms)]] <- my.sum

            if(fishval$val[[paste0(input$forms)]] != 0){
              removeUI(
                selector = paste0("#fishbadge",ID)
              )
              insertUI(
                selector = paste0("#fishtitle",ID),
                where = "afterBegin",
                ui = div(id=paste0("fishbadge",ID),
                         icon("fish-fins", style="font-size: 2rem"),
                         f7Badge(fishval$val[[paste0(input$forms)]], color="green"))
              )
            }
          })
    })
    
    ## Hydrology Sources radiobutton update ----
    # lapply(watersource, function(i) {
    #   observeEvent(input[[paste0(i,"Rank",gsub(paste("Hydrology", collapse="|"), "", input$forms))]], {
    #     ID <- gsub(paste("Hydrology", collapse="|"), "", input$forms)
    #     updateF7Checkbox(
    #       inputId = paste0(i,"Present",ID),
    #       value = TRUE
    #     )
    #   })
    # 
    #   observeEvent(input[[paste0(i,"Present",gsub(paste("Hydrology", collapse="|"), "", input$forms))]], {
    #     req(input[[paste0(i,"Present",gsub(paste("Hydrology", collapse="|"), "", input$forms))]]==FALSE)
    #     
    #     ID <- gsub(paste("Hydrology", collapse="|"), "", input$forms)
    #     updateF7Radio(
    #       inputId = paste0(i,"Rank",ID),
    #       selected = character(0)
    #     )
    #   })
    # })
    
    
    # Tree Data popup----
    treeval <- reactiveValues(val=0)
    lapply(1:150, function(i) {
      observeEvent(input[[paste0("Tree",input$forms,"_",i)]], {
        ID <- gsub(paste("PlantCollection", collapse="|"), "", input$forms)
        n <- gsub(paste0(input$forms,"_", collapse = "|"), "", paste0(input$forms,"_",i))

        if(!(paste0("Tree",input$forms,"_",n) %in% names(treeval$val))){
          treeval$val[[paste0("Tree",input$forms,"_",n)]] <- 1
        }
        #prevents triggering when switching between forms
        req(treeval$val[[paste0("Tree",input$forms,"_",n)]] == input[[paste0("Tree",input$forms,"_",n)]][1])
        
        updateF7Sheet(id = paste0("Tree",input$forms,i))
        
        treeval$val[[paste0("Tree",input$forms,"_",n)]] <- treeval$val[[paste0("Tree",input$forms,"_",n)]] + 1
      })
    })

    # Export Data ----
    output$download <- downloadHandler(
      filename = function() {
        if(input[[paste0("exportchoice", gsub(paste(X, collapse = "|"), "", input$forms))]] == 1){
          paste0("Field_Data_", format(Sys.Date(), "%Y-%m-%d"),
                 ".zip", sep="")
        } else {
          paste0("Field_Data_", format(Sys.Date(), "%Y-%m-%d"),
                 ".xlsx", sep="")
        }
      },
      content = function(file) {
        ID <- gsub(paste('tab', collapse = "|"), "", input$tabs)
        
        if(input[[paste0("exportchoice", gsub(paste(X, collapse = "|"), "", input$forms))]] == 1){
        tmp.path <- dirname(file)
        
        if("Verification" %in% input[[paste0("formchoice",ID)]]){
          write.csv(VERIFICATION(), file.path(tmp.path, "Verification.csv"), row.names = FALSE)
        }
        if("Water Chemistry" %in% input[[paste0("formchoice",ID)]]){
          write.csv(WATERCHEMISTRY(), file.path(tmp.path, "Water Chemistry.csv"), row.names = FALSE)
        }
        if("Fish Collection" %in% input[[paste0("formchoice",ID)]]){
          write.csv(FISHCOLLECTION(), file.path(tmp.path, "Fish Collection.csv"), row.names = FALSE)
        }
        if("Hydrographic Profile" %in% input[[paste0("formchoice",ID)]]){
          write.csv(HYDROGRAPHICPROFILE(), file.path(tmp.path, "Hydrographic Profile.csv"), row.names = FALSE)
        }
        if("Plant Collection" %in% input[[paste0("formchoice",ID)]]){
          write.csv(PLANTCOLLECTION(), file.path(tmp.path, "Plant Collection.csv"), row.names = FALSE)
        }
        if("Hydrology" %in% input[[paste0("formchoice",ID)]]){
          write.csv(HYDROLOGY(), file.path(tmp.path, "Hydrology.csv"), row.names = FALSE)
        }
        

        fs <- c()
        for(i in input[[paste0("formchoice",ID)]]) {
          new <- paste0(tmp.path,"/",i,".csv")
          fs <- append(new, fs)
        }

        zip::zipr(zipfile = file, files = fs)
        if(file.exists(paste0(file, ".zip"))) {file.rename(paste0(file, ".zip"), file)}
        } else {
            wb <- createWorkbook(file)
            if("Verification" %in% input[[paste0("formchoice",ID)]]){
              addWorksheet(wb, "Verification")
              writeData(wb, x = VERIFICATION(), sheet = "Verification")
            }
            if("Water Chemistry" %in% input[[paste0("formchoice",ID)]]){
              addWorksheet(wb, "Water Chemistry")
              writeData(wb, x = WATERCHEMISTRY(), sheet = "Water Chemistry")
            }
            if("Fish Collection" %in% input[[paste0("formchoice",ID)]]){
              addWorksheet(wb, "Fish Collection")
              writeData(wb, x = FISHCOLLECTION(), sheet = "Fish Collection")
            }
            if("Hydrographic Profile" %in% input[[paste0("formchoice",ID)]]){
              addWorksheet(wb, "Hydrographic Profile")
              writeData(wb, x = HYDROGRAPHICPROFILE(), sheet = "Hydrographic Profile")
            }
            if("Plant Collection" %in% input[[paste0("formchoice",ID)]]){
              addWorksheet(wb, "Plant Collection")
              writeData(wb, x = PLANTCOLLECTION(), sheet = "Plant Collection")
            }
            if("Hydrology" %in% input[[paste0("formchoice",ID)]]){
              addWorksheet(wb, "Hydrology")
              writeData(wb, x = HYDROLOGY(), sheet = "Hydrology")
            }
          saveWorkbook(wb, file)
        }
      }
    )
    
    # Save/Load Data ----
    saveval <- reactiveValues(forms=0)
    observeEvent(input[[paste0("Save",input$forms)]], {
      ID <- gsub(paste(X, collapse="|"), "", input$forms)
      form <- X[vapply(X, function(x) grepl(x, input$forms), logical(1))]
      if(!(paste0("Save",input$forms) %in% names(saveval$forms))){
        saveval$forms[[paste0("Save",input$forms)]] <- 1
      }
      req(saveval$forms[[paste0("Save",input$forms)]] == input[[paste0("Save",input$forms)]][1])
      f7Toast(
        position = "center",
        text = HTML(paste0("<b>Saved ",form," Form for SiteID: ",ID,"</b>")),
        closeButton=FALSE
      )
      # f7Dialog(
      #   id = paste0("savedialog",input$forms),
      #   type = "confirm",
      #   title = paste0("Save Form?"),
      #   text = ""
      # )
      saveval$forms[[paste0("Save",input$forms)]] <- saveval$forms[[paste0("Save",input$forms)]] + 1
    })
    
    loadval <- reactiveValues(forms=0)
    observeEvent(input[[paste0("Load",input$forms)]], {
      ID <- gsub(paste(X, collapse="|"), "", input$forms)
      
      if(!(paste0("Load",input$forms) %in% names(loadval$forms))){
        loadval$forms[[paste0("Load",input$forms)]] <- 1
      }
      req(loadval$forms[[paste0("Load",input$forms)]] == input[[paste0("Load",input$forms)]][1])
      f7Dialog(
        id = paste0("loaddialog",input$forms),
        type = "confirm",
        title = paste0("Load Saved Data?"),
        text = ""
      )
      loadval$forms[[paste0("Load",input$forms)]] <- loadval$forms[[paste0("Load",input$forms)]] + 1
    })
    
    
    
    # Aggregate all form data. When the Submit button is clicked, save the form data
    observeEvent(input[[paste0("Save",input$forms)]], {
      #req(input[[paste0("savedialog",input$forms)]]==TRUE)
      
        ID <- gsub(paste(X, collapse="|"), "", input$forms)
        fields <- paste0(X[vapply(X, function(x) grepl(x, input$forms), logical(1))],"Fields")
        form <- X[vapply(X, function(x) grepl(x, input$forms), logical(1))]
      if(form=="Verification" | form=="Hydrology"){
         data <- sapply(paste0(get(fields),ID), function(i) input[[i]])
      } else if(form=="WaterChemistry"){
         N <- ifelse(is.null(input[[paste0("Add",form,ID)]][1]), 1, input[[paste0("Add",form,ID)]][1] + 1)
         n_seq <- seq(from = 1, to = N)
         data <- c(paste(rep(get(fields), each = length(n_seq)), n_seq, ID, sep = ""),
                   paste(input$forms, rep("Comment", each = length(n_seq)), n_seq, sep = ""))
         
         data <- sapply(data, function(i) input[[i]])
      } else if(form=="FishCollection"){
          N <- ifelse(is.null(input[[paste0("Add",form,ID)]][1]), 15, input[[paste0("Add",form,ID)]][1] + 15)
          n_seq <- seq(from = 1, to = N)
          data <-  c(paste0(rep(c("fishgear","fishingreach","fishgeneralcomments")),ID),
                     paste(input$forms, rep(c("fishless150","fish300","fish460","fishgreat460"), each = length(n_seq)), n_seq, sep = ""),
                     paste(rep(get(fields), each = length(n_seq)), n_seq, ID, sep = ""),
                     paste(input$forms, rep("Comment", each = length(n_seq)), n_seq, sep = ""))
          
          data <- sapply(data, function(i) input[[i]])
      } else if(form=="HydrographicProfile"){
        N <- ifelse(is.null(input[[paste0("Add",form,ID)]][1]), 15, input[[paste0("Add",form,ID)]][1] + 15)
        n_seq <- seq(from = 1, to = N)
        data <-  c(paste0(rep(get(fields)),ID),
                   paste(rep(c("ProfileUpcast","ProfileDepth","ProfileTemperature","ProfilePH","ProfileDO","ProfileConductivity"), each = length(n_seq)), n_seq, ID, sep = ""),
                   paste(input$forms, rep("Comment", each = length(n_seq)), n_seq, sep = ""))
        
        data <- sapply(data, function(i) input[[i]])
      }  else if(form=="PlantCollection"){
        N <- ifelse(is.null(input[[paste0("Add",form,ID)]][1]), 20, input[[paste0("Add",form,ID)]][1] + 20)
        n_seq <- seq(from = 1, to = N)
        data <-  c(paste0(rep(get(fields), each = length(n_seq)), n_seq, ID, sep = ""),
                   paste(input$forms, rep("Comment", each = length(n_seq)), n_seq, sep = ""))
        
        data <- sapply(data, function(i) input[[i]])
      } 
      saveData(data,input$forms)
    })

    
    observeEvent(input[[paste0("loaddialog",input$forms)]], {
      req(input[[paste0("loaddialog",input$forms)]]==TRUE)
      #add DateCol

      lapply(colnames(loadData(input$forms)), function(i) {
        updateF7Text(
          inputId = i,
          value = ifelse(loadData(input$forms)[[i]]=="TRUE",TRUE,
                         ifelse(loadData(input$forms)[[i]]=="FALSE",FALSE,
                                loadData(input$forms)[[i]]))
        )
        updateF7Select(
          inputId = i,
          selected = ifelse(loadData(input$forms)[[i]]=="TRUE",TRUE,
                            ifelse(loadData(input$forms)[[i]]=="FALSE",FALSE,
                                   loadData(input$forms)[[i]]))
         )
        updateF7Stepper(
            inputId = i,
            value = ifelse(loadData(input$forms)[[i]]=="TRUE",TRUE,
                           ifelse(loadData(input$forms)[[i]]=="FALSE",FALSE,
                                  loadData(input$forms)[[i]]))
          )
        updateF7TextArea(
          inputId = i,
          value = ifelse(loadData(input$forms)[[i]]=="TRUE",TRUE,
                         ifelse(loadData(input$forms)[[i]]=="FALSE",FALSE,
                                loadData(input$forms)[[i]]))
        )
        updateF7Toggle(
          inputId = i,
          checked = ifelse(loadData(input$forms)[[i]]=="TRUE",TRUE,
                           ifelse(loadData(input$forms)[[i]]=="FALSE",FALSE,
                                  loadData(input$forms)[[i]]))
        )
        updateF7Radio(
          inputId = i,
          selected = ifelse(loadData(input$forms)[[i]]=="TRUE",TRUE,
                            ifelse(loadData(input$forms)[[i]]=="FALSE",FALSE,
                                                 loadData(input$forms)[[i]]))
        )
      })
    })
    
    
    

    
    }
  )