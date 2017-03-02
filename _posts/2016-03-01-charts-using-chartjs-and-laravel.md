---
layout: post
title:  "Charts using Chart.js and Laravel"
excerpt: "Create data driven charts using Chart.js and Laravel"
author: "Vishnu"
date:   2016-03-01 00:13:00
categories: programming laravel chartjs
---

Recently I was working on an app that required some simple analytics. It involved charts and reports created from database values and displayed on the dashboard. The backend was in Laravel. For front end I wanted something that was simple. D3.js is a powerful library, but it would’ve been an overkill for a simple application. So I decided to use Chart.js. It is simple and generating charts is a real simple deal.

Also I wanted to plot two different values (months and total projects) from the database against each other by creating them from a single JSON response. I’ll show a simple setup where we have few project records in our database and we display the number of projects per month as a graph. I am no good at writing tutorials yet, so bear with me. Might become better in the future! The table structure was something like this:

```text

+---------------+---------------+------+-----+
| Field         | Type          | Null | Key |
+---------------+---------------+------+-----+
| id            | bigint(20)    | NO   | PRI |
| name          | varchar(250)  | YES  | MUL |
| updated_at    | timestamp     | NO   |     |
+---------------+---------------+------+-----+

```

In the routes.php file declared a route that points to Projects Controller:

```php

<?php

Route::get('/projects/chart/data', 'ProjectsController@projectChartData');

```

The above route fires a method called `projectsChartData()` which simply runs an sql query that returns the count of projects grouped by month. This is a crude way of doing it and I am very sure this can be improved a great deal.


```php

<?php

class ProjectsController extends \BaseController {

    /**
     * Display a the chart for projects.
     * GET /projects/chart/data
     *
     * @return Response
     */
     
    public function projectsChartData()
    {
        $devlist = DB::table('projects')
            ->select(DB::raw('MONTHNAME(updated_at) as month'), DB::raw("DATE_FORMAT(updated_at,'%Y-%m') as monthNum"), DB::raw('count(*) as projects'))
            ->groupBy('monthNum')
            ->get();

        return $devlist;
    }

}

```

The controller returns a variable called `$devlist` that contains the number of projects grouped by month and year and also returns the month names. A view pulls this data via `$.getJSON` as shown below. A for loop is used to create two arrays from the JSON data - one for the labels (months) and other for the data (number of projects).

```javascript

$(function(){
  $.getJSON("/projects/chart/data", function (result) {

    var labels = [],data=[];
    for (var i = 0; i < result.length; i++) {
        labels.push(result[i].month);
        data.push(result[i].projects);
    }

    var buyerData = {
      labels : labels,
      datasets : [
        {
          fillColor : "rgba(240, 127, 110, 0.3)",
          strokeColor : "#f56954",
          pointColor : "#A62121",
          pointStrokeColor : "#741F1F",
          data : data
        }
      ]
    };
    var buyers = document.getElementById('projects-graph').getContext('2d');
    
    new Chart(buyers).Line(buyerData, {
      bezierCurve : true
    });
  });

});

```

<div class="info-box hide-on-small-only">
<p><strong>Update: </strong>In the version 2.0 and above, chart ceation is done as follows:</p>
</div>

```javascript

var chartInstance = new Chart(buyers, {
    type: 'line',
    data: buyerData,
});

```

Rest of the code is simply using chart.js for displaying the data. This is available in chart.js documentation. Finally we need to display the chart on the page. For this a canvas element is added with the id specified in the chart.js code.

```html

<canvas id="projects-graph" width="1000" height="400"></canvas>

```

So this worked out for me an a graph was generated as given below.

<img src="http://media.tumblr.com/57d85ab161396897ab787275f01b1680/tumblr_inline_nknc74divg1qid8j3.png">

Chart.js is really useful for simple charts and is extremely easy to use with Laravel. Hope you find this at least remotely useful! This is a really crude way, but you can definitely improve the code for your use case.