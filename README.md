# get_bingmap
## works with ggmap 
- allows retrieval of free bing map images to be used with excellent ggmap package. 

(credits to @dkahle and many others)

## Uses
this uses https://elipousson.github.io/bingmapr/ package
to install...
```
    pak::pkg_install("elipousson/bingmapr")
```
    (credits to @elipousson)

also uses ggmap
    
## Bing Maps API 
You have to register for a free API key on bin maps
    https://learn.microsoft.com/en-us/bingmaps/getting-started/bing-maps-dev-center-help/getting-a-bing-maps-key


## up and running
Once you have the basemap object ggmap'ed, you can use other geom_*s to add info, annotate etc.

You can also add sf objects, (geom_sf_*s) just ensure that you have the long/lat for coordinates, ** AND add "inherit.aes = FALSE" call in geom_sf_* additions to your map. **


