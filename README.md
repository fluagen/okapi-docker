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

### Default initialized data

The default tenant is testlib.

This user admin/admin is  initialized for administrator.


## How to extend this image

1. copy your module to current local repo directory.
2. registe module and deploy module request okapi rest service.
3. enable the module for tenant testlib.

### notice

when deploy module, exec fat jar's path like to `/app/repo/mod-authtoken/mod-authtoken-fat.jar`.




## Reference

okapi doc : [https://github.com/folio-org/okapi/blob/master/doc/guide.md](https://github.com/folio-org/okapi/blob/master/doc/guide.md)

