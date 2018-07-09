FROM jenkins

USER root
# uncomment these lines if behind a proxy server
# ENV HTTP_PROXY 'http://<proxy>:8080'
# ENV HTTPS_PROXY 'http://<proxy>:8080'
# RUN export http_proxy=$HTTP_PROXY
# RUN export https_proxy=$HTTPS_PROXY
# RUN apt-get update && \
#     curl -fsSL https://get.docker.com | sh && \
#     apt-get install -y sudo && \
#     echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
#     sed -i 's/#! \/bin\/bash -e/#! \/bin\/bash -e\n\nsudo chown jenkins \/var\/run\/docker.sock/' /usr/local/bin/jenkins.sh
#     # insert to the jenkins starter to change the ownership to share the docker daemon

# using one liner command to reduce the layer number of the images is not that ideal
# since the dockerfile is changed to become unreadable
# and the process running time increased around 12.5% in ubuntu running under virtualbox
RUN apt-get update
RUN curl -fsSL https://get.docker.com | sh
RUN apt-get install -y sudo
RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
# insert to the jenkins starter to change the ownership to share the docker daemon
RUN sed -i 's/#! \/bin\/bash -e/#! \/bin\/bash -e\n\nsudo chown jenkins \/var\/run\/docker.sock/' /usr/local/bin/jenkins.sh
