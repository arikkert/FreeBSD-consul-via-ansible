{
	"datacenter" : "zolder",
	"server" : false,
	"enable_script_checks" : true,
	"log_level" : "DEBUG",
	"enable_script_checks" : true,
	"bind_addr" : "{{ ansible_all_ipv4_addresses | ipaddr('NETWORK/NETMASK') | first }}",
	"start_join" : ["consul.{{ ansible_domain }}"]
}
