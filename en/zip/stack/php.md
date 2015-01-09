---
layout: page
title: How-to package PHP applications
language: en
---

### PHP applications

The ZIP should contains a folder named **php-app** containing the application source code, and you have to use the following environment variables containing database connection information:

* CLOUDESIRE_DB_USER: username to connect to the database;
* CLOUDESIRE_DB_PASS: password to connect to the database;
* CLOUDESIRE_DB_NAME: name of the available database;
* CLOUDESIRE_DB_HOST: currently map to the host database, running on localhost.

In the case that the application runs on MongoDB, only CLOUDESIRE_DB_NAME will be needed, and authentication will be turned off as per default configuration.

Example of a generic config.php:

```
define('db_name', getenv('CLOUDESIRE_DB_NAME'));
define('db_username', getenv('CLOUDESIRE_DB_USER'));
define('db_password', getenv('CLOUDESIRE_DB_PASS'));
```
