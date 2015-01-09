---
layout: page
title: How-to package applications using MongoDB
language: en
---

### MongoDB 2.x database

MongoDB will run on the default port with no authentication and the database name is preserved on the binary dump, so no further configuration should be necessary on the application.

A database dump should be gathered with *mongodump* utility. At the first run, it will be imported using mongorestore utility.
