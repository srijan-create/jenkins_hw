FROM centos:7

RUN yum install sudo -y

RUN yum install wget -y

RUN yum install git -y
RUN sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

RUN sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
RUN yum install jenkins -y

RUN yum install java -y

RUN echo -e "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER jenkins
ENV USER jenkins
 
CMD ["java","-jar","/usr/lib/jenkins/jenkins.war"]




