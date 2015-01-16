---
layout: page
title: Supported Cloud Providers (IaaS)
language: en
category: articles
---

The currently supported Cloud Providers are:

|---------------------+--------------+----------------+------------------------------------|
| Name                | Linux Stacks | .NET (Windows) | Notes                              |
|---------------------+--------------+----------------+------------------------------------|
| Amazon AWS          |      ☑       |       ☑       | VPC instances not yet supported    |
| Digital Ocean       |      ☑       |       ☒       | No additional data disks available |
| Enter the Cloud     |      ☑       |       ☒       |                                    |
| Google Compute      |      ☑       |       ☒       |                                    |
| HPCloud             |      ☑       |       ☒       |                                    |
| IBM Softlayer       |      ☑       |       ☒       |                                    |
| Joyent              |      ☑       |       ☒       |                                    |
| Microsoft Azure     |      ☑       |       ☒       |                                    |
| Rackspace           |      ☑       |       ☒       | Data disk minimun size 100 GB      |
|---------------------+--------------+----------------+------------------------------------|
{: class="table"}

## Java Clients for Cloud Providers

* Most cloud providers are supported via [jclouds](https://jclouds.apache.org/) API
* [Azure client](https://github.com/ClouDesire/azure-api-client)
* [Joyent client](https://github.com/ClouDesire/joyent-api-client)
* [Google Compute Engine client](https://github.com/ClouDesire/gce-api-client)
