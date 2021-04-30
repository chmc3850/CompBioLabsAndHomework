#  Distribution of Fungi Based on Habitat

### Biological question

How are mushrooms distributed across a savanna landscape in north-east Nigeria? This project analyzes the species composition and distribution of a savanna ecosystem located in an understudied area of Nigeria.

### Introduction

This project investigates the mushroom distributions for a study area in a Nigerian savanna. The Buba et al. (2018) study in focus includes observations of 93 mushroom species in a savannah ecosystem. Forays were conducted two times per week and mushrooms were identified by various physical features. The authors used multiple statistical methods to determine the species composition and distribution in this area. Similar to the original study, my project will use the observational data from Buba et al. (2018) to analyze and visualize the mushroom distributions and plant-mushroom associations of the study area. Understanding trends in fungal distributions is important because fungi are great indicators of biodiversity and ecosystem health in general.

### Methods

##### The source of the data:

The goal of the original Buba et al. (2018) study was to determine fungal species distributions for a savannah located in north-east Nigeria, and ultimately use this information to propose strategies for conservation. Forays were conducted two times per week during the rainy season, from June to late October. Mushroom specimens were collected, photographed, and identified using various physical features. The dataset associated with this study is simply a CSV file with frequency counts for individual mushroom species based on substrate and/or microhabitat. The data is relatively small at 19 kB, and includes 20-30 observations for each of the 93 different species. Although there is poor metadata and documentation, this dataset seemed relatively straightforward at the outset. However, working with this data proved to be challenging since there were so many different species _and_ relevant habitats to work with. 

##### What the original authors did with the data:

The authors of the original study aimed to contribute to the sparse pool of knowledge about mushrooms in Nigeria. Mushrooms fill critical ecological roles and decline in species abundance and diversity has been observed worldwide. Buba et al. simply aimed to document the characteristics of mushroom populations in the area and use these observations to inform conservation efforts. Their study is meant to serve as the foundation for mushroom research and conservation in Nigeria.

The authors used t-tests and cluster analyses to investigate the data. Diversity indices were also calculated using the Shannon–Wiener diversity index and Simpson's index. Buba et al. (2018) found _Parkia biglobosa_ had the highest fungal species richness and species diversity. The study also shows indigenous trees had more mushroom species than the introduced, non-native trees.



##### What  _I_  did with the data:

While initially planning this project, I did not foresee any issues with the dataset in focus. When I sat down to start writing code, I realized the data would be harder to work with than I imagined. There are relatively few total observations, but there are so many different species of mushrooms with observations in many different habitats that it makes the dataset unwieldy. I started by making a species abundance distribution graph using Fishers log series distribution. In this plot, the x-axis is number of individuals per species and the y-axis represents number of species. The authors of the original study used the species diversity index to characterize the population while I used the species abundance distribution. It is worth noting that these metrics can be used in conjunction with one another and are not mutually exclusive. 

I also created various heatmaps from this dataset. To make the heatmaps more readable, I divided the data into observations for habitat and observations for tree species. This made the data much easier to work with and made it much easier to identify trends. Splitting the data in this way made the heatmaps much more valuable and easy to read since there weren't 100 x 30 cells.

### Results and conclusions

The species abundance distribution (shown below) shows the typical shape for Fishers log series. There is a sharp decline in number of species as the number of individuals per species increases. This implies a diverse set of species, each with relatively few members. A diverse set of fungi is a great sign of a healthy ecosystem, especially in the savannah.
![Species Abundance Distribution](https://github.com/chmc3850/CompBioLabsAndHomework/blob/master/IndependentProject/SAD_Plot.jpg?raw=true)

The heatmaps also show some interesting trends. The heatmap for mushroom species and tree species  (shown below) shows that _Parkia biglobosa_ hosts the most abundance and the most diverse set of species. This coincides with the original study which found _Parkia biglobosa_ to have the highest species richness and diversity with a Shannon–Wiener diversity index (SDI) of 3.6.
![enter image description here](https://github.com/chmc3850/CompBioLabsAndHomework/blob/master/IndependentProject/Species_Heatmap.jpg?raw=true)
The figure for mushroom species versus habitat (shown below) shows fallow to be the most common habitat by far. The authors define fallow as "uncultivated open fields", (Buba et al., 2018). This trend also confirms the finding in the original study. The authors found fallow to  have the highest species abundance, yet no significant difference was found between the fallow and arable land (cultivated land).
![enter image description here](https://github.com/chmc3850/CompBioLabsAndHomework/blob/master/IndependentProject/Habitat_Heatmap.jpg?raw=true)

All of these figures give us useful insight into the largely unexplored area of mushroom distributions in Nigeria. Overall, this area serves as a habitat for a diverse range of mushroom species. Most of the mushrooms here are specific to one habitat or tree. The most diverse set of species are home to the fallow, arable land, and the _Parkia biglobosa_ tree. These findings are valuable, but more data and research is needed for mushrooms in Nigeria, and for mycology as a whole.

### References Cited
Buba, T., Ezra, G.A., Bako, S.P. and Sabo, M.U. (2019), Diversity and spacio‐temporal distribution of mushrooms in a Nigerian savanna: implication for their conservation. Nordic Journal of Botany, 37: e02185. [https://doi-org.colorado.idm.oclc.org/10.1111/njb.02185](https://doi-org.colorado.idm.oclc.org/10.1111/njb.02185)

Buba, T., Ezra, G.A., Bako, S.P. and Sabo, M.U. (2019), Data from: Diversity and spacio‐temporal distribution of mushrooms in a Nigerian savanna: implication for their conservation. Dryad Repository.
[https://datadryad.org/stash/dataset/doi:10.5061/dryad.02cr88f](https://datadryad.org/stash/dataset/doi:10.5061/dryad.02cr88f)


