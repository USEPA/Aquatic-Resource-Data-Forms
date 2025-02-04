formHydrology <- function(ID) {
  f7Tab(
    title = "Hydrology",
    tabName = paste0("Hydrology",ID),
    icon = f7Icon("drop"),
    f7BlockTitle(title = "Conditions at Assessment", size="large") %>% f7Align(side = "center"),
    f7Card(
      outline = TRUE,
      raised = TRUE,
      f7Grid(
        cols = 2,
        p(align = "center", strong("Time of Sampling")),
        p(align = "center", strong("Tidal Stage"))
      ),
      f7Grid(
        cols = 2,
        f7Text(
          inputId = paste0("HydrologyTime_", ID),
          label = NULL,
          placeholder = "HH:MM",
          style = list(outline = TRUE)
        )),
          f7Grid(
            cols = 2,
            p(align = "center", strong("Current Weather")),
            p(align = "center", strong("Past Weather"))
            ),
      f7Grid(
        cols = 2,
        f7Text(
          inputId = paste0("HydrologyWeather_", ID),
          label = NULL,
          placeholder = "XX.XX",
          style = list(outline = TRUE)
        ),
        f7Text(
          inputId = paste0("HydrologyPastWeather_", ID),
          label = NULL,
          placeholder = "XX.XX",
          style = list(outline = TRUE)
        )
      ),
      f7Grid(
        cols = 2,
        f7Grid(
          cols = 3,
          p(align = "right", strong("Outflows Present?")),
        f7Radio(
          inputId = paste0("Outflows_", ID),
          label = NULL,
          choices = c("Y", "N"),
         # selected = "N",
          style = list(
            inset = TRUE
          )
        )),
        f7Grid(
          cols = 1,
        f7Text(
          inputId = paste0("OutflowsDescribe_", ID),
          label = NULL,
          placeholder = "Describe Outflows",
          style = list(outline = TRUE)
        )))),
    
    f7BlockTitle(title = "Conditions at Assessment", size="large") %>% f7Align(side = "center"),
    f7Card(
      outline = TRUE,
      raised = TRUE,
      p(align = "left", strong("Identify ALL water sources that influence site hydrology (mark atleast one source).")),
      f7Grid(
        cols = 4,
        p(align = "center", strong("")),
        p(align = "center", strong("Present")),
        p(align = "center", strong("")),
        p(align = "center", strong("Present"))
        ),
      f7Grid(
        cols = 4,
          p(align = "right", HTML("<b>Stream Inflow <br/> (creeks, rivers)</b>")),
        div(style = "text-align: center;", 
            f7Checkbox(
              inputId = paste0("InflowStreamPresent_",ID),
              label = NULL,
              value = FALSE
            )),
        p(align = "right", strong("Snow Melt")),
        div(style = "text-align: center;", 
            f7Checkbox(
              inputId = paste0("InflowSnowMeltPresent_",ID),
              label = NULL,
              value = FALSE
            )),
        
        
        
        
        p(align = "right", HTML("<b>Springs <br/> (seeps)</b>")),
        div(style = "text-align: center;", 
            f7Checkbox(
              inputId = paste0("InflowSpringsPresent_",ID),
              label = NULL,
              value = FALSE
            )),
        p(align = "right", HTML("<b>Overbank <br/> Flooding</b>")),
        div(style = "text-align: center;", 
            f7Checkbox(
              inputId = paste0("InflowOverbankPresent_",ID),
              label = NULL,
              value = FALSE
            )),
        
        
        
        
        
        
        
        
        
        )
      )
        
        
        
        
      )}