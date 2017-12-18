#!/bin/bash
module_id=$mod_users_version
service_id=$mod_users_version

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )



# 1.announce module
http_code=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:9130/_/proxy/modules/${module_id})

if test $http_code -eq 200;then
	echo "The $module_id has been announced";
else
	echo "The $module_id start announcement";
	curl -X POST -s \
	     -H "Content-type:application/json" \
	     -d @$DIR/ModuleDescriptor.json \
	     http://localhost:9130/_/proxy/modules
fi

echo 

# 2.deploy module
http_code=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:9130/_/discovery/modules/${service_id})

if test $http_code -eq 200;then
	echo "The $module_id has been deployed";
else
	echo "The $module_id start deploy";
	curl -X POST -s \
	     -H "Content-type:application/json" \
	     -d @$DIR/DeploymentDescriptor.json \
	     http://localhost:9130/_/discovery/modules
fi

echo 

# 3.enable module
http_code=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:9130/_/proxy/tenants/${tenant}/modules/${module_id})

if test $http_code -eq 200;then
	echo "The $module_id has been enabled";
else
	echo "Enable the $module_id for $tenant";
	curl -X POST -s \
	     -H "Content-type:application/json" \
	     -d "{\"id\":\"$module_id\"}" \
	     http://localhost:9130/_/proxy/tenants/${tenant}/modules

fi

echo 

# 4. init data
if test $http_code -ne 200;then
	echo "Create user group";
	curl -X POST -s \
		 -H "Content-type:application/json" \
		 -H "X-Okapi-Tenant:$tenant" \
	     -d @$DIR/group.json \
	     http://localhost:9130/groups
	echo 

	echo "Create admin user";
	curl -X POST -s \
		 -H "Content-type:application/json" \
		 -H "X-Okapi-Tenant:$tenant" \
	     -d @$DIR/users.json \
	     http://localhost:9130/users
	echo 

	echo "Set credential for admin user";
	curl -X POST -s \
		 -H "Content-type:application/json" \
		 -H "X-Okapi-Tenant:$tenant" \
	     -d @$DIR/credential.json \
	     http://localhost:9130/authn/credentials
	echo

	echo "Set permissions for admin user";
	curl -X POST -s \
		 -H "Content-type:application/json" \
		 -H "X-Okapi-Tenant:$tenant" \
	     -d @$DIR/permissions.json \
	     http://localhost:9130/perms/users
	echo
fi



