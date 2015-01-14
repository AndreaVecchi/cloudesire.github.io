---
layout: page
title: REST API Guide
language: en
category: articles
---

The ClouDesire API is based on **REST** principles and uses **JSON** as data exchange format.

## URI format

To access resources, you need to use an URI with the format:

    https://{domain}/api/{resource}/{resourceId}


## Endpoint (SSL strictly required)

* Production API domain: *backend.cloudesire.com*
* Testing API domain: *staging.cloudesire.com*

You are free to register an account and use the staging endpoint but its availability is not guaranteed, and you will have early access to new bugs and sometimes features.

## Authentication

The API support two different authentication methods:

* Via username/email and password supplied as standard [Basic Auth](http://en.wikipedia.org/wiki/Basic_access_authentication);
* Via an authentication token, short-lived or immortal, that can be requested via API.

### Login token retrieving and usage

To request an authentication token you need to send an authenticated ```GET /login``` request using your credentials supplied as Basic Auth:

{% highlight http %}
GET /api/login HTTP/1.1
Authorization: Basic YWRtaW46YWRtaW4=
Host: staging.cloudesire.com
User-Agent: HTTPie/0.7.2
{% endhighlight %}

{% highlight http %}
HTTP/1.1 200 OK
Content-Type: application/json

"hrNSv0ZPZVVeDkf8Pta2RLmkyVqEcKMfzTdCUi8voLQMOUcHUMaqSyylhVAVZ8rZSkl4lsNiWemC6l6WSnqnILhXYQcrPIZm"
{% endhighlight %}

Then, just stop using Basic Auth and start setting two additional headers for every request, one for the token and one for your username:

{% highlight http %}
GET /api/login HTTP/1.1
CMW-Auth-Token: hrNSv0ZPZVVeDkf8Pta2RLmkyVqEcKMfzTdCUi8voLQMOUcHUMaqSyylhVAVZ8rZSkl4lsNiWemC6l6WSnqnILhXYQcrPIZm
CMW-Auth-User: admin
Host: staging.cloudesire.com
User-Agent: HTTPie/0.7.2
{% endhighlight %}

When the token will expire you will get a ```401``` error respose and you should request a new one.

If you need a token that doesn't expire, use the ```expire``` parameter:

{% highlight http %}
GET /api/login?expire=false HTTP/1.1
{% endhighlight %}


# Typical Server Responses

|-----------|-----------------------|---------------------------------------------------------------------------------------------|
| Code      |  Short Description    |      Long Description                                                                       |
|-----------|-----------------------|---------------------------------------------------------------------------------------------|
|    200    | OK                    | The request was successful                                                                  |
|    201    | Created               | The request was successful and a resource was created                                       |
|    204    | No Content            | The request was successful but there is no representation to return (the response is empty) |
|    400    | Bad Request           | The request could not be understood or was missing required parameters                      |
|    401    | Unauthorized          | Authentication failed or authentication token is expired                                    |
|    403    | Forbidden             | Access denied, you can't do that.                                                           |
|    404    | Not Found             | Resource was not found, or was deleted recently.                                            |
|    405    | Method Not Allowed    | Requested method is not supported for the specified resource                                |
|    500    | Internal Server Error | You have just found a bug and we have been already alerted                                  |
|    503    | Service Unavailable   | The service is temporary unavailable (e.g. server maintenance). Try again later             |
|-----------|-----------------------|---------------------------------------------------------------------------------------------|
{: class="table"}


# First Request Example

Now that you know where and how to make an authenticated request, start fetching your own account details by issuing a ```GET /user/me``` request:

{% highlight http %}
GET /api/user/me HTTP/1.1
CMW-Auth-Token: hrNSv0ZPZVVeDkf8Pta2RLmkyVqEcKMfzTdCUi8voLQMOUcHUMaqSyylhVAVZ8rZSkl4lsNiWemC6l6WSnqnILhXYQcrPIZm
CMW-Auth-User: admin
Host: staging.cloudesire.com
User-Agent: HTTPie/0.7.2
{% endhighlight %}


{% highlight http %}
HTTP/1.1 200 OK
CMW-Deprecated-By-Version: 2
Content-Type: application/json
Date: Tue, 13 Jan 2015 15:05:52 GMT

{
  "acceptedTerms": true,
  "activated": true,
  "activationDate": "2014-01-01T00:00:00Z",
  "address": {
    "address": "Via Pisana",
    "city": "Pisa",
    "country": "ITALY",
    "countryCode": "IT",
    "id": 4,
    "zipCode": "12345"
    },
    "company": {
      "url": "company/1"
      },
    "creationDate": "2014-07-02T08:20:01Z",
    "email": "dev@cloudesire.com",
    "enabled": true,
    "environment": "cloudesire",
    "id": 3,
    "name": "Admin",
    "newbie": false,
    "phoneNumber": "0123456789",
    "self": "user/3",
    "userName": "admin",
    "userRole": "ROLE_ADMIN"
}
{% endhighlight %}

## Common Fields

Now that you see the first full response from the API, you may have noticed the following peculiarities:

* Each resource contains a ```self``` attribute that represent its unique URL;
* Linked resources (e.g.: company), are referenced by an object containing an ``url`` field.
* Date field are in *ISO 8601* format containing both time and timezone information (UTC as default).

## Common operations

Usually each resource support the basic CRUD operations mapped on the four HTTP verbs:

* ```GET``` for retrieving;
* ```POST``` for creation;
* ```PUT``` for modification;
* ```DELETE``` for deletion.

Sometimes the method ```PATCH``` is used either for partial modification or for custom actions.

# API Reference

For a precise and updated list of resource and operations refer to our [API Reference](http://api.cloudesire.com).

# API Versioning

To be described
