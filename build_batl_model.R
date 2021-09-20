## Initialize layout with full width
fluidRow(
  column(
    12,
    h4(id="tab3header",tags$b("Please create your training set in tab 2 to proceed with building the BATL model.")),
    ## Placeholder for reactive UI popups - action button to build model
    fluidRow(id = "tab_3_placeholder_1"),

    ## Placeholder for reactive UI popups - action button to download model
    fluidRow(id = "tab_3_placeholder_2"),

    ## Placeholder for reactive UI popups -
    fluidRow(id = "tab_3_placeholder_3")
  )
)
