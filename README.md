# FreeBSD-consul-via-ansible
HashiCorp consul installation via ansible on FreeBSD

pre conditions:
* ansible is configured for all target hosts
* ansible inventory host file contains entries (cause used in ansible playbooks)
  * [ansible_host]		the host where ansible is triggered
  * [freebsd_consul_servers]	the hosts that act as consul cluster servers
  * [freebsd_consul_clients]	the hosts that act as consul clients
  * [freebsd_consul_monitor]    the host that is used as web console
