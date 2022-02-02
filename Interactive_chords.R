
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(chorddiag)

# Define UI for application that draws a histogram
ui <- fluidPage(
     br(),
     br(),
     radioButtons('Select_diagram',"Select diagram",inline = TRUE,
                  choices = c("MOTUs present in each location for each morphospecies","MOTUs present in each group for each morphospecies","Shared MOTUs between locations","Shared MOTUs between regions"),
                  selected = 'MOTUs present in each location for each morphospecies'),
     
     chorddiagOutput("distPlot", height = 600)
   )

# Define server logic required to draw a histogram
set.seed(1)   # for reproducibility
#Chord per island
t <- matrix(c(0,0,0,0,0,0,0,1,0,1,0,1,
              1,0,0,0,1,0,0,0,1,1,0,1,
              0,0,0,0,1,0,0,1,0,0,1,1,
              0,1,0,0,1,0,0,1,0,1,0,1,
              1,1,0,0,4,0,0,2,1,2,1,2,
              0,1,0,0,1,0,1,1,1,1,1,1,
              0,0,0,1,1,0,0,0,1,0,1,1,
              0,1,0,1,1,0,0,0,0,0,0,1,
              0,0,0,1,0,0,0,1,0,0,0,1,
              1,1,0,1,1,0,1,1,1,1,1,2,
              0,0,0,0,1,0,0,1,0,1,0,1,
              0,1,0,0,1,1,1,1,0,1,0,1,
              0,0,0,0,0,0,0,0,1,0,0,0,
              0,1,1,1,0,1,0,1,1,1,1,1,
              0,0,0,1,0,0,0,1,0,1,0,1,
              0,0,1,1,1,0,0,1,0,0,0,1,
              0,1,0,1,1,1,1,1,1,1,1,1,
              0,0,0,1,0,0,0,1,0,1,0,1,
              0,0,0,0,0,0,0,1,0,0,0,2,
              0,0,0,0,1,0,0,1,1,0,0,1,
              0,0,0,1,0,0,0,0,0,1,0,1,
              0,1,0,1,0,2,0,0,0,0,0,1,
              0,0,0,0,1,0,0,2,0,0,2,1), 
            byrow = TRUE, nrow = 23, ncol = 12)


colnames(t)<-c("Santa Maria",	"São Miguel",
               "Terceira",	"Porto Santo",	"Madeira", "Selvagens",	
               "Hierro", "La Palma", "Tenerife",	"Gran Canaria",		
               "Morocco",	"Iberian Peninsula")
rownames(t)<-c("Ampithoe helleri",
               "Ampithoe ramondi","Ampithoe riedli",
               "Apohyale perieri","Apohyale stebbingi",
               "Caprella acanthifera","Elasmopus pectenicrus",
               "Jassa herdmani","Podocerus variegatus","Protohyale schmidtii",
               "Quadrimaera inaequipes","Serejohyale spinidactylus", "Stenothoe monoculoides",
               "Anthura gracilis","Campecopea lusitanica",
               "Cymodoce truncata","Dynamene edwardsi",
               "Gnathia maxillaris","Janira maculosa",
               "Joeropsis brevicornis",
               "Apseudopsis latreilli","Tanais grimaldii", "Tanais dulongii")


groupColors_islands <- c("lightgrey", "lightgrey","lightgrey","lightgrey","lightgrey","lightgrey","lightgrey","lightgrey","lightgrey","lightgrey","lightgrey","lightgrey","lightgrey",
                         "darkgrey", "darkgrey","darkgrey","darkgrey","darkgrey","darkgrey","darkgrey",
                         "grey","grey","grey",
                         "purple", "purple","purple",
                         "green","green","green","green","green","green","green", 
                         "orange", "blue")


#Diagram by group
set.seed(2)
chord_reg <- matrix(c(0,2,0,1,
                      1,1,0,1,
                      0,1,1,1,
                      1,3,0,1,
                      2,8,1,2,
                      1,1,1,1,
                      0,2,1,1,
                      1,1,0,1,
                      0,2,0,1,
                      1,2,1,2,
                      0,2,0,1,
                      1,4,0,1,
                      0,1,0,0,
                      1,3,1,1,
                      0,2,0,1,
                      1,2,0,1,
                      1,6,1,1,
                      0,2,0,1,
                      0,1,0,2,
                      0,1,0,1,
                      0,2,0,1,
                      1,3,0,1,
                      0,3,2,1), 
                    byrow = TRUE, nrow = 23, ncol = 4)

colnames(chord_reg)<-c("AZ", "MACA","MORO", "IP")

rownames(chord_reg)<-c("Ampithoe helleri",
                       "Ampithoe ramondi","Ampithoe riedli",
                       "Apohyale perieri","Apohyale stebbingi",
                       "Caprella acanthifera","Elasmopus pectenicrus",
                       "Jassa herdmani","Podocerus variegatus","Protohyale schmidtii",
                       "Quadrimaera inaequipes","Serejohyale spinidactylus", "Stenothoe monoculoides",
                       "Anthura gracilis","Campecopea lusitanica",
                       "Cymodoce truncata","Dynamene edwardsi",
                       "Gnathia maxillaris","Janira maculosa",
                       "Joeropsis brevicornis",
                       "Apseudopsis latreilli","Tanais grimaldii", "Tanais dulongii")

groupColors_region <- c("lightgrey", "lightgrey","lightgrey","lightgrey","lightgrey","lightgrey","lightgrey","lightgrey","lightgrey","lightgrey","lightgrey","lightgrey","lightgrey",
                        "darkgrey", "darkgrey","darkgrey","darkgrey","darkgrey","darkgrey","darkgrey",
                        "grey","grey","grey","purple", "green", "orange","blue")




#Chord per island
set.seed(3)
simil <- matrix(c(1,1,0,0,2,0,2,2,1,1,0,1,
                  1,3,1,1,2,0,3,3,2,2,0,3,
                  0,1,0,1,0,0,1,1,0,0,0,0,
                  0,1,1,4,3,0,1,3,0,0,1,1,
                  2,2,0,3,8,1,4,2,3,1,0,1,
                  0,0,0,0,1,4,0,0,0,0,0,0,
                  2,3,1,1,4,0,3,4,3,2,0,1,
                  2,3,1,3,2,0,4,6,4,2,0,1,
                  1,2,0,0,3,0,3,4,12,2,0,2,
                  1,2,0,0,1,0,2,2,2,2,0,1,
                  0,0,0,1,0,0,0,0,0,0,6,4,
                  1,3,0,1,1,0,1,1,2,1,4,17), 
                byrow = TRUE, nrow = 12, ncol = 12)


colnames(simil)<-c("Santa Maria",	"São Miguel",
                   "Terceira", "Porto Santo",	"Madeira", "Selvagens",	
                   "Tenerife",	"Gran Canaria",	"La Palma",	"Hierro",
                   "Morocco", "Iberian Peninsula")
rownames(simil)<-c("Santa Maria",	"São Miguel",
                   "Terceira", "Porto Santo",	"Madeira", "Selvagens",	
                   "Tenerife",	"Gran Canaria",	"La Palma",	"Hierro",
                   "Morocco", "Iberian Peninsula")


groupColors_sim_islands <- c("purple", "purple","purple", 
                             "green","green","green","green","green","green","green",   
                             "orange", "blue")



#Chord per group
set.seed(4)
simil_groups = matrix(c(5, 5, 0, 3,
                        5, 48, 1, 3,
                        0,1,6, 4,
                        3,3,4,17), 
                      byrow = TRUE, nrow = 4, ncol = 4)

colnames(simil_groups)<-c("AZ", "MACA","MORO", "IP")
rownames(simil_groups)<-c("AZ", "MACA","MORO", "IP")


groupColors_sim_groups <- c("purple", "green",   
                            "orange", "blue")



server <- function(input, output) {
  
  
  output$distPlot <- renderChorddiag({
    
    if(input$Select_diagram =="MOTUs present in each location for each morphospecies"){
      chorddiag(t, groupColors = groupColors_islands, type = "bipartite", showTicks = F, groupnameFontsize = 10, groupnamePadding = 5, margin = 85)
    }else if(
      input$Select_diagram =="MOTUs present in each group for each morphospecies"){
      chorddiag(chord_reg, groupColors = groupColors_region, type = "bipartite", showTicks = F, groupnameFontsize = 10, groupnamePadding = 5, margin = 85)
    } else if(
      input$Select_diagram =="Shared MOTUs between locations"){
      chorddiag(simil,  groupColors = groupColors_sim_islands, type = "directional", showTicks = F, groupnameFontsize = 10, groupnamePadding = 5, margin = 85)
    }else{
      chorddiag(simil_groups,  groupColors = groupColors_sim_groups, type = "directional", showTicks = F, groupnameFontsize = 10, groupnamePadding = 5, margin = 85)
    }
    
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)

