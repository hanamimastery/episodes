---
layout: page
title: Episodes
paginate:
  collection: episodes
  per_page: 2
---

<ul>
  {% for episode in paginator.resources %}
    <li>
      <a href="{{ episode.relative_url }}">{{ episode.data.title }}</a>
    </li>
  {% endfor %}
</ul>

{% if paginator.total_pages > 1 %}
  <ul class="pagination">
    {% if paginator.previous_page %}
    <li>
      <a href="{{ paginator.previous_page_path }}">Previous Page</a>
    </li>
    {% endif %}
    {% if paginator.next_page %}
    <li>
      <a href="{{ paginator.next_page_path }}">Next Page</a>
    </li>
    {% endif %}
  </ul>
{% endif %}
