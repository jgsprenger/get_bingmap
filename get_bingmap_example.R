
# example
library(ggmap)

#function to retrieve map image
source(get_bingmap_0.01.R)


#if not already locally installed package get bingmapr
#pak::pkg_install("elipousson/bingmapr")
library(bingmapr)

#pick your spot
loc_grid <- c(43.630877791150525, -79.55490813015373)

#get blank and white base map
#uses zoom, w,h pretty much the same as get_googlemap etc.
base_bw_bing <- get_bingmap(location=loc_grid,
                            zoom=17,
                            width = 600,
                            height = 400,
                            colour = "bw")

ggmap(base_bw_bing)

#get colour basemap
base_bing <- get_bingmap(location=loc_grid,
                          zoom=17,
                          width = 600,
                          height = 400,
                          colour = "colour")

ggmap(base_bing)
