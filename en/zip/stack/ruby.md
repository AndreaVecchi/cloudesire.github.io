---
layout: page
title: How-to package Ruby applications
language: en
---

### Rails applications

The ZIP should contains a folder named **rails-app** containing the application source code. The database configuration file *config/database.yml* will be automatically generated. Mind that database schema can be handled both via migrations and/or *sql* folder.

#### Rack applications

While it is a common practice to make use of the *Rails* framework when choosing Ruby, any other framework  or absence thereof is supported as long as:

* Database connection data is read from the file *config/database.yml*
(either by hand or with the aid of ActiveRecord);
* The application supports *Rack*, and is therefore interfaceable with *Passenger*;
* Gem dependencies are handled with *Bundler*;
* The application includes a JS runtime in its dependencies (e.g.: //gem 'therubyracer'//);
```
