FROM ubuntu:20.04
ARG filename=env.txt
RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip install flask==2.1.*
RUN pip install Werkzeug==2.2.2
COPY hello.py /
RUN apt-get install git -y
RUN mkdir /home/gitrepo
ADD --keep-git-dir=true https://github.com/vcjain/docker-learning.git /home/gitrepo/
ENV FLASK_APP=hello MY_SECRET="secret"
RUN echo "Here is the value of environment varaible: ${FLASK_APP}, ${MY_SECRET}"
LABEL app="Pyhton"
LABEL Framework="Flask"
LABEL purpose="sample"
RUN mkdir /home/mydata
RUN echo "volume file: ${FLASK_APP}, ${MY_SECRET}" > /home/mydata/$filename
VOLUME /home/mydata 
EXPOSE 8000
CMD flask run --host 0.0.0.0 --port 8000
