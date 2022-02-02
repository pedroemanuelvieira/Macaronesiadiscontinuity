# Load libraries
library(igraph)
library(visNetwork)

############Locations##############

#Load file
simil<-read.csv("C:/Users/pedro/Desktop/Peracarida_islands/Dados/Similarity of MOTUs_rows.csv", sep=";", header = TRUE)

# Convert to matrix
simil.mat <- as.matrix(simil)

# Convert to igraph objects
g_islands <- graph.edgelist(simil.mat, directed = FALSE)

# Create new vertex and edge attributes to g_islands
groups<-c("AZ", "AZ", "MACA", "MACA", "MACA", "MACA", "MACA","IP", "AZ", "MACA", "MORO", "MACA")
color<-c("purple", "purple", "green", "green", "green", "green", "green", "blue", "purple", "green", "orange", "green")
g_islands <- set_vertex_attr(g_islands, "groups", value = groups)
g_islands <- set_vertex_attr(g_islands, "color", value = color)
E(g_islands)$color = "grey"
E(g_islands)$width <- 0.05

# View attributes
vertex_attr(g_islands)
edge.betweenness(g_islands)
degree_distribution(g_islands)

# Plot network
plot(g_islands, vertex.label.color = "black",layout = layout_nicely(g_islands))
g <- simplify(g_islands, remove.multiple = T, remove.loops = T)#simplify network
plot(g, layout = layout_nicely(g))
#"plot simplified network"
visIgraph(g)#plot more beautiful and interactive network

#Test community structures for locations
c1<-cluster_label_prop(g_islands)
c2<-cluster_louvain(g_islands)
c3<-cluster_spinglass(g_islands)
c4<-fastgreedy.community(simplify(g_islands, 
  remove.multiple = T, remove.loops = T))#in this function, it has to be simplified
c5<-cluster_leading_eigen(g_islands)
c6<- edge.betweenness.community(g_islands)
c7<-cluster_optimal(g_islands)
c8 <- cluster_walktrap(g_islands)

#Test membership and modularities values
membership(c1)#label propagation suitable
membership(c2)#multi level suitable
membership(c3)#spinglass suitable
membership(c4)#fast greedy 
membership(c5)#leading eigenvector
membership(c6)#edge betweenness suitable
membership(c7)#optimal
membership(c8)#walktrap suitablemodularity(c1)
modularity(c1)#0
modularity(c2)#0.07969303
modularity(c3)#0.1098836
modularity(c4)#0.06125
modularity(c5)#0.07480182
modularity(c6)#0.01990218
modularity(c7)#0.07969303
modularity(c8)#0.02276942

#Test u (global property)
mean(degree.distribution(g_islands))#0.022

#Plot every scenario
plot(c1, simplify(g_islands),layout = layout_nicely(g_islands))
plot(c2, simplify(g_islands),layout = layout_nicely(g_islands))
plot(c3, simplify(g_islands),layout = layout_nicely(g_islands))
plot(c4, simplify(g_islands),layout = layout_nicely(g_islands))
plot(c5, simplify(g_islands),layout = layout_nicely(g_islands))
plot(c6, simplify(g_islands),layout = layout_nicely(g_islands))
plot(c7, simplify(g_islands),layout = layout_nicely(g_islands))
plot(c8, simplify(g_islands),layout = layout_nicely(g_islands))

############Groups##############

#Load file
simil_groups<-read.csv("C:/Users/pedro/Desktop/Peracarida_islands/Dados/Similarity of MOTUs_groups_rows.csv", sep=";", header = FALSE)

# Convert to matrix
simil.mat_groups <- as.matrix(simil_groups)

# Convert to igraph objects
g_groups <- graph.edgelist(simil.mat_groups, directed = FALSE)

# Create new vertex and edge attribute to g_groups
color_groups<-c("green", "purple","blue",  "orange")
g_groups <- set_vertex_attr(g_groups, "color", value = color_groups)
E(g_groups)$color = "black"
E(g_groups)$width <- 1

# View attributes
vertex_attr(g_groups)
edge.betweenness(g_groups)
degree_distribution(g_groups)

# Plot network
plot(g_groups, vertex.label.color = "black",layout = layout_nicely(g_groups))
g2 <- simplify(g_groups, remove.multiple = T, remove.loops = T)#simplify network
plot(g2, layout = layout_nicely(g_groups))
#"plot simplified network"
visIgraph(g2)#plot more beautiful and interactive network

#Test community structures for groups
d1<-cluster_label_prop(g_groups)
d2<-cluster_louvain(g_groups)
d3<-cluster_spinglass(g_groups)
d4<-fastgreedy.community(simplify(g_groups,
  remove.multiple = T, remove.loops = T))#in this function, it has to be simplified
d5<-cluster_leading_eigen(g_groups)
d6<- edge.betweenness.community(g_groups)
d7<-cluster_optimal(g_groups)
d8 <- cluster_walktrap(g_groups)

#Test membership and modularities values
membership(d1)#label propagation suitable
membership(d2)#multi level suitable
membership(d3)#spinglass suitable
membership(d4)#fast greedy 
membership(d5)#leading eigenvector
membership(d6)#edge betweenness suitable
membership(d7)#optimal
membership(d8)#walktrap suitable
modularity(d1)#0
modularity(d2)#0.06054688
modularity(d3)#0.09375
modularity(d4)#0
modularity(d5)#0.06054688
modularity(d6)#0
modularity(d7)#0.06054688
modularity(d8)#0

#Test u (global property)
mean(degree.distribution(g_groups))#0.077

#Plot every scenario
plot(d1, simplify(g_groups),layout = layout_nicely(g_groups))
plot(d2, simplify(g_groups),layout = layout_nicely(g_groups))
plot(d3, simplify(g_groups),layout = layout_nicely(g_groups))
plot(d4, simplify(g_groups),layout = layout_nicely(g_groups))
plot(d5, simplify(g_groups),layout = layout_nicely(g_groups))
plot(d6, simplify(g_groups),layout = layout_nicely(g_groups))
plot(d7, simplify(g_groups),layout = layout_nicely(g_groups))
plot(d8, simplify(g_groups),layout = layout_nicely(g_groups))

######end#####
