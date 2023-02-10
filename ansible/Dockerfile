FROM quay.io/ansible/ansible-runner:stable-2.12-latest
COPY ./main.yml /runner/main.yml
COPY ./requirements.yml /runner/requirements.yml
COPY ./hosts /runner/inventory/hosts
COPY ./ssh_key /runner/env/ssh_key
COPY ./entrypoint.sh /entrypoint.sh
COPY ./known_hosts /etc/ssh/ssh_known_hosts
COPY ./vars /vars
ENV RUNNER_PLAYBOOK=/runner/main.yml
ENV ANSIBLE_TIMEOUT=120
ENTRYPOINT ["/entrypoint.sh"]
