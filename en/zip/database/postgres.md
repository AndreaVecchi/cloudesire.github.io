---
layout: page
title: How-to package applications using Postgres
language: en
---

### PostgreSQL 9.x database

Only plain-text SQL dumps are supported. Due to the limitations of this format in regards to PostgreSQL dumps must be made so that object ownership is not preserved, and data is loaded via INSERT rather than COPY.

For example, if you use pg_dump, you would run:

```
pg_dump -O --inserts --column-inserts my_database_name > V1__init.sql
```
