{
	"datacenter" : "zolder",
	"server" : false,
	"data_dir" : "/var/consul/data-dir",
	"enable_script_checks" : true,
	"log_level" : "DEBUG",
	"enable_script_checks" : true,
	"bind_addr" : "{{ facter_ipaddress }}",
	"start_join" : ["consul.{{ facter_domain }}"]
}
