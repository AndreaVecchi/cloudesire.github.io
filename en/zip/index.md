---
layout: page
title: ZIP packaging of applications
language: en
front: yes
---

To be able to deploy automatically an Application, a ZIP package is required, containing:

  * the web application’s source code or the packaged artifacts;
  * the database data that is required for the application to be fully functional - without any manual adjustments.

The ZIP package structure must meet the following general criteria:

  * a *sql* folder if using MySQL or Postgres;
  * a *mongodb* folder if using MongoDB;
  * a folder with the web application’s code, depending on the language and/or stack used (follow the links below for your application stack).

## Application Stacks-specific requirements

We support several application stack, but every one has specific things that should be kept in consideration.

{% for page in site.pages %}
{% if page.url contains 'zip/stack' %}
* [{{ page.title }}]({{ page.url }})
{% endif %}
{% endfor %}

## Database-specific requirements

An application could automatically initialize the database schema at the first run, otherwise it's possible to insert a database dump into the zip.
We adopted the [flyway](http://flywaydb.org/) database migration tool, that supports schema versioning by simply creating multiple .sql file starting with the version number. For example:

```
V1__initial_schema.sql
V2__added_field.sql
V3__added_index.sql
```

For more information, refer directly to the [flyway documentation](http://flywaydb.org/documentation/migration/sql.html).

{% for page in site.pages %}
{% if page.url contains 'zip/database' %}
* [{{ page.title }}]({{ page.url }})
{% endif %}
{% endfor %}

## Post-deploy script

It's possible to automatically execute custom commands on the last stage of the deploy, just in case you need some special hook before the application is really ready to be used.

Just put in the application folder a file named cloudesire.build, starting with a standard [shebang](http://en.wikipedia.org/wiki/Shebang_(Unix)), e.g.:

```
#!/bin/bash
echo 'Build completed' > log.txt
```

This file will be executed at the end of the deploy process. Keep in mind that if the script return a non-zero value, it is considered a fail, and the deploy attempt will fail.
