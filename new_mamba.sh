#!/bin/sh

##########################################
#Gum Launch new mamba project environment#
#Maintainer: Christopher Chan            #
#Version: 0.1.0                          #
#Date: 2023-01-22                        #
##########################################

R_COLOUR="#003FC7"
MAMBA_COLOUR="#B58B00"

R_colour_text () {
    gum style --foreground "$R_COLOR" "$1"
}

Mamba_colour_text () {
    gum style --foreground "$MAMBA_COLOR" "$2"
}

gum style \
    --border normal \
    --margin "1" \
    --padding "1" \
    --align "center" \
    --border-foreground "#9873AC" \
    "Welcome to your new $(gum style --foreground "#9873AC" project env)"

echo "Please choose the project $(gum style --foreground "#9873AC" language):"
command=$(gum choose --cursor.foreground="#9873AC" Python R)

echo "Please give a name to the new project:"
NAME=$(gum input --placeholder "name")

case $command in
    Python)
        gum confirm && (echo "Creating mamba python environment:" &&\ 
            mamba create -n m_$NAME -y ipykernel ipython numpy) || \
            echo "ABORT!";;
    R)
        gum confirm && (echo "Creating mamba R environment:" &&\
            mamba create --no-default-packages -n r_$NAME -y r-essentials r-base r-irkernel r-tidyverse) || \
            echo "ABORT!";;
esac



