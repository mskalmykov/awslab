Ansible role to deploy AWS infrastructure fot WordPress.

Prepare the environment in CentOS:

```bash
sudo yum -y install epel-release
sudo yum -y install ansible
sudo pip3 install boto3
ansible-galaxy collection install amazon.aws
export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
export AWS_DEFAULT_REGION=eu-central-1
```

Run  the playbook:
```bash
ansible-playbook main.yml
```
