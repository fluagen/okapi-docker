# okapi-docker

It is built with a basic working modules of okapi.

Basic working modules：

* okapi-core
* mod-users
* mod-login
* mod-permissions
* mod-authtoken

At the moment,The docker was tested through in the following modules version:

| module          | version |
|-----------------|---------|
| okapi-core      |	2.16.1  |
| mod-users       | 15.1.0  |
| mod-login       | 4.1.0   |
| mod-permissions | 5.3.0   |
| mod-authtoken   | 1.5.1   |
| mod-users-bl    | 3.0.0   |


## How to use this image

build at first:

```
make build
```

start okapi :

```
make start
```

stop okapi service :

```
make stop
```

remove :

```
make remove
```

### Default initialized data

The default tenant is testlib.

This user admin/admin is  initialized for administrator.


## How to extend this image

1. copy your module to current local repo directory.
2. edit deploy script refer to `./init.d/modules/mod-login/deploy.sh` .
3. copy your deploy script, ModuleDescriptor.json, DeploymentDescriptor.json to `./init.d/modules/${module name}/` directory.
4. modify start.sh add your module info.

### notice

when deploy module, exec fat jar's path like to `/app/repo/mod-authtoken/mod-authtoken-fat.jar`.




## Reference

okapi doc : [https://github.com/folio-org/okapi/blob/master/doc/guide.md](https://github.com/folio-org/okapi/blob/master/doc/guide.md)

