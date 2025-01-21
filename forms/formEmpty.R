formEmpty <- function(ID) {
  f7Tab(
    title = "tabTitle",
    tabName = "tabName",
    f7BlockTitle(title = "Title", size="large") %>% f7Align(side = "center"),
    f7Card(
      outline = TRUE,
      raised = TRUE
    )
  )
}