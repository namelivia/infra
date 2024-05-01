#!/bin/bash
ansible-galaxy install -f -r requirements.yml && \
ansible-runner run /runner
