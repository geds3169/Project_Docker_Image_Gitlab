# FROM defines the base image used to start the build process
FROM centos:centos7
MAINTAINER The CentOS Project <cloud-ops@centos.org>

# Labels consumed by Red Hat build service
LABEL Name="Project_Docker_Image_Gitlab" \
      Version="1.0.0" \
      Architecture="x86_64" \
      vcs-type="git" \
      vcs-url="https://github.com/geds3169/Project_Docker_Image_Gitlab" \
      distribution-scope="public"

# Labels consumed by OpenShift
LABEL io.k8s.description="Gitlab-ce is an open source program, dedicated to x developers and self-hosted, it allows to have a repository, to do CI/CD, and a part of project management. Postfix is a free and open-source mail transfer agent (MTA)" \
      io.k8s.display-name="Gitlab-ce & Postfix" \
      io.openshift.expose-services="22,80,443:domain" \
LABEL io.openshift.tags="gitlab-ce,postfix"

# Labels some information
LABEL multi.label1="ENG - Self-hosted.all in one. fill in email address and password or use encrypted login and application password (like gmail)." \
      multi.label2="FR - Complétez l'adresse e-mail et le mot de passe ou utilisez un login crypté et un mot de passe d'application (comme gmail)." \

#RUN is the central executing directive for Dockerfiles
## install main packages
RUN yum clean all -y \ 
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org \ 
rpm -Uvh https://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm \ 
yum update -y \ 
yum install epel-release -y \ 
## used for semanage
yum install -y curl policycoreutils-python.x86_64 openssh-server perl -y \
## enable and start services
systemctl enable sshd \
systemctl start sshd \
yum install postfix -y \
systemctl start postfix \
systemctl enable postfix \
## Add Firewall rules
firewall-cmd --zone=public --permanent --add-service=http \
firewall-cmd --zone=public --permanent --add-service=https \
firewall-cmd --reload \ 
    

# ENV sets environment variables
ENV LC_ALL=en_US.UTF-8

# WORKDIR sets the path where the command, defined with CMD, is to be executed.
WORKDIR /root

# Script to install Gitlab-ce
COPY sccript.rpm.sh /
RUN ./script.rpm.sh &
COPY Config_gitlab-ce.sh /
RUN ./Config_gitlab-ce.sh

# EXPOSE associates a specific port to enable networking between the container and the outside world.
EXPOSE 22,80,443/tcp
