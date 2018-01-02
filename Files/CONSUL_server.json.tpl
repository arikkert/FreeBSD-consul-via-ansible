{
	"datacenter" : "zolder",
	"server" : true,
	"enable_script_checks" : true,
	"log_level" : "DEBUG",
	"bind_addr" : "{{ facter_networking.ip }}",
	"bootstrap_expect" : 3,
	"start_join" : ["consul.{{ facter_networking.domain }}"]
}
