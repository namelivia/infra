#!/bin/bash

check_for_gum() {
    if ! command -v gum &> /dev/null
    then
        echo "Gum is required: https://github.com/charmbracelet/gum"
        exit
    fi
}

check_for_jq() {
    if ! command -v jq &> /dev/null
    then
        echo "jq is required"
        exit
    fi
}

select_build() {
    echo "Select the container to build:"
    build=$(gum choose none terraform ansible all)
}

select_run() {
    echo "Select the container to run:"
    run=$(gum choose none terraform ansible all)
}
