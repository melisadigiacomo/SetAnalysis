# Venn Diagrams

# Libraries 
library(VennDiagram)

# Movies dataset
movies <- read.csv(system.file("extdata", "movies.csv", package = "UpSetR"), 
                   header = T, sep = ";")

# Selected genres to plot a venn diagram
# Venn diagrams only work well with two or three sets.The movies dataset was reduced and the three most common 
# genres were considered: Drama, Comedy and Action. The other genres were dissmised.
movies1 <- transmute(movies,Movie = Name, Action, Comedy, Drama)

# Set the sets 
# In order to have easy names, we previously separate the sets.
Drama <- sum(movies1$Drama == 1)
Action <- sum(movies1$Action == 1)
Comedy <- sum(movies1$Comedy == 1)
DramaAction <- sum((movies1$Drama == 1) & (movies1$Action == 1))
DramaComedy <- sum((movies1$Drama == 1) & (movies1$Comedy == 1))
ActionComedy <- sum((movies1$Action == 1) & (movies1$Comedy == 1))
DramaActionComedy <- sum((movies1$Drama == 1) & (movies1$Action == 1) & (movies1$Comedy == 1))


# Venn Diagram
grid.newpage()
draw.triple.venn(area1 = Drama,
                 area2 = Comedy,
                 area3 = Action,
                 n12 = DramaComedy,
                 n23 = ActionComedy,
                 n13 = DramaAction,
                 n123 = DramaActionComedy,
                 fill = c('#fc8d62','#8da0cb','#e78ac3'),
                 alpha = 0.65,
                 lty = 'blank',
                 category = c('Drama', 'Comedy', 'Action'),
                 cat.col = c('#fc8d62','#8da0cb','#e78ac3'),
                 cat.cex = 2,
                 cex = 2)