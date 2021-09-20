## Initialize layout with full width
fluidRow(
  column(
    12,
    
    h3("Step 1"),
    
    ## Widget to upload BATL model (removed if the user generates model from tab 2)
    tags$div(
      fileInput(
        "upload_model",
        "Upload your model here or start back at Tab 1.",
        multiple = FALSE,
        buttonLabel = "Browse...",
        placeholder = "No BATL model selected",
        accept = c(".txt")
      ),
      id = "upload_model"
    ),
    ## Display error messages if the uploaded model is incorrect
    verbatimTextOutput("model_sanitize_message"),
    
    ## Empty placeholder for reactive UI popups - message that model already uploaded from previous tab
    fluidRow(id = "tab_4_placeholder_1"),
    
    h3("Step 2"),
    
    ## Widget to upload a single SRM/MRM quantification file or .zip of files
    tags$div(
      fileInput(
        "upload_annotate_file",
        "Upload your qsession export file.  File must be .txt and you need to export all columns.",
        multiple = FALSE,
        buttonLabel = "Browse...",
        placeholder = "No file selected",
        accept = c(
          ".txt",
          ".zip"
        )
      ),
      id = "upload_annotate_file"
    ),
    ## Display error messages if the uploaded file(s) are incorrect
    verbatimTextOutput("annotate_file_sanitize_message_1"),
    
    ## Display error messages if the uploaded file(s) are incorrect
    verbatimTextOutput("annotate_file_sanitize_message_2"),
    
    ## Placeholder for reactive UI popups - radio buttons to confirm vendor
    fluidRow(id = "tab_4_placeholder_2"),
    
    ## Display error messages if the uploaded file(s) are incorrect
    verbatimTextOutput("annotate_file_sanitize_message_3"),
    
    h3("Step 3"),
    
    ## Widget to upload a single SRM/MRM quantification file or .zip of files
    tags$div(
      radioButtons(
        "upload_category",
        HTML("Select the 2-letter <a href = 'https://www.lipidmaps.org/data/classification/LM_classification_exp.php' target='_blank'>LIPID MAPS</a> category of your files."),
        #"Select the 2-letter LIPID MAPS category of your files.",
        choices = c( "FA", "GL", "GP", "SP", "ST", "PR", "SL", "PK"),
        selected = "SP",
        inline = TRUE
      ),
      id = "upload_file"
    ),
    
    ## Empty placeholder for reactive UI popups - annotate peaks action button
    fluidRow(id = "tab_4_placeholder_3"),
    
    ## Empty placeholder for reactive UI popups - annotate peaks download button
    fluidRow(id = "tab_4_placeholder_4")
    
  )
)
