VERBOSE=-vvv
VERBOSE=
DRYRUN=--check
DRYRUN=
OPTIONS=$(VERBOSE) $(DRYRUN)
YAMLLINT=@if which yamllint > /dev/null; then yamllint $@.yaml; fi
PLAYBOOK=ansible-playbook $(OPTIONS) $@.yaml

# All the targets are phony

all: deploy
deploy: ansible \
	ports_install \
	consul_deploy \
	consul_servers_configure   consul_clients_configure \
	consul_service_checks_configure \
	members

undeploy: ansible \
	ports_deinstall \
	consul_undeploy \
	consul_servers_unconfigure consul_clients_unconfigure \
	consul_service_checks_unconfigure

ansible:
	$(YAMLLINT)
	$(PLAYBOOK)

portlint:
	portlint Files/ports/textproc/*

ports_install:
	$(YAMLLINT)
	$(PLAYBOOK)

ports_deinstall:
	$(YAMLLINT)
	$(PLAYBOOK)

# Force the clients to listen on the same network as the ansible host
create_client_template:
	@NETWORK=$$(facter networking.network); \
	NETMASK=$$(facter networking.netmask); \
	cat Files/CONSUL_client.json.tpl.tpl | sed s/NETWORK/$${NETWORK}/g | sed s/NETMASK/$${NETMASK}/g > Files/CONSUL_client.json.tpl

# check on valid json syntax (jq as a dependency)
# The templates contain cfacter variables
check_json_client: create_client_template
	if which jq > /dev/null; then jq empty Files/CONSUL_client.json.tpl; fi

check_json_server:
	if which jq > /dev/null; then jq empty Files/CONSUL_server.json.tpl; fi

check_json_service_checks:
	if which jq > /dev/null; then jq empty Files/service_checks.json; fi

# install consul core.
consul_deploy:
	$(YAMLLINT)
	$(PLAYBOOK)

consul_undeploy:
	$(YAMLLINT)
	$(PLAYBOOK)

# install consul clients.
consul_clients_configure: check_json_client
	$(YAMLLINT)
	$(PLAYBOOK)
	rm Files/CONSUL_client.json.tpl

consul_clients_unconfigure: check_json_client
	$(YAMLLINT)
	$(PLAYBOOK)

# install consul server
consul_servers_configure: check_json_server
	$(YAMLLINT)
	$(PLAYBOOK)

consul_servers_unconfigure: check_json_server
	$(YAMLLINT)
	$(PLAYBOOK)

consul_service_checks_configure: check_json_service_checks
	$(YAMLLINT)
	$(PLAYBOOK)

consul_service_checks_unconfigure: check_json_service_checks
	$(YAMLLINT)
	$(PLAYBOOK)

# ==============================================

# show all members, should be alive. Use as test
members:
	consul $@

members_via_api:
	curl http://localhost:8500/v1/agent/members

clean:
	rm *.retry
