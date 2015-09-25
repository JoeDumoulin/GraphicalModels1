library(Rgraphviz)

test1 <- function() {
  set.seed(123)
  V <- letters[1:10]
  M <- 1:4
  g1 <- randomGraph(V, M, 0.2)
  plot(g1,"twopi")
}

# type must be one of "distinct" or "combined" 
reciprocatedEdges <- function(type) {
  rEG <- new("graphNEL", nodes=c("A","B"), edgemode="directed")
  rEG <- addEdge("A","B",rEG,1)
  rEG <- addEdge("B","A",rEG,1)
  plot(rEG, recipEdges=type)
  
  print("removed edges")
  removedEdges(rEG)
}

test2 <- function() {
  set.seed(123)
  V <- letters[1:10]
  M <- 1:4
  g1 <- randomGraph(V, M, 0.2)
  
  plot(g1, attrs=list(node=list(label="foo", fillcolor="lightblue"),
                      edge=list(color="cyan"),
                      graph=list(rankdir="LR")))
}

test3 <- function() {
  set.seed(123)
  V <- letters[1:10]
  M <- 1:4
  g1 <- randomGraph(V, M, 0.2)
  
  nAttrs <- list()
  eAttrs <- list()
  
  z <- strsplit(packageDescription("Rgraphviz")$Description, " ")[[1]]
  z <- z[1:numNodes(g1)]
  names(z) = nodes(g1)
  print(z)
  nAttrs$label <- z
  attrs <- list(node=list(shape="ellipse",fixedsize=FALSE))
  
  plot(g1, nodeAttrs=nAttrs, attrs=attrs)
}

