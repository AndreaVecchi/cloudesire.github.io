---
layout: page
title: How-to package Django applications
language: en
---

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
