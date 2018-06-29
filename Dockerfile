FROM jenkins

USER root
# uncomment these lines if behind a proxy server
# ENV HTTP_PROXY 'http://<proxy>:8080'
# ENV HTTPS_PROXY 'http://<proxy>:8080'
# RUN export http_proxy=$HTTP_PROXY
# RUN export https_proxy=$HTTPS_PROXY
RUN apt-get update
RUN curl -fsSL https://get.docker.com | sh
RUN apt-get install -y sudo
RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
# append to the jenkins starter shell to change owner jenkins starts
RUN echo "sudo chown jenkins /var/run/docker.sock" >> /usr/local/bin/jenkins.sh

USER jenkins
