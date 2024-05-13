#!/bin/bash

build_ansible() {
    echo "Building Ansible container..."
    (cd ansible && docker build . -t ansible -q)
}

list_hosts() {
    hosts=$(cd ansible && \
        docker run \
            -it \
            -v "$(pwd)/hosts:/etc/ansible/hosts" \
            -v "$(pwd)/main.yml:/runner/main.yml" \
            -v "$(pwd)/requirements.yml:/runner/requirements.yml" \
            -v "$(pwd)/vars:/vars" \
            -v "ansible:/home/runner/.ansible" \
            ansible ansible-inventory --list | jq -r '.hosts.hosts[]'
    )
    selectedHosts=$(echo $hosts | tr ' ' '\n' | gum filter --no-limit)
}

list_tags() {
    listTagsOutput=$(cd ansible && \
        docker run \
            -it \
            -v "$(pwd)/hosts:/etc/ansible/hosts" \
            -v "$(pwd)/main.yml:/runner/main.yml" \
            -v "$(pwd)/requirements.yml:/runner/requirements.yml" \
            -v "$(pwd)/vars:/vars" \
            -v "ansible:/home/runner/.ansible" \
            ansible ansible-playbook /runner/main.yml --list-tags
    )
    allTags=$(echo $listTagsOutput | grep -o 'TASK TAGS: \[.*\]' | sed 's/^.*TASK TAGS: \[\([^]]*\)].*$/\1/p' | tr ',' ' ')
    selectedTags=$(echo $allTags | tr ' ' '\n' | sort | uniq | gum filter --no-limit)
    echo $selectedTags
}

run_ansible() {
    if [ -n "$selectedTags" ]; then
        joinedTags=$(echo $selectedTags | tr ' ' ',')
        tagsOption="--tags $joinedTags"
    else
        tagsOption=""
    fi

    if [ -n "$selectedHosts" ]; then
        joinedHosts=$(echo $selectedHosts | tr ' ' ',')
        hostsOption="--limit $joinedHosts"
    else
        hostsOption=""
    fi

    echo "Running Ansible..."
    (cd ansible && \
        docker run \
            -it \
            -v "$(pwd)/hosts:/etc/ansible/hosts" \
            -v "$(pwd)/main.yml:/runner/main.yml" \
            -v "$(pwd)/requirements.yml:/runner/requirements.yml" \
            -v "$(pwd)/vars:/vars" \
            -v "ansible:/home/runner/.ansible" \
            ansible ansible-galaxy install -f -r /runner/requirements.yml \
    ) && \
    (cd ansible && \
        docker run \
            -it \
            -v "$(pwd)/hosts:/etc/ansible/hosts" \
            -v "$(pwd)/main.yml:/runner/main.yml" \
            -v "$(pwd)/requirements.yml:/runner/requirements.yml" \
            -v "$(pwd)/vars:/vars" \
            -v "ansible:/home/runner/.ansible" \
            ansible ansible-playbook /runner/main.yml --key-file /runner/env/ssh_key --ssh-common-args='-o StrictHostKeyChecking=no' $tagsOption $hostsOption
    )
}
