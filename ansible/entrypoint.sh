#!/bin/bash
ansible-galaxy install -r requirements.yml && \
ansible-runner run /runner
