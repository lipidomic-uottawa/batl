## Initialize layout with full width
fluidRow(
  column(12,

    ## About description.


    tabsetPanel(
      id = 'tabs2',
      tabPanel(
        "Quick Start",value="Quick-Start",
        h3(tags$b("Overview of BATL")),br(),
		p("BATL (",em("Bayesian annotations for targeted lipidomics"),") is a Gaussian naïve Bayes classifier for targeted lipidomics. BATL annotates peak identities according to user-specified peak features such as retention, intensity, and/or shape."),br(),
		p(tags$b("NOTE: Every time you wish to upload a new training set, you must reload ", tags$a(href="http://complimet.ca/batl/", onclick="window.open(window.location.href,'_blank');","http://complimet.ca/batl/")," and refresh your browser.")),br(),

        h3(tags$b("Quick Start: How to use BATL")),br(),
		p(tags$img(src = "figure1webD.png", width = "100%")
		),
        h4(tags$b("Tab 2 – Create Training Dataset",br(),"Prepare your labelled lipidomic datasets")),
        p(
          tags$ol(
            tags$li(tags$span(
              "In Sciex MultiQuant software, open a qsession for a dataset that you have fully analyzed.",br(),
			  em("Note your final training datasets should contain at least 24 unique samples. You will be able to upload multiple .gsession files as a zip file and combine them into your training dataset following the instructions below.")
            )),
            tags$li(tags$span(
              "Export the .qsession analysis. Ensure you have selected and exported ",em(tags$b(tags$u("all")))," columns as a tab-delimited text (.txt) formatted file.",br(),"File > Export > Results Table…",br(),"Under Format > choose MultiQuant",br(),"Under Columns > choose Export all columns",br(),"Under Rows > choose Export all rows",br(),"Name your file export and save it."
            )),
            tags$li(tags$span(
              "Lipid identities you wish to use to annotate each peak in your training datasets have to be verified prior to upload.  BATL will annotate all subsequent datasets according to these identities."
            )),
            tags$li(tags$span(
              "Open the .txt quantification file,",tags$b("add a column called \"Lipid_identifier\" (case-sensitive) to the very end of each training dataset."),"This will be column CJ. (If it is not CJ then you have not exported ",em(tags$b(tags$u("all")))," columns."
            )),
            tags$li(tags$span(
              "Input the identities you wish to use to annotate your lipid species into the \"Lipid_identifier\" column. If you do not know the identity of a peak in your training set, simply leave that cell in column CJ blank."
            )),
            tags$li(tags$span(
              "Save these file(s) as tab-delimited text (.txt) files. The features associated with these identities will form the base library that will be used to generate your statistical model."
            ))),
			br(), 
			h4(tags$b("Upload your BATL-formatted training datasets")),
			tags$ol(
			tags$li(tags$span(
              "Your quantification file is now labelled, is in BATL-compatible format, and can be used as your Training Dataset in Tab 2.  Upload one BATL-formatted file (.txt), or multiple BATL-formatted files (zipped) to create your Training Dataset."
            )),
			tags$li(tags$span(
              "Specify the desired ",tags$b("peak features")," to train the BATL model by selecting the appropriate check boxes."
            )),
			tags$li(tags$span(
              "If your peak features require normalization to a reference analyte that analyte must be present in all samples and must have the same component name in all training dataset files. Select that standard from the drop down menu. (Only analytes that have the same component name in all of your training dataset files and are present in every sample will be available for selection)."
            )),
			tags$li(tags$span(
              "Your training dataset can now be built and downloaded for your reference.  Proceed to Tab 3"
            ))
          )
        ),

        br(),
        h4(tags$b("Tab 3. Build BATL Model",br(),"Build your statistical model")),
        p(em("If you have not yet created your training set, you will not see the option to build your BATL
model. Please return to tab 2 and create your training set."),
          tags$ol(
            tags$li(tags$span(
              "Click on \"Click here to build your model\". Depending on the size of your training dataset, this will take between 1 and 15 min. The progress bar will indicate how much time remains."
            )),
            tags$li(tags$span(
              "Once your model is built, you can download it for your reference.  Proceed to tab 4."
            ))
          )
        ),

        br(),
        h4(tags$b("Tab 4. Label new dataset",br(),"Annotate new qsession file exports.")),
        p(
          tags$ol(
            tags$li(tags$span(
              "Upload your qsession export.  File must be .txt and you must include all columns as above.  
If your model requires normalized features, the datasets you are annotating must have the 
same reference analyte in all samples and this reference analyte must have the same 
component name as in your training dataset."
            )),
            tags$li(tags$span(
              "Select the two letter Lipid Maps category that corresponds to your dataset.  This selection is 
used to annotate potential in source artifacts (i.e., dehydrations, isotopologues, etc).  If you 
choose SP this will enable the assignment of dehydration/deglycosylation/dimer artifacts and 
isotopes that are relevant only to sphingolipids.  Currently, only isotopologue annotations are 
supported for the remaining categories."
            )),
            tags$li(tags$span(
              "Click to annotate your quantification files. This will take approximately 1-15 minutes."
            )),
            tags$li(tags$span(
              "Annotated files can be downloaded."
            ))
          )
        )

      ),
      tabPanel(
        "Sample Data",value="Sample-Data",
		br(),
        p(
          "Example training datasets available for download. All labelled lipid identities were
confirmed by high performance liquid chromatography, multiple or selected reaction monitoring-
information dependent acquisition-enhanced product ion experiments.   Lipid identities are
indicated as barcodes used by the India Taylor Lipidomic Research Platform, University of
Ottawa."
        ),
		br(),h5(tags$b("Training .qsession exports with Lipid_identifier column added (Tab 2).")),
        p(
          tags$ul(
            tags$li(tags$span(HTML("<a href='AvantiStandards.txt' download>AvantiStandards.txt</a> : 24 replicates of glycerophospholipid standards from <a href='https://avantilipids.com/' target='_blank'>Avanti Polar Lipids</a>; concentrations were selected to fall within biological range.")
            )),
            tags$li(tags$span(HTML("<a href='AvantiStandards2.txt' download>AvantiStandards2.txt</a> : 14 replicates of different concentrations of glycerophospholipid standards from <a href='https://avantilipids.com/' target='_blank'>Avanti Polar Lipids</a>; concentrations were selected to fall within biological range.")
            )),
			tags$li(tags$span(HTML("<a href='PlasmaGlycerophosphocholines.txt' download>PlasmaGlycerophosphocholines.txt</a> : 50 human plasma samples")
            ))
          ),br(),
		  h5(tags$b("Test .qsession exports for annotation (Tab 4)")),br(),
		    tags$ul(
            tags$li(tags$span(HTML("<a href='MatrixGlycerophosphocholines_TestSet.txt' download>MatrixGlycerophosphocholines_TestSet.txt</a> : 58 human plasma samples positive or negative for SARS-CoV-2.")
            ))
          )
		  
        )

      ),
      tabPanel(
        "Troubleshooting",value="Troubleshooting",
        br(),
        p(
            "The most common reason for BATL failing to generate a model or annotate peaks is related to how your data (training and test sets) have been formatted.  Please review common issues below and should BATL not perform as expected please email",tags$a(href="ldomic@uottawa.ca",target="_blank", "ldomic@uottawa.ca"),"for assistance. In your help request, please provide your training datasets and test dataset and a description of how BATL is not performing to expectation.  We will reproduce the problem and provide you with a solution."
        ),
        br(),
        strong("1. My training datasets generated using Agilent or Waters acquisition software will not load."),
        p("The current BATL version 2.07.7 supports SCIEX MultiQuant analyses.  Future updates will expand capacity to include other targeted lipidomic software packages. Please reach out to us at",tags$a(href="ldomic@uottawa.ca",target="_blank", "ldomic@uottawa.ca"),"and we will notify you when the next release is available."
        ),
        br(),
        strong("2. My high resolution high mass accuracy training and test datasets will not load."),
        p(
          "BATL was designed to verify and annotate peaks acquired through a targeted lipidomic workflow. This includes mass spectrometry acquisitions that are generated from multiple-reaction monitoring (MRM), scheduled MRM (sMRM), or selected reaction monitoring (SRM) experiments as well as information-dependent acquisitions (IDA). Thus, BATL requires mass information for both product and precursor ion monitored using triple quadrupole or QTRAP mass spectrometers."
        ),
        br(),
        strong("3. My training datasets generated from .qsession analyses exported from SCIEX MultiQuant quantitation software will not load.  "),
        p(
          "Ensure you have exported",tags$u("all"),"columns (and not simply columns you routinely use).  Also ensure you have added the required Lipid_identifier (case sensitive) column to your training files.  If you have exported all columns correctly, you will be adding Lipid_identifier to column CJ."
        ),
		p(
          "Export the .qsession analysis. Ensure you have selected and exported",em(tags$b(tags$u("all"))),"columns as tab-delimited text (.txt) formatted file.",br(),"File > Export > Results Table…",br(),"Under Format > choose MultiQuant",br(),"Under Columns > choose Export all columns",br(),"Under Rows > choose Export all rows",br(),"Name your file export and save it."
        ),
		p(
          "Open your file with any text/spreadsheeting editing software. Go to the last column of your dataset (column CJ if using Microsoft Excel). Add a new column labelled Lipid_identifier and add your validated identity."
        ),
		strong("4. I have chosen to model features that require normalization but no reference analyte appears in the pull down menu.  I cannot build my BATL model."),
        p(
          "The reference analyte must be in", tags$u("all"),"samples in each qsession export.  If you are combining multiple qsession export training datasets, at least one reference analyte must be present in all files (and all samples).  The Component Name of this reference analyte must be identical in all training dataset files (case sensitive)."
        ),
		strong("5. I successfully generate a BATL model but when I upload the file(s) to be annotated, BATL returns the error \"Some peaks have no matching reference standard for feature normalization. Please ensure that <name of reference analyte> is detected in each of your samples you would like to annotate\"."),
        p(
          "The datasets you are annotating (and each sample in these datasets) must contain the same reference analyte (with the identical Component Name, case sensitive) as the one you used to normalize features in your BATL training datasets and model."
        ),
		strong("6. The BATL annotation indicates one of my species is potentially an in-source dehydration but I am annotating phospholipids.  This is chemically impossible."),
        p(
          "You likely indicated on Tab 4 that the 2-letter code of your analytes was SP (Sphingolipids).  This dictates what in-source artifacts or isotopologues are interrogated.  If your datasets were a mix of lipid categories then you should chose SP as the default to have all lipid artifacts assessed but you must curate the potential list of artifacts/isotopologues to ensure chemical probability.  BATL provides this information to enable you to make informed decisions about the accuracy of your peak picking."
        )
      ),
	  
        tabPanel(
        "Cite BATL",value="Cite-BATL",
        br(),
        strong("Contact Us"),
        p(tags$a(href="ldomic@uottawa.ca",target="_blank", "ldomic@uottawa.ca")
        ),
        br(),
        strong("Cite your use of BATL in a publication"),
        p(
          "Chitpin JG, Surendra A, Nguyen TT, Taylor GP, Xu H, Ortega R, Tomlinson JJ, Schlossmacher MG, Saunders-Pullman R, Cuperlovic-Culf M, Perkins TJ, Bennett SAL (2021) BATL: Bayesian annotations for targeted lipidomics. bioRxiv. 2021:2021.03.19.435788"
        ),
        br(),
        strong("Public Server"),
        p(
          "BATL:",tags$a(href="http://complimet.ca/batl/",target="_blank", "http://complimet.ca/batl/")
        ),
        br(),
		strong("Software License"),
        p(
          "BATL is free software. You can redistribute it and/or modify it under the terms of the ",tags$a(href="https://www.gnu.org/licenses/",target="_blank", "GNU General Public License")," v3 (or later versions) as published by the Free Software Foundation.  As per the GNU General Public License, BATL is distributed as a bioinformatic lipidomic tool to assist users WITHOUT ANY WARRANTY and without any implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. All limitations of warranty are indicated in the GNU General Public License.
"
        )

      )
    
	
	
	
	
	
	
	
	
	
	
	
	
	
	)


  )
)
