FROM mattermost/mattermost-enterprise-edition:6.3

RUN mkdir -p /docker

COPY ./docker/custom_entrypoint.sh /docker/custom_entrypoint.sh
RUN chmod +x /docker/custom_entrypoint.sh
RUN dos2unix /docker/custom_entrypoint.sh

COPY ./docker/set_env_secrets.sh /docker/set_env_secrets.sh
RUN chmod +x /docker/set_env_secrets.sh
RUN dos2unix /docker/set_env_secrets.sh

ENTRYPOINT [ "/docker/custom_entrypoint.sh" ]