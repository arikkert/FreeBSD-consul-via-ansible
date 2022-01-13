{
	"datacenter" : "zolder",
	"server" : true,
	"enable_script_checks" : true,
	"log_level" : "DEBUG",
	"bind_addr" : "{{ ansible_all_ipv4_addresses | ipaddr(ansible_default_ipv4.network + '/' + ansible_default_ipv4.netmask) | first }}",
	"bootstrap_expect" : 3,
	"start_join" : ["consul.{{ ansible_domain }}"]
}
