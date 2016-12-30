FROM node:7.3-alpine
MAINTAINER negabaro kim<negabaro@gmail.com>

ENV PYTHON_VERSION=2.7.12-r0
ENV PY_PIP_VERSION=8.1.2-r0
ENV SUPERVISOR_VERSION=3.3.0

RUN mkdir -p /var/log/supervisor ;\
    apk add --no-cache \
    vim \
    bash 
RUN apk update && apk add -u python=$PYTHON_VERSION py-pip=$PY_PIP_VERSION
RUN pip install supervisor==$SUPERVISOR_VERSION

#RUN npm install supervisor -g

ADD files /attachment

#RUN tee /etc/supervisord.conf <<EOS
#[unix_http_server]
#file=/tmp/supervisor.sock   ; (the path to the socket file)
#
#[supervisord]
#nodaemon=true

#[program:w1]
#command=node app.js
#directory=/app/docker/5000_port_hello_express
#autostart=true
#numprocs=2
#autostart=false
#
#[program:w2]
#command=node app.js
#directory=/app/docker/5001_port_hello_express_css_view
#autostart=true
#numprocs=3
#autostart=false
#EOS


#CMD [ "node" ]
WORKDIR /app
#CMD tail -f /dev/stdout

CMD sh /attachment/run_sh.sh && supervisord -c /attachment/supervisord.conf

#ENTRYPOINT ["supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]
#CMD sh /attachment/run_sh.sh 
