FROM infracost/infracost:ci-latest
COPY ./credentials.yml ~/.config/infracost/credentials.yml
COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]
