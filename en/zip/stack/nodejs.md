---
layout: page
title: How-to package NodeJS applications
language: en
---

### NodeJS applications

The ZIP should contains a folder named **nodejs-app** containing the application code. The application is required to use the NODE_PORT environment variable when choosing on which port the application should listen to (using *process.env.NODE_PORT*). It is assumed that a node.js application is built on *express* or a compatible framework, and uses *npm* to handle dependencies.
