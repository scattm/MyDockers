FROM httpd:2.4-alpine
LABEL maintainer nghia@viisix.space

ENV CUSTOM_CONFIG_DIR conf/custom

RUN mkdir -p /usr/local/apache2/${CUSTOM_CONFIG_DIR}
RUN echo "Include ${CUSTOM_CONFIG_DIR}/*.conf" >> /usr/local/apache2/conf/httpd.conf

CMD ["httpd-foreground"]
