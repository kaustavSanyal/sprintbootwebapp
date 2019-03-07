FROM jenkins

USER root 

RUN apt update

RUN apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

RUN apt update

RUN apt-cache policy docker-ce

RUN apt install docker-ce

RUN systemctl status docker
