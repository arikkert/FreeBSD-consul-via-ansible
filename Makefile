all: consul consul_servers consul_clients consul_service_checks

# consul core
consul:
	yamllint $@.yaml
	ansible-playbook $@.yaml

# check on valid json syntax (jq as a dependency)
check_json_client:
	jq empty Files/CONSUL_client.json.tpl

check_json_server:
	jq empty Files/CONSUL_server.json.tpl

check_json_service_checks:
	jq empty Files/service_checks.json

# Check on valid yaml syntax and install consul clients.
# yamllint as dependency
consul_clients: check_json_client
	yamllint $@.yaml
	ansible-playbook $@.yaml

# Check on valid yaml syntax and install consul server
consul_servers: check_json_server
	yamllint $@.yaml
	ansible-playbook $@.yaml

consul_service_checks: check_json_service_checks
	yamllint $@.yaml
	ansible-playbook $@.yaml

# ==============================================

members:
	consul $@

members_via_api:
	curl http://localhost:8500/v1/agent/members

clean:
	rm *.retry
