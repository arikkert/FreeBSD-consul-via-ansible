# FreeBSD-consul-via-ansible
consul installation via ansible on FreeBSD

pre conditions:
* ansible is installed on all target hosts
* ansible inventory host file contains entries
  * [ansible_host]		the host where ansible is triggered
  * [freebsd_consul_servers]	the hosts that act as consul servers
  * [freebsd_consul_clients]	the hosts that act as consul clients
as these entries are used in the ansible playbooks
