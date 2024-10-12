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
            -v "$(pwd)/main.yml:/app/main.yml" \
            -v "$(pwd)/requirements.yml:/app/requirements.yml" \
            -v "$(pwd)/vars:/app/vars" \
            -v "ansible:/root/.ansible" \
            ansible ansible-inventory --list | jq -r '.hosts.hosts[]'
    )
    selectedHosts=$(echo "all $hosts" | tr ' ' '\n' | gum filter --no-limit)
}

list_tags() {
    listTagsOutput=$(cd ansible && \
        docker run \
            -it \
            -v "$(pwd)/hosts:/etc/ansible/hosts" \
            -v "$(pwd)/main.yml:/app/main.yml" \
            -v "$(pwd)/requirements.yml:/app/requirements.yml" \
            -v "$(pwd)/vars:/app/vars" \
            -v "ansible:/root/.ansible" \
            ansible ansible-playbook /app/main.yml --list-tags
    )
    if [ $? -ne 0 ]; then
        echo $listTagsOutput
        exit 1
    fi
    allTags=$(echo "$listTagsOutput" | grep -o 'TASK TAGS: \[.*\]' | sed -n 's/TASK TAGS: \[\([^]]*\)].*/\1/p' | tr ',' ' ')
    selectedTags=$(echo $allTags | tr ' ' '\n' | sort | uniq | gum filter --no-limit)
    echo $selectedTags
}

run_ansible() {
    joinedTags=$(echo $selectedTags | tr ' ' ',')
    tagsOption="--tags $joinedTags"

    if [ "$selectedHosts" == "all" ]; then
        hostsOption=""
    else
        joinedHosts=$(echo $selectedHosts | tr ' ' ',')
        hostsOption="--limit $joinedHosts"
    fi

    echo "Running Ansible..."
    (cd ansible && \
        docker run \
            -it \
            -v "$(pwd)/hosts:/etc/ansible/hosts" \
            -v "$(pwd)/main.yml:/app/main.yml" \
            -v "$(pwd)/requirements.yml:/app/requirements.yml" \
            -v "$(pwd)/vars:/app/vars" \
            -v "ansible:/root/.ansible" \
            ansible ansible-galaxy install -f -r /app/requirements.yml \
    ) && \
    (cd ansible && \
        docker run \
            -it \
            -v "$(pwd)/hosts:/etc/ansible/hosts" \
            -v "$(pwd)/main.yml:/app/main.yml" \
            -v "$(pwd)/requirements.yml:/app/requirements.yml" \
            -v "$(pwd)/vars:/app/vars" \
            -v "ansible:/root/.ansible" \
            ansible ansible-playbook /app/main.yml --key-file /app/env/ssh_key --ssh-common-args='-o StrictHostKeyChecking=no' $tagsOption $hostsOption
    )
}
