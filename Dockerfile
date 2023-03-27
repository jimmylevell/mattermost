###############################################################################################
# levell mattermost - BASE
###############################################################################################
FROM mattermost/mattermost-enterprise-edition:7.9.1 as levell-mattermost-base

USER root

RUN mkdir -p /docker

RUN apt-get update -y
RUN apt-get install dos2unix

###############################################################################################
# levell mattermost - PRODUCTION
###############################################################################################
FROM levell-mattermost-base as levell-mattermost-deploy

COPY ./docker/custom_entrypoint.sh /docker/custom_entrypoint.sh
RUN chmod +x /docker/custom_entrypoint.sh
RUN dos2unix /docker/custom_entrypoint.sh

COPY ./docker/set_env_secrets.sh /docker/set_env_secrets.sh
RUN chmod +x /docker/set_env_secrets.sh
RUN dos2unix /docker/set_env_secrets.sh

USER mattermost

ENTRYPOINT [ "/docker/custom_entrypoint.sh" ]
