# FreeBSD-consul-via-ansible
consul installation via ansible on FreeBSD

pre conditions:
- yamllint is installed on the ansible_host
- ansible is installed on all target hosts
- ansible inventory host file contains entries
  [ansible_host]		the host where ansible is triggered
  [freebsd_consul_servers]	the hosts that act as consul servers
  [freebsd_consul_clients]	the hosts that act as consul clients
  as these are used in the ansible playbooks

I'm working on a FreeBSD port for yamllint.
That way yamllint can be installed the FreeBSD way.
For the time being, if yamllint is not installed, just empty the YAMLLINT variable in the Makefile
