get_bingmap <- function(location = NULL,
                        query = NULL,
                        imagery = "Aerial",
                        width = 600,
                        height = 400,
                        mapsize = NULL,
                        zoom = 11,
                        colour = "colour",
                        orientation = 0,
                        nudge = NULL,
                        key = Sys.getenv("BING_MAPS_API_KEY"),
                        check = TRUE,
                        strip = TRUE,
                        ...) {


   map1<-bingmapr::req_bingmapr(location = location,
                      query = query,
                      imagery = imagery,
                      width = width,
                      height = height,
                      mapsize = mapsize,
                      zoom = zoom,
                      orientation = orientation,
                      nudge = nudge,
                      key = key,
                      check = check,
                      .perform = TRUE
   )

   map2 <- httr::GET(map1$url)
   map2 <- httr::content(map2)

   if (colour=="colour") {
      map2 <- as.raster(apply(map2, 2,rgb))  #colour
   } else if (colour=="bw") {
      map2d <- dim(map2)
      map2 <- gray(.30 * map2[,,1] + .59 * map2[,,2] + .11 * map2[,,3])
      dim(map2) <-map2d[1:2]
      map2 <- as.raster(map2)
   }

   maptype <- "Aerial"


   centre <- c(lon=location[2],lat=location[1])
   lon = centre[1]
   lat = centre[2]


   size=c(width,height)


   ll <- RgoogleMaps::XY2LatLon(
      list(lat=centre[2], lon = centre[1], zoom = zoom),
      -size[1]/2 + 0.5,
      -size[2]/2 - 0.5
   )
   ur <- RgoogleMaps::XY2LatLon(
      list(lat = centre[2], lon = centre[1], zoom = zoom),
      size[1]/2 + 0.5,
      size[2]/2 - 0.5
   )



   map2 <- structure(
      map2,
      "class" = c("ggmap","raster"),
      "source" = "bing",
      "maptype" = maptype,
      "zoom" = zoom,
      "bb" = tibble::tibble(
         "ll.lat" = ll[1], "ll.lon" = ll[2],
         "ur.lat" = ur[1], "ur.lon" = ur[2]
      )
   )


   #return
   map2
}
