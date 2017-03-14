# Description

This cookbook installs MongoDB 2.6 on Windows and installs it as a service. The intention of this configuration is to be used for development.

# Requirements

## Platform:

* windows (= 10)

## Cookbooks:

*No dependencies defined*

# Attributes

* `node['mongodb-windows']['installation-dir']` -  Defaults to `C:\\bench\\mongodb`.
* `node['mongodb-windows']['installer-path']` -  Defaults to `c:\\Installers\\Mongo\\mongodb-win32-x86_64-2008plus-2.6.12-signed.msi`.

# Recipes

* mongodb-windows::default

# License and Maintainer
Maintainer:: Bob Nowadly (rmnowadly@sep.com)

License:: Apache License 2.0
