andrewrothstein.flannel
=========
![Build Status](https://github.com/andrewrothstein/ansible-flannel/actions/workflows/build.yml/badge.svg)

Installs [flannel](https://github.com/coreos/flannel)

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.flannel
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
