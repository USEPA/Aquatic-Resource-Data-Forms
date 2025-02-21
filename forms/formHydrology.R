# This is how you put checkboxes side by side
# f7Grid(
#   cols = 3,
#   div(style = "text-align: right;", 
#       f7Checkbox(
#         inputId = paste0("B1",ID),
#         label = "Water Marks (B1)"
#       ),
#       f7Checkbox(
#         inputId = paste0("B2",ID),
#         label = "Sediment Deposits (B2)"
#       ),
#       f7Checkbox(
#         inputId = paste0("B3",ID),
#         label = "Drift Deposits (B3)"
#       ))
# )


formHydrology <- function(ID) {
  f7Tab(
    title = "Hydrology",
    tabName = paste0("Hydrology",ID),
    icon = f7Icon("drop", style="font-size: 2rem"),
    f7BlockTitle(title = "Conditions at Assessment", size="large") %>% f7Align(side = "center"),
    f7Card(
      outline = TRUE,
      raised = TRUE,
     f7Grid(
        cols = 2,
        p(align = "center", strong("Current Weather")),
        p(align = "center", strong("Past Weather"))
      ),
      f7Grid(
        cols = 2,
        f7Text(
          inputId = paste0("HydrologyWeather", ID),
          label = NULL,
          placeholder = "XX.XX",
          style = list(outline = TRUE)
        ),
        f7Text(
          inputId = paste0("HydrologyPastWeather", ID),
          label = NULL,
          placeholder = "XX.XX",
          style = list(outline = TRUE)
        )
      ),
      f7Grid(
        cols = 2,
        f7Grid(
          cols = 2,
        p(align = "center", strong("Time of sampling")),
        p(align = "center", strong("Outflows present?")))
      ),
      f7Grid(
        cols = 2,
        f7Grid(
          cols = 2,
        f7Text(
          inputId = paste0("HydrologyTime", ID),
          label = NULL,
          placeholder = "HH:MM",
          style = list(outline = TRUE)
        ),
        div(id = "radio", class = "horizontal-radio",style = "display: flex; justify-content: center;", 
            f7Radio(
              inputId = paste0("Outflows", ID),
              label = NULL,
              choices = c("Y", "N"),
              selected = "N"))
        ),
        conditionalPanel(
          condition = paste0('input.Outflows',ID,'=="Y"'),
        f7Text(
          inputId = paste0("OutflowsDescribe", ID),
          label = NULL,
          placeholder = "Describe Outflows",
          style = list(outline = TRUE)
        ))),
     f7Grid(
       cols = 2,
       p(align = "center", strong("Tidal Stage"))),
     div(id = "radio", class = "horizontal-radio",style = "display: flex; justify-content: left;", 
         f7Radio(
           inputId = paste0("TidalStage",ID),
           label = NULL,
           choices = c("NA", "Incoming", "Outgoing", "Slack", "Flood"),
           selected = "NA",
           position = "left"
         )
     )),
    f7BlockTitle(title = "Water Sources that Influence Site Hydrology", size="large") %>% f7Align(side = "center"),
    f7Card(
      outline = TRUE,
      raised = TRUE,
      p(align = "left", strong("Identify ALL water sources that influence site hydrology (mark atleast one source).")),
      f7Grid(
        cols = 4,
        p(align = "right", strong("Present")),
        p(align = "center", strong(HTML("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Rank"))),
        p(align = "right", strong("Present")),
        p(align = "center", strong(HTML("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Rank"))),
        ),
      f7Grid(
        cols = 4,
        div(style = "text-align: right;",
            f7Checkbox(
                inputId = paste0("StreamPresent",ID),
                label = "Stream inflow",
                value = FALSE
              )),
        div(id = "radio", class = "horizontal-radio",style = "display: flex; justify-content: center;", 
        f7Radio(
          inputId = paste0("StreamRank",ID),
          label = NULL,
          choices = c("1", "2", "3"),
          selected = NULL,
          position = "left"
        )),
        div(style = "text-align: right;",
            f7Checkbox(
              inputId = paste0("SnowMeltPresent",ID),
              label = "Snow Melt",
              value = FALSE
            )),
        div(id = "radio", class = "horizontal-radio",style = "display: flex; justify-content: center;", 
            f7Radio(
              inputId = paste0("SnowMeltRank",ID),
              label = NULL,
              choices = c("1", "2", "3"),
              selected = NULL,
              position = "left"
            ))
        ),
        f7Grid(
          cols = 4,
          div(style = "text-align: right;",
              f7Checkbox(
                inputId = paste0("SpringsPresent",ID),
                label = "Springs (seeps)",
                value = FALSE
              )),
          div(id = "radio", class = "horizontal-radio",style = "display: flex; justify-content: center;", 
              f7Radio(
                inputId = paste0("SpringsRank",ID),
                label = NULL,
                choices = c("1", "2", "3"),
                selected = NULL,
                position = "left"
              )),
          div(style = "text-align: right;",
              f7Checkbox(
                inputId = paste0("OverbankFloodPresent",ID),
                label = "Overbank Flooding",
                value = FALSE
              )),
          div(id = "radio", class = "horizontal-radio",style = "display: flex; justify-content: center;", 
              f7Radio(
                inputId = paste0("OverbankFloodRank",ID),
                label = NULL,
                choices = c("1", "2", "3"),
                selected = NULL,
                position = "left"
              ))
          ),
      f7Grid(
        cols = 4,
        div(style = "text-align: right;",
            f7Checkbox(
              inputId = paste0("LakePresent",ID),
              label = "Lake",
              value = FALSE
            )),
        div(id = "radio", class = "horizontal-radio",style = "display: flex; justify-content: center;", 
            f7Radio(
              inputId = paste0("LakeRank",ID),
              label = NULL,
              choices = c("1", "2", "3"),
              selected = NULL,
              position = "left"
            )),
        div(style = "text-align: right;",
            f7Checkbox(
              inputId = paste0("EstuaryChannelPresent",ID),
              label = "Estuary-Tidal Channel",
              value = FALSE
            )),
        div(id = "radio", class = "horizontal-radio",style = "display: flex; justify-content: center;", 
            f7Radio(
              inputId = paste0("EstuaryChannelRank",ID),
              label = NULL,
              choices = c("1", "2", "3"),
              selected = NULL,
              position = "left"
            ))
      ),
      f7Grid(
        cols = 4,
        div(style = "text-align: right;",
            f7Checkbox(
              inputId = paste0("PrecipitationPresent",ID),
              label = "Precipitation (rain, snow)",
              value = FALSE
            )),
        div(id = "radio", class = "horizontal-radio",style = "display: flex; justify-content: center;", 
            f7Radio(
              inputId = paste0("PrecipitationRank",ID),
              label = NULL,
              choices = c("1", "2", "3"),
              selected = NULL,
              position = "left"
            )),
        div(style = "text-align: right;",
            f7Checkbox(
              inputId = paste0("EstuarySurgePresent",ID),
              label = "Estuary-Tidal Surge",
              value = FALSE
            )),
        div(id = "radio", class = "horizontal-radio",style = "display: flex; justify-content: center;", 
            f7Radio(
              inputId = paste0("EstuarySurgeRank",ID),
              label = NULL,
              choices = c("1", "2", "3"),
              selected = NULL,
              position = "left"
            ))
      ),
      f7Grid(
        cols = 4,
        div(style = "text-align: right;",
            f7Checkbox(
              inputId = paste0("GroundwaterPresent",ID),
              label = "Groundwater",
              value = FALSE
            )),
        div(id = "radio", class = "horizontal-radio",style = "display: flex; justify-content: center;", 
            f7Radio(
              inputId = paste0("GroundwaterRank",ID),
              label = NULL,
              choices = c("1", "2", "3"),
              selected = NULL,
              position = "left"
            )),
        div(style = "text-align: right;",
            f7Checkbox(
              inputId = paste0("OtherPresent",ID),
              label = "Other",
              value = FALSE
            )),
        div(id = "radio", class = "horizontal-radio",style = "display: flex; justify-content: center;", 
            f7Radio(
              inputId = paste0("OtherRank",ID),
              label = NULL,
              choices = c("1", "2", "3"),
              selected = NULL,
              position = "left"
            ))
      ),
      f7Grid(
        cols = 2,
      f7Grid(
        cols = 2,
        div(style = "text-align: right;",
            f7Checkbox(
              inputId = paste0("CulvertPresent",ID),
              label = "Culverts",
              value = FALSE
            )),
        div(id = "radio", class = "horizontal-radio",style = "display: flex; justify-content: center;", 
            f7Radio(
              inputId = paste0("CulvertRank",ID),
              label = NULL,
              choices = c("1", "2", "3"),
              selected = NULL,
              position = "left"
            ))),
        f7Text(
          inputId = paste0("OtherSourceComment",ID),
          label = NULL,
          placeholder = "Describe other source",
          value="",
          style = list(outline = TRUE)
        ))
    ),
        f7BlockTitle(title = "USACOE - Hydrology Indciators", size="large") %>% f7Align(side = "center"),
        f7Card(
          outline = TRUE,
          raised = TRUE,
          p(align = "left", "Fill in bubbles for all applicable indicators. Not all indicators will be found in every wetland."),
            p(align = "left", strong("Group A - Observation of Surface Water or Saturated Soils")),
            f7Grid(
              cols = 3,
              div(style = "text-align: right;", 
                  f7Checkbox(
                    inputId = paste0("A1",ID),
                    label = "Surface Water (A1)"
                  )),
              div(style = "text-align: right;", 
                  f7Checkbox(
                    inputId = paste0("A2",ID),
                    label = "High Water Table (A2)"
                  )),
              div(style = "text-align: right;", 
                  f7Checkbox(
                    inputId = paste0("A3",ID),
                    label = "Soil Saturation (A3)"
                  ))
              ),
            p(align = "left", strong("Group B - Evidence of Recent Innundation")),
            f7Grid(
              cols = 3,
              div(style = "text-align: right;", 
                  f7Checkbox(
                    inputId = paste0("B1",ID),
                    label = "Water Marks (B1)"
                  )),
              div(style = "text-align: right;", 
                  f7Checkbox(
                    inputId = paste0("B2",ID),
                    label = "Sediment Deposits (B2)"
                  )),
              div(style = "text-align: right;", 
                  f7Checkbox(
                    inputId = paste0("B3",ID),
                    label = "Drift Deposits (B3)"
                  ))
            ),
            f7Grid(
              cols = 3,
              div(style = "text-align: right;", 
                  f7Checkbox(
                    inputId = paste0("B4",ID),
                    label = "Algal mat or Crust (B4)"
                  )),
              div(style = "text-align: right;", 
                  f7Checkbox(
                    inputId = paste0("B5",ID),
                    label = "Iron Deposits (B5)"
                  )),
              div(style = "text-align: right;", 
                  f7Checkbox(
                    inputId = paste0("B6",ID),
                    label = "Surface Soil Cracks (B6)"
                  ))
            ),
            f7Grid(
              cols = 3,
              div(style = "text-align: right;", 
                  f7Checkbox(
                    inputId = paste0("B8",ID),
                    label = "Sparsely Veg. Concave Surf. (B8)"
                  )),
              div(style = "text-align: right;", 
                  f7Checkbox(
                    inputId = paste0("B9",ID),
                    label = "Water Stained Leaves (B9)"
                  )),
              div(style = "text-align: right;", 
                  f7Checkbox(
                    inputId = paste0("B10",ID),
                    label = "Drainage Patterns (B10)"
                  ))
            ),
            f7Grid(
              cols = 3,
              div(style = "text-align: right;", 
                  f7Checkbox(
                    inputId = paste0("B11",ID),
                    label = "Salt Crust (B11)"
                  )),
              div(style = "text-align: right;", 
                  f7Checkbox(
                    inputId = paste0("B12",ID),
                    label = "Biotic Crust (B12)"
                  )),
              div(style = "text-align: right;", 
                  f7Checkbox(
                    inputId = paste0("B13",ID),
                    label = "Aquatic Invertebrates (B13)"
                  ))
            ),
            f7Grid(
              cols = 3,
              div(style = "text-align: right;", 
                  f7Checkbox(
                    inputId = paste0("B14",ID),
                    label = "True Aquatic Plants (B14)"
                  )),
              div(style = "text-align: right;", 
                  f7Checkbox(
                    inputId = paste0("B15",ID),
                    label = "Marl Deposits (B15)"
                  )),
              div(style = "text-align: right;", 
                  f7Checkbox(
                    inputId = paste0("B16",ID),
                    label = "Moss Trim Lines (B16)"
                  ))
            ),
          
              p(align = "left", strong("Group C - Evidence of Current or Recent Soil Saturation")),
              f7Grid(
                cols = 3,
                div(style = "text-align: right;", 
                    f7Checkbox(
                      inputId = paste0("C1",ID),
                      label = HTML("Hydrogen Sulfide&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>Odor (C1)")
                    )),
                div(style = "text-align: right;", 
                    f7Checkbox(
                      inputId = paste0("C2",ID),
                      label = HTML("Dry Season Water&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>Table (C2)")
                    )),
                div(style = "text-align: right;", 
                    f7Checkbox(
                      inputId = paste0("C3",ID),
                      label = HTML("Oxidized Rhizopheres&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>along Living Roots (C3)")
                    ))
              ),
              f7Grid(
                cols = 3,
                div(style = "text-align: right;", 
                    f7Checkbox(
                      inputId = paste0("C4",ID),
                      label = HTML("Presence of Reduced&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>Iron (C4)")
                    )),
                div(style = "text-align: right;", 
                    f7Checkbox(
                      inputId = paste0("C5",ID),
                      label = HTML("<br/>Salt Deposits (C5)")
                    )),
                div(style = "text-align: right;", 
                    f7Checkbox(
                      inputId = paste0("C6",ID),
                      label = HTML("Recent Iron Reductions&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>in Tilled Soils (C6)")
                    ))
              ),
              f7Grid(
                cols = 3,
                div(style = "text-align: right;", 
                    f7Checkbox(
                      inputId = paste0("C7",ID),
                      label = "Thin Muck Surface (C7)"
                    )),
                div(style = "text-align: right;", 
                    f7Checkbox(
                      inputId = paste0("C8",ID),
                      label = "Crayfish Burrows (C8)"
                    )),
                div(style = "text-align: right;", 
                    f7Checkbox(
                      inputId = paste0("C10",ID),
                      label = "Fiddler Crab Burrows (C10)"
                    ))
              )
          ),
    
    p(align = "left", strong("Group D - Evidence from Other Site Conditions or Data")),
    f7Card(
      outline = TRUE,
      raised = TRUE,
    f7Grid(
      cols = 3,
      div(style = "text-align: right;", 
          f7Checkbox(
            inputId = paste0("D1",ID),
            label = HTML("Stunted or Stressed&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>Plants (D1)")
          )),
      div(style = "text-align: right;", 
          f7Checkbox(
            inputId = paste0("D2",ID),
            label = "Geomorphic Position (D2)"
          )),
      div(style = "text-align: right;", 
          f7Checkbox(
            inputId = paste0("D3",ID),
            label = "Shallow Aquitard (D3)"
          ))
      ),
    f7Grid(
      cols = 3,
    div(style = "text-align: right;", 
        f7Checkbox(
          inputId = paste0("D4",ID),
          label = "Microtopographic Relief (D4)"
        )),
    div(style = "text-align: right;", 
        f7Checkbox(
          inputId = paste0("D6",ID),
          label = "Raised Ant Mounds (D6)"
        )),
    div(style = "text-align: right;", 
        f7Checkbox(
          inputId = paste0("D7",ID),
          label = "Frost-Heave Hummocks (D7)"
        ))
    ),
    f7Grid(
      cols = 3,
      div(style = "text-align: right;", 
          f7Checkbox(
            inputId = paste0("D8",ID),
            label = "Sphagnum Moss (D8)"
          ))
      )),
      
    f7BlockTitle(title = "General Hydrology Observation and Notes", size="large") %>% f7Align(side = "center"),
    f7Card(
      outline = TRUE,
      raised = TRUE,
      p(align = "left", strong("Record any additional information and observations of the hydrology that may be useful for data interpretation.")),
      f7TextArea(
        inputId = paste0("HydrologyComments", ID),
        label = NULL,
        value = "",
        style = list(outline = TRUE)
      ))
    )}
