FROM nginx

ARG HABIDAT_TITLE
ARG HABIDAT_DESCRIPTION
ARG HABIDAT_DOMAIN
ARG HABIDAT_DISCOURSE_SUBDOMAIN
ARG HABIDAT_WIKI_SUBDOMAIN
ARG HABIDAT_CLOUD_SUBDOMAIN
ARG HABIDAT_DK_SUBDOMAIN
ARG HABIDAT_ADMIN_EMAIL
ARG HABIDAT_USER_SUBDOMAIN

RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y git ca-certificates

RUN rm -r /usr/share/nginx/html/*

RUN git clone https://github.com/soudis/habidat-landing.git /usr/share/nginx/html

WORKDIR /usr/share/nginx/html

RUN envsubst < index.template.html > index.html
