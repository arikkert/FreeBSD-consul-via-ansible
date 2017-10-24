{
	"datacenter" : "zolder",
	"server" : true,
	"data_dir" : "/var/consul/data-dir",
	"enable_script_checks" : true,
	"log_level" : "DEBUG",
	"bind_addr" : "{{ facter_ipaddress }}",
	"bootstrap_expect" : 3,
	"start_join" : ["consul.{{ facter_domain }}"]
}
