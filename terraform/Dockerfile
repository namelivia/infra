FROM hashicorp/terraform:light
COPY ./entrypoint.sh /entrypoint.sh
COPY ./vars /vars
#COPY ./hosts.tpl /hosts.tpl
ENTRYPOINT ["sh", "/entrypoint.sh"]
