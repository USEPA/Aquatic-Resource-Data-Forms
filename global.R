library(shiny)
library(shinyMobile)
library(zip)
library(openxlsx)

addResourcePath(prefix = 'www', directoryPath = './www')

now_utc <- function() {
  now <- Sys.time()
  attr(now, "tzone") <- "UTC"
  now
}

saveData <- function(data,form) {
  data <- as.data.frame(t(data))
  # data <- data[ , apply(data, 2, function(x) !any(x=="NULL"))]
  responses <<- data
  newname <- paste0("responses",form)
  assign(newname, responses, inherits=TRUE)
}

loadData <- function(form) {
  if (exists("responses")) {
    get(paste0("responses",form))
  }
}

#Available Form IDs
X <- c("Verification", "WaterChemistry", "FishCollection", "HydrographicProfile", "PlantCollection", "Hydrology", "Export")

VerificationFields <- c("siteId","dateCol","siteName","resource","latitude","longitude","fishlead","botanist","crewlead","crewmember1","crewmember2","crewmember3","crewmember4","crewmember5","crewmember6","generalComments","directions")
WaterChemistryFields <- c("LocationChem","DepthChem","DOChem","pHChem","ConductivityChem","TemperatureChem","DepthUnits","DOUnits","ConductivityUnits","TemperatureUnits")
FishCollectionFields <- c("fishname","vouchertag","voucherphoto","hybrid","introduced", "voucherretained")
HydrographicProfileFields <- c("ProfileDepthUnit","ProfileTempUnit","ProfileDOUnit","ProfileCONDUnit","stationdepth","cleartobottom","secchidepth","cablelength")
PlantCollectionFields <- c("plantname","unknown","tree","heightclass","percentcover","treecoverless0.5","treecover0.5_2","treecover2_5","treecover5_15","treecover15_30","treecovergreat30","treecount5_10","treecount11_25","treecount26_50","treecount51_75","treecount76_100","treecount101_200","treecount200")
HydrologyFields <- c("HydrologyWeather","HydrologyPastWeather","HydrologyTime","Outflows","OutflowsDescribe","TidalStage","OtherSourceComment","HydrologyComments",
                     "StreamRank","SnowMeltRank","SpringsRank","OverbankFloodRank","LakeRank","EstuaryChannelRank","PrecipitationRank","EstuarySurgeRank","GroundwaterRank","OtherRank","CulvertRank",
                     "A1","A2","A3","B1","B2","B3","B4","B5","B6","B8","B9","B10","B11","B12","B13","B14","B15","B16",
                     "C1","C2","C3","C4","C5","C6","C7","C8","C10","D1","D2","D3","D4","D6","D7","D8")

#Water sources for Hydrology Form
watersource <- c("Stream","SnowMelt","Springs","OverbankFlood","Lake","EstuaryChannel","Precipitation","EstuarySurge","Groundwater","Culvert","Other")


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
  #preloader = TRUE,
  # color = "white",
  # fill = "green",
  navbar = list(
    # hideOnPageScroll = TRUE,
    mdCenterTitle = TRUE
  )
)