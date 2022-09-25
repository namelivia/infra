FROM hashicorp/terraform:light
COPY ./main.tf /terraform/main.tf
COPY ./variables.tf /terraform/variables.tf
COPY ./terraform.tfstate /terraform/terraform.tfstate
COPY ./entrypoint.sh /entrypoint.sh
COPY ./hosts.tpl /hosts.tpl
COPY ./vars /vars
ENTRYPOINT ["sh", "/entrypoint.sh"]
