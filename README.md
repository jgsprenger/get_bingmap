# get_bingmap
works with ggmap - allows retrieval of free bing map images to be used with ggmap package.

uses https://elipousson.github.io/bingmapr/ package
    pak::pkg_install("elipousson/bingmapr")

and you have to register for a free API key on bin maps
    https://learn.microsoft.com/en-us/bingmaps/getting-started/bing-maps-dev-center-help/getting-a-bing-maps-key


Once you have the basemap, you can use other geom_* to add info, annotate etc.

You can also add sf objects, just ensure that you have the long/lat for coordinates, ** AND add "inherit.aes = FALSE" call in geom_sf_* additions to your map. **


