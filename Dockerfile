FROM debian:bullseye
WORKDIR /awslab
RUN apt-get update
RUN apt-get -y install ansible python3-pip
RUN python3 -m pip install botocore boto3
RUN ansible-galaxy collection install community.aws
COPY docker-bashrc /root/.bashrc
COPY . .
CMD bash
