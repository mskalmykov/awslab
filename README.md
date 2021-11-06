## Ansible role to deploy AWS infrastructure for WordPress

To run the playbooks, you need Ansible 2.10, Python 3.9 and the latest botocore and boto3 python packages. The easiest way to get the required environment is to use the attached Dockerfile.
Just run:

```bash
  docker build -t ansible .
  docker run --rm -it ansible
```

If you prefer the manual way, then use the following commands.

- For Debian 11 (the most tested distro):
```bash
sudo apt update
sudo apt install ansible python3-pip
python3.9 -m pip install --user botocore boto3
ansible-galaxy collection install community.aws
```

- For Ubuntu 20.04:
```bash
sudo apt update
sudo apt install software-properties-common python3-pip
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
python3 -m pip install --user botocore boto3
ansible-galaxy collection install community.aws
```

- For CentOS 8:
```bash
sudo yum update
sudo yum install python39
python3.9 -m pip install --user ansible botocore boto3
ansible-galaxy collection install community.aws
echo "interpreter_python = /usr/bin/python3.9" >> ansible.cfg
```

After install is done, set the environment prior to run the playbooks:
```bash
export AWS_ACCESS_KEY_ID=YOURACCESSKEYIDHERE
export AWS_SECRET_ACCESS_KEY=YOURACTUALSECRETACCESSKEYCOMESHERE
export AWS_DEFAULT_REGION=eu-central-1
```

Then, to create the infrastructure, run:
```bash
ansible-playbook deploy.yml
```

To destroy the infrastructure, when done:
```bash
   ansible-playbook cleanup.yml
```

You may override any variables defined in aws_wp/defaults/main.yml.
If you change the region, you need to change the ec2_instance_ami variable accordingly, as AMI IDs are specific to the region.
