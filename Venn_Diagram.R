list<-read.csv2("MOTUperRegion_For_VennDiagram.csv")
AZ<-as.character(list$AZ)
IP<-as.character(list$IP)
MACA<-as.character(list$MACA)
MORO<-as.character(list$MORO)
x = list(AZ, IP, MACA, MORO)

library(VennDiagram)
# Chart
venn.plot<-venn.diagram(
  x,
  category.names = c("AZ", "IP", "MACA" ,   "MORO"),
  col = c("magenta2", "blue", "forestgreen", "orange"),
  cat.col = c("magenta2", "blue", "forestgreen",  "orange"),
  cat.cex = 4,
  cat.fontface = "bold",
  filename = NULL,
  height = 1000, 
  width = 1000, 
  resolution = 900,
  output=TRUE,cex = 5,main.cex=5, main.fontface = "bold"
)

grid.draw(venn.plot)

