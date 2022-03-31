# Openstack Project Template

This is an IaC project template for an example web server in OpenStack with
Terraform and Ansible.

It creates an overlay network with one subnet, adds ssh, http(s) and icmp rules
to security group, starts one Arch Linux instance with ssh keys imported from
`authorized_keys.yaml` and creates DNS zone with one A record pointing to this
instance.

## Terraform

To use terraform you need to save `clouds.yaml` file with your project
credentials. Name of the cloud is configured in `terraform/variables.tf`.

SSH public keys from `authorized_keys.yaml` are uploaded to the instance.

## Ansible

Ansible playbook uses pacman module from `community.general`, which you might
need to install with

    ansible-galaxy collection install community.general

To run playbook execute

    ansible-playbook -i inventory deploy.yml
