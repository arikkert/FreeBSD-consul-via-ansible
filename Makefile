VERBOSE=-vvv
VERBOSE=
DRYRUN=--check
DRYRUN=
OPTIONS=$(VERBOSE) $(DRYRUN)
YAMLLINT=yamllint $@.yaml

all: deploy
deploy:   ansible consul_deploy   consul_servers_configure   consul_clients_configure   consul_service_checks_configure

undeploy: ansible consul_undeploy consul_servers_unconfigure consul_clients_unconfigure consul_service_checks_unconfigure

ansible:
	$(YAMLLINT)
	ansible-playbook $(OPTIONS) $@.yaml

# check on valid json syntax (jq as a dependency)
# The templates contain cfacter variables
check_json_client:
	jq empty Files/CONSUL_client.json.tpl

check_json_server:
	jq empty Files/CONSUL_server.json.tpl

check_json_service_checks:
	jq empty Files/service_checks.json

# install consul core.
consul_deploy:
	$(YAMLLINT)
	ansible-playbook $(OPTIONS) $@.yaml

consul_undeploy:
	$(YAMLLINT)
	ansible-playbook $(OPTIONS) $@.yaml

# install consul clients.
consul_clients_configure: check_json_client
	$(YAMLLINT)
	ansible-playbook $(OPTIONS) $@.yaml

consul_clients_unconfigure: check_json_client
	$(YAMLLINT)
	ansible-playbook $(OPTIONS) $@.yaml

# install consul server
consul_servers_configure: check_json_server
	$(YAMLLINT)
	ansible-playbook $(OPTIONS) $@.yaml

consul_servers_unconfigure: check_json_server
	$(YAMLLINT)
	ansible-playbook $(OPTIONS) $@.yaml

consul_service_checks_configure: check_json_service_checks
	$(YAMLLINT)
	ansible-playbook $(OPTIONS) $@.yaml

consul_service_checks_unconfigure: check_json_service_checks
	$(YAMLLINT)
	ansible-playbook $(OPTIONS) $@.yaml

# ==============================================

members:
	consul $@

members_via_api:
	curl http://localhost:8500/v1/agent/members

clean:
	rm *.retry
