#!/bin/bash

WALLPAPERS_DIR="/home/andrzej3393/MEGA/Images/wallpapers/"
feh --bg-fill "$WALLPAPERS_DIR`ls $WALLPAPERS_DIR | shuf -n 1`"
