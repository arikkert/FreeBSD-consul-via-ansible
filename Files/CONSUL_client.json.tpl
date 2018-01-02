{
	"datacenter" : "zolder",
	"server" : false,
	"enable_script_checks" : true,
	"log_level" : "DEBUG",
	"enable_script_checks" : true,
	"bind_addr" : "{{ facter_networking.ip }}",
	"start_join" : ["consul.{{ facter_networking.domain }}"]
}
