---
layout: page
title: How-to package applications in zip
language: en
permalink: /en/application-zip-creation.html
---

To be able to deploy automatically an Application, a ZIP package is required, containing:

  * the web application’s source code or packaged artifacts (where applies);
  * the database data that is required for the application to be fully functional - without manual adjustements.

The ZIP package structure must meet the following general criteria:

  * A folder named *sql* when using MySQL and PostgreSQL;
  * A folder named *mongodb* when using MongoDB;
  * A folder with the web application’s code, depending on the language and/or stack used.

## Application Stacks-specific requirements

We support several application stack, but every one has specific things that should be kept in consideration.

### PHP applications

The ZIP should contains a folder named **php-app** containing the application source code, where you have to use the following environment variables containing database connection information:

  * CLOUDESIRE_DB_USER: username to connect to the database;
  * CLOUDESIRE_DB_PASS: password to connect to the database;
  * CLOUDESIRE_DB_NAME: name of the available database;
  * CLOUDESIRE_DB_HOST: currently map to the host database, running on localhost.

In the case that the application runs on MongoDB, only CLOUDESIRE_DB_NAME will be needed, and authentication will be turned off as per default configuration.

### Rails applications

The ZIP should contains a folder named **rails-app** containing the application source code. The database configuration file *config/database.yml* will be automatically generated. Mind that database schema can be handled both via migrations and/or *sql* folder.

#### Rack applications

While it is a common practice to make use of the *Rails* framework when choosing Ruby, any other framework  or absence thereof is supported as long as:

* Database connection data is read from the file *config/database.yml*
 (either by hand or with the aid of ActiveRecord);
* The application supports *Rack*, and is therefore interfaceable with *Passenger*;
* Gem dependencies are handled with *Bundler*;
* The application includes a JS runtime in its dependencies (e.g.: //gem 'therubyracer'//);

### Django applications

The ZIP should contains a folder named **django-app** containing the application source code.

The application should use the *dj-database-url* package in order to retrieve the database connection informations, so it should have default database defined in *settings.py* like:

```
DATABASES = {
  'default': dj_database_url.config(),
}
```

It is also expected that content that needs to be served by the webserver itself (e.g. static files) are placed and referred to either in */static* or */media*
 folders from the application root.

The application is expected to be able to be served by gunicorn, and it can have its migrations handled by south library.

For having everything hooked-in, the requirements.txt should contains something like:

```
Django==1.6.2
South==0.8.4
dj-database-url==0.2.2
dj-static==0.0.5
gunicorn==18.0
```

### Java applications

The ZIP should contains a folder named **java-app** containing the web application WAR and it should be using the *JNDI resource* named *jdbc/datasource* to be able to retrieve a connection for the current database. It is expected that the application can run under Tomcat.

### NodeJS applications

The ZIP should contains a folder named **nodejs-app** containing the application code. The application is required to use the NODE_PORT environment variable when choosing on which port the application should listen to (using process.env.NODE_PORT). It is assumed that a node.js application is built on *express* or a compatible framework, and uses *npm* to handle dependencies.

## Database-specific requirements

An application could automatically initialize the database schema at the first run, otherwise it's possible to insert a database dump into the zip.
We adopted the [flyway](http://flywaydb.org/) database migration tool, that supports schema versioning by simply creating multiple .sql file starting with the version number. For example:

```
V1__initial_schema.sql
V2__added_field.sql
V3__added_index.sql
```

For more information, refer directly to the [flyway documentation](http://flywaydb.org/documentation/migration/sql.html).

### MySQL 5.x database

The script should be in the standard .sql format, e.g.: generated via *mysqldump* tool. It should not contains any administrative command, like CREATE DATABASE or GRANT PRIVILEGES.

### PostgreSQL 9.x database

Only plain-text SQL dumps are supported. Due to the limitations of this format in regards to PostgreSQL dumps must be made so that object ownership is not preserved, and data is loaded via INSERT rather than COPY.

For example, if you use pg_dump, you would run:

```
pg_dump -O --inserts --column-inserts my_database_name > V1__init.sql
```

### MongoDB 2.x database

MongoDB will run on the default port with no authentication and the database name is preserved on the binary dump, so no further configuration should be necessary on the application.

A database dump should be gathered with *mongodump* utility. At the first run, it will be imported using mongorestore utility.

## After-deploy script

It's possible to automatically execute custom commands on the last stage of the deploy, just in case you need some special hook before the application is really ready to be used.

Just put in the application folder a file named cloudesire.build, starting with a standard [shebang](http://en.wikipedia.org/wiki/Shebang_(Unix)), e.g.:

```
#!/bin/bash
echo 'Build completed' > log.txt
```

This file will be executed at the end of the deploy process. Keep in mind that if the script return a non-zero value, it is considered a fail, and the deploy attempt will fail.
