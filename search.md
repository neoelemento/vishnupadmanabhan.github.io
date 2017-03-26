---
layout: page
title: Search
---
<!--<form action="/search" method="GET" class="main_search">
    <div class="row">
        <div class="input-group">
            <input type="text" class="form-control" name="query" id="search-box" placeholder="eg. javascript, jekyll etc">
            <span class="input-group-btn">
                <button type="submit" class="btn btn-green btn-block"><i class="fa fa-search" aria-hidden="true"></i></button>
            </span>
        </div>
    </div>
</form>-->

<ul id="search-results"></ul>

<script>
  window.store = {
    {% for post in site.posts %}
      "{{ post.url | slugify }}": {
        "title": "{{ post.title | xml_escape }}",
        "author": "{{ post.author | xml_escape }}",
        "categories": '{{ post.categories | xml_escape | strip_html }}',
        "content": {{ post.content | strip_html | truncatewords: 15 | strip_newlines | jsonify }},
        "excerpt": "{{ post.excerpt | xml_escape }}",
        "url": "{{ post.url | xml_escape }}"
      }
      {% unless forloop.last %},{% endunless %}
    {% endfor %}
  };
</script>

<script src="/js/lunr.js"></script>
<script src="/js/search.js"></script>