#!/bin/bash
tenant="testlib"
module_id="mod-login-4.0.1-SNAPSHOT"
service_id="mod-login-4.0.1-SNAPSHOT"

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )



# 1.announce module
http_code=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:9130/_/proxy/modules/${module_id})

if test $http_code -eq 200;then
	echo "The $module_id has been announced";
else
	echo "The $module_id start announcement";
	curl -X POST -s \
	     -H "Content-type:application/type" \
	     -d @$DIR/ModuleDescriptor.json \
	     http://localhost:9130/_/proxy/modules
fi

# 2.deploy module
http_code=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:9130/_/discovery/modules/${service_id})

if test $http_code -eq 200;then
	echo "The $module_id has been deployed";
else
	echo "The $module_id start deploy";
	curl -X POST -s \
	     -H "Content-type:application/type" \
	     -d @$DIR/DeploymentDescriptor.json \
	     http://localhost:9130/_/discovery/modules
fi

# 3.enable module
http_code=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:9130/_/proxy/tenants/${tenant}/modules/${module_id})

if test $http_code -eq 200;then
	echo "The $module_id has been enabled";
else
	echo "Enable the $module_id for $tenant";
	curl -X POST -s \
	     -H "Content-type:application/type" \
	     -d "{\"id\":\"$module_id\"}" \
	     http://localhost:9130/_/proxy/tenants/${tenant}/modules
fi




