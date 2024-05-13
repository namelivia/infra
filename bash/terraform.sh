#!/bin/bash

build_terraform() {
    echo "Building Terraform container..."
    (cd terraform && docker build . -t terraform -q)
}

run_terraform() {
    echo "Running Terraform..."
    (cd terraform && docker run \
        -v $(pwd)/terraform:/terraform \
        -it \
        terraform)
}
