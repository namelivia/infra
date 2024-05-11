#!/bin/bash

source bash/ansible.sh
source bash/ui.sh

# TERRAFORM
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

# SELECTION LOGIC
build_containers() {
    if [ "$build" == "terraform" ]; then
        build_terraform
    elif [ "$build" == "ansible" ]; then
        build_ansible
    elif [ "$build" == "all" ]; then
        build_terraform
        build_ansible
    fi
}

run_containers() {
    if [ "$run" == "terraform" ]; then
        run_terraform
    elif [ "$run" == "ansible" ]; then
        list_hosts
        list_tags
        run_ansible
    elif [ "$run" == "all" ]; then
        run_terraform
        list_hosts
        list_tags
        run_ansible
    fi
}

# MAIN
main() {
    check_for_gum
    check_for_jq
    select_build
    build_containers
    select_run
    run_containers
}

main
