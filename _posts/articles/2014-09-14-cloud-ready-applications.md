---
layout: post
title: Bringing a web application to the cloud
categories: articles
excerpt: Bringing a web application to the cloud adds some restricitons and requires to handle some stuff differently.
---

Being a web developer for quite some time now, I recently had the change to get
involved in a project where we are building a platform as a service (PaaS).
Needless to say that I took the changes and tried to deploy a few apps of my
own. I found that bringing an app to the cloud needs some preparation and there
are two things I consider being crucial: a cloud ready app must be stateless and
must be able to use environment variables for configuration.

A PaaS runs your app in container or some other form of isolation. Fact is that
the storage is ephemeral and everything you have written to the file system will
be lost once the app gets restarted and if you are using horizontal scaling, the
files of the instances are not shared with each other.  Ok, no local filesystem
but where do my user uploaded files go? Well, we should use a storage service
like OpenStacks Swift storage or Amazons S3.

The two PaaS systems I know, which are [Heroku](https://www.heroku.com/) and
[Cloud Foundry](http://cloudfoundry.org/index.html), allow you to bind services
like mysql databases, Memcached or the above mentioned storage services to your
app. They are doing this by injecting the access credentials of the services
into your apps execution environment as environment variables. In order to use
those services, your app must be capable of picking them up.

So bringing a web application adds some restrictions and requires you to handle
some stuff differently. For the better or worse? I can not tell yet.

