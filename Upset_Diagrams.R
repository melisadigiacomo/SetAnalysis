## Upset diagrams

rm(list = ls(all = TRUE))

# Libraries
library(UpSetR)
library(ggplot2)
library(grid)
library(plyr)
library(dplyr)

# Movies dataset
movies <- read.csv(system.file("extdata", "movies.csv", package = "UpSetR"), header = T, sep = ";")


#Upset diagram
upset(movies, main.bar.color = "black", queries = list(list(query = intersects, params = list("Drama"), color = "#ff0000", active = T)), 
      mainbar.y.label = "Movies", sets.x.label = "Total movies by genre")


# Attribute histogram
upset(movies, main.bar.color = "black", queries = list(list(query = intersects, params = list("Drama"), color = "#ff0000", active = T)), 
      mainbar.y.label = "Movies", sets.x.label = "Total movies by genre",
      attribute.plots = list(gridrows = 50, plots = list(list(plot = histogram, x = "ReleaseDate", queries = T), 
                                                         list(plot = histogram, x = "AvgRating", queries = T)), ncols = 2))

# Attribute scatterplot
upset(movies, main.bar.color = "black", sets.bar.color = "#bdbdbd",
      queries = list(list(query = intersects, params = list("Drama"), color = "red", active = T), 
                     list(query = intersects, params = list("Action", "Drama"), color = "#3182bd", active = T), 
                     list(query = intersects, params = list("Drama", "Comedy", "Action"), color = "orange", active = T)),
      mainbar.y.label = "Movies", sets.x.label = "Total movies by genre",
      attribute.plots = list(gridrows = 45, plots = list(list(plot = scatter_plot, x = "ReleaseDate", y = "AvgRating", queries = T), 
                                                         list(plot = scatter_plot, x = "AvgRating", y = "Watches", queries = T)), ncols = 2))


# Funtion for custom plot
myplot <- function(data, x, y) {
  data$decades <- round_any(as.integer(unlist(data[y])), 10, ceiling) # group movies in decades
  data <- data[which(data$decades >= 1970), ] # movies after the '70s
  myplot <- (ggplot(data, aes_string(x = x)) + 
               geom_density(aes(fill = factor(decades)), alpha = 0.4) + theme_classic() + # density plot
               #scale_fill_manual(values = c('#1b9e77','#d95f02','#7570b3','#e7298a')) + # specify colors
               theme(plot.margin = unit(c(0.2, 0.2, 0.2, 0.2), "cm"), legend.key.size = unit(0.4, "cm")))
}


# Custom attribute plot
upset(movies, main.bar.color = "black", sets.bar.color = "#bdbdbd",
      queries = list(list(query = intersects,params = list("Drama"), color = "red", active = T), 
                     list(query = intersects, params = list("Action", "Drama"), active = T), 
                     list(query = intersects, params = list("Drama", "Comedy", "Action"), color = "orange", active = T)),
      mainbar.y.label = "Movies", sets.x.label = "Total movies by genre", 
      attribute.plots = list(gridrows = 45, plots = list(list(plot = myplot, x = "AvgRating", 
                                                              y = "ReleaseDate", queries = F)), ncols = 1))


# Intersection Box Plots
upset(movies, main.bar.color = "#969696", sets.bar.color = '#de2d26', mainbar.y.label = "Movies", 
      sets.x.label = "Total movies by genre", boxplot.summary = c("AvgRating"))