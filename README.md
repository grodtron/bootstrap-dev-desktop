The purpose of this script is to set up a fresh EC2 Ubuntu 22.04 instance as a development environment.
The motivation is to have flexibility in the hardware to use for development (maybe sometimes I want a lot of ram/cpu, sometimes not),
as well as to allow me to save money, by only spinning up a machine for personal projects during the small bits of time I
have to actually work on personal projects.

Usage is:


```
ssh -i ec2-managed-key.pem ubuntu@$IP_ADDRESS 'git clone https://github.com/grodtron/bootstrap-dev-desktop.git && cd bootstrap-dev-desktop && ./bootstrap.sh'
```

Once this completes, you should be able to do

```
ssh -i personal-private-key gordon@$IP_ADDRESS
```
