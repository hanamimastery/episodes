---
layout: page
title: Articles
---

<ul>
  {% for article in collections.articles.resources %}
    <li>
      <a href="{{ article.relative_url }}">{{ article.data.title }}</a>
    </li>
  {% endfor %}
</ul>

If you have a lot of articles, you may want to consider adding [pagination](https://www.bridgetownrb.com/docs/content/pagination)!
