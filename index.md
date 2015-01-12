---
layout: default
title: Home
---

ClouDesire is a cloud app store that allows software vendors to sell and distribute their applications as Software-as-a-Service, in few minutes, by automating several expensive, mission critical and time-consuming tasks.

This website is intended to be used as a resource for software developers to always have updated information about the platform and its API.

<div class="home">

{% for page in site.pages %}
<ul class="post-list">
{% if page.front %}
  <li><h2><a class="page-link" href="{{ page.url | prepend: site.baseurl }}">{{ page.title }}</a></h2></li>
{% endif %}
</ul>
{% endfor %}

<p class="rss-subscribe">subscribe <a href="{{ "/feed.xml" | prepend: site.baseurl }}">via RSS</a></p>

</div>
