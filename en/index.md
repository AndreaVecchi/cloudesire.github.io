---
layout: page
title: Articles
front: yes
---

This section contains all the english articles.

{% for page in site.pages %}
<ul class="post-list">
{% if page.language == 'en' and page.category == 'articles' %}
<li>
<h2>
<a class="page-link" href="{{ page.url | prepend: site.baseurl }}">{{ page.title }}</a>
</h2>
</li>
{% endif %}
</ul>
{% endfor %}
