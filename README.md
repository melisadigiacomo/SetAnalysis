# Set Analysis: Project Overview 
* This code shows graphically the differences between Venn and Upset diagrams.

## Code and Resources Used 
**R Version:** 3.6.3
**Packages:** VennDiagram, UpSetR, ggplot2, grid, plyr, dplyr, knitr

## Dataset
A list of movies from 1920 until 2000 was used as dataset. The dataset has 17 different movie genres.

## Displaying Data
A Venn diagrams and an Upset diagram were plotted to show the differences.

# Venn diagram
Each circle represents one of the three most common movie genres: Drama, Comedy and Action. 1287 movies were categorized as Drama, 919 as Comedy and 348 as Action. Only 10 movies were categorized under the three genres.


![VennDiagram]()&nbsp;

If we are familiarized with Venn diagrams, we know they only work well with two to four sets. More sets could be possible but may be tedious. For that reason, the movies dataset was reduced and the three most common genres were considered: Drama, Comedy and Action. The other genres were dissmised from the dataset.


# Upset diagram
The upset diagram shows the number of movies of each common genre and the number of movies that have been cathegorized in more than one genre. The advantage of this kind of plot is that we could consider the 17 movie genres.

In the upset plot, drama movies are shown in red, drama-action movies in blue and drama-action-comedy movies in orange.


A scatterplot was used to show the released date and average ratings of the movies. Same colors were used to highlight the genres fo interest.


As we could observe, the numbers differ from the Venn diagram as we could now consider the 17 movie genres.


![AttributeScatterplot]()&nbsp;


# Conclusions
Venn diagrams are easy to read without much explanation. But this relies on the low number of sets they could deliver. On the other hand, Upset diagrams provide more clarity when there are more than three or four sets. All the options are taking into account and they provide more information. These diagrams could also be accompanied by other scatterplots, density plots or histograms, as it was shown.


In conclusion, when having a low number of sets, Venn diagrams work very well but we can always count on using Upset diagrams.