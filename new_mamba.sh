#!/bin/sh

##########################################
#Gum Launch new mamba project environment#
#Maintainer: Christopher Chan            #
#Version: 0.2.6                          #
#Date: 2025-02-08                        #
##########################################

R_COLOUR="#003FC7"
MAMBA_COLOUR="#B58B00"


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
        echo "What kinda project is this?"
        type=$(gum choose --cursor.foreground="$MAMBA_COLOUR" Data_Science API)

        case $type in
            Data_Science)
                if gum confirm; then
                    echo "Creating mamba DS environment:" &&\ 
                    mamba create -n ds_$NAME -y python=3.10 ipykernel ipython numpy kedro kedro-viz pandas pyarrow scipy matplotlib seaborn scikit-learn statsmodels pathlib pyarrow polars
                else
                    echo "ABORT!"
                    fi;;

            API)
                if gum confirm; then
                echo "Creating mamba API environment:" &&\ 
                mamba create -n api_$NAME -y cookiecutter ipykernel ipython numpy pandas pyarrow fastapi uvicorn[standard] gradio pathlib pyarrow polars
            else
                echo "ABORT!"
                fi;;
        esac;;

    R)
        if gum confirm; then
            echo "Creating mamba R environment:" &&\
            mamba create --no-default-packages -n r_$NAME -y r-essentials r-base r-irkernel r-tidyverse
        else
            echo "ABORT!"
        fi;;
esac


