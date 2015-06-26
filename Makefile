all: help

help:
	@echo ""
	@echo "-- Help Menu"
	@echo ""   1. make server       - run rancher server (then configure Auth)

config: url dataplay configplay initplay layconfiglock

server: config serverplay

client: clientname gencert clientretrieve

layconfiglock:
	@echo 1 >config

gencert:
	ansible-playbook openvpnservergencert.yml

clientretrieve:
	ansible-playbook openvpnserverclientretrieve.yml

configplay:
	ansible-playbook openvpnserverconfig.yml

initplay:
	ansible-playbook openvpnserverinit.yml

dataplay:
	ansible-playbook openvpndatacontainer.yml

serverplay:
	ansible-playbook openvpnserver.yml

bootstrap:
	ansible-playbook bootstrapAnsible.yml

clientname:
	@while [ -z "$$clientname" ]; do \
		read -r -p "Enter the clientname you wish to associate with this vpn  [clientname]: " clientname; echo "$$clientname">>clientname; cat clientname; \
	done ;

url:
	@while [ -z "$$url" ]; do \
		read -r -p "Enter the url you wish to associate with this vpn  [url]: " url; echo "$$url">>url; cat url; \
	done ;
