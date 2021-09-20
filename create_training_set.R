## Initialize layout with full width
fluidRow(
  column(
    12,

    ## Widget to load labelled peak files
    h3("Step 1"),
    fileInput(
      "files_for_training_set",
      #"training_set_file",
      p("Upload a labelled qsession export (*.txt) or .zip of multiple labelled qsession exports (see Tab 1. Instructions on how to prepare these files). Or download and try our Sample Files."),
      multiple = FALSE,
      buttonLabel = "Browse...",
      placeholder = "No file selected",
      accept = c(
        ".txt",
        ".tsv",
        ".csv",
        ".zip"
      )
    ),

    ## Display error messages if the uploaded file(s) are incorrect
    verbatimTextOutput("files_for_training_set_sanitize_message_1"),

    ## Placeholder for reactive UI popups - radio buttons to confirm vendor
    fluidRow(id = "tab_2_placeholder_1"),

    ## Placeholder for reactive UI popups - check box of core features
    fluidRow(id = "tab_2_placeholder_2"),

    ## Placeholder for reactive UI popups - drop down of custom features
    fluidRow(id = "tab_2_placeholder_3"),

    ## Display error message if the uploaded file(s) are incorrect
    verbatimTextOutput("custom_features_sanitize_message_1"),

    ## Placeholder for reactive UI popups - reference standard
    fluidRow(id = "tab_2_placeholder_4"),

    ## Display error message if reference standard not associated with 1 component name
    verbatimTextOutput("reference_component_sanitize_message_1"),
    
    ## Placeholder for reactive UI popups - create training set
    fluidRow(id = "tab_2_placeholder_5"),

    ## Placeholder for reactive UI popups -
    fluidRow(id = "tab_2_placeholder_6")
  )
)
