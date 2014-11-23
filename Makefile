.PHONY: clean centos5 centos6 centos6 all

clean:
	rm -rf packer_cache
	rm -rf vms

centos5: CentOS-5.11.x86_64.box

centos6: CentOS-6.6.x86_64.box

centos7: CentOS-7.0.1406.x86_64.box

all: centos5 centos6 centos7

CentOS-5.11.x86_64.box: packer-templates/CentOS-5.11.x86_64.template.json
	packer build $<
	mkdir -p boxes
	mv $@ boxes/

CentOS-6.6.x86_64.box: packer-templates/CentOS-6.6.x86_64.template.json
	packer build $<
	mkdir -p boxes
	mv $@ boxes/

CentOS-7.0.1406.x86_64.box: packer-templates/CentOS-7.0.1406.x86_64.template.json
	packer build $<
	mkdir -p boxes
	mv $@ boxes/