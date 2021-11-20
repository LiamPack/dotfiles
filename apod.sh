#!/usr/bin/env bash

APOD_URL=https://apod.nasa.gov/apod/
OUT=$HOME/Pictures/apod.html
OUT_JPG=$HOME/Pictures/apod.jpg


curl $APOD_URL -o $OUT
todays_url=$(grep -o -m 1 "\".*.jpg\"" $OUT)
todays_url=${todays_url#\"}
todays_url=${todays_url%\"}
echo $todays_url
curl "$APOD_URL$todays_url" -o $OUT_JPG
