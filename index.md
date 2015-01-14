---
layout: default
title: Home
---

ClouDesire is a *cloud applications store* that allows *software vendors* to sell and distribute their applications as *Software-as-a-Service*, in few minutes, by automating several expensive, mission critical and time-consuming tasks.

This website is intended to be used as a resource for software developers to always have updated information about the platform and its API.

<div class="home">

<ul class="post-list">
{% for page in site.pages %}
{% if page.front %}
  <li><h2><a class="page-link" href="{{ page.url | prepend: site.baseurl }}">{{ page.title }}</a></h2></li>
{% endif %}
{% endfor %}
</ul>

<p class="rss-subscribe">subscribe <a href="{{ "/feed.xml" | prepend: site.baseurl }}">via RSS</a></p>

</div>
