FROM ubuntu:20.04
ARG filename=env.txt
RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip install flask==2.1.*
RUN pip install Werkzeug==2.2.2
