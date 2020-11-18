#!/bin/sh
ogr2ogr -sql "select * from gadm36_SVN_2 where NAME_2='Izola'" -f "ESRI Shapefile" koper.shp data/gadm36_SVN.gpkg

ogrinfo koper.shp koper -so 

gdalwarp -overwrite -cutline koper.shp -crop_to_cutline  -s_srs EPSG:4326 -t_srs EPSG:32632 dem_merge.tif dem_merge_clip.tif

gdaldem hillshade dem_merge_clip.tif dem_merge_clip_hillshade

