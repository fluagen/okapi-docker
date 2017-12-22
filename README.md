# okapi-docker

It is built with a basic working modules of okapi.

Basic working modules：

* okapi-core
* mod-users
* mod-login
* mod-permissions
* mod-authtoken

At the moment,The docker was tested through, in the following modules version:

| module          | version |
|-----------------|---------|
| okapi-core      | 2.3.3   |
| mod-users       | 14.3.0  |
| mod-login       | 4.0.1   |
| mod-permissions | 5.0.1   |
| mod-authtoken   | 1.1.1   |


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

### Default init data

The default tenant is testlib.

This user admin/admin is  initialized, his role is the administrator.



