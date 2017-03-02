---
layout: post
title:  "Styling HTML radio button and checkbox"
excerpt: "How to change the default style of the html radio button and checkbox"
author: "Vishnu"
date:   2016-02-29 00:13:00
categories: html css
---

While you can design most of the elements like textboxes, button and links on an HTML page, styling checkboxes and radio buttons are not easy. Here is a small hack to style radio button and checkboxes. There might be many ways, but this is just one cool way.

<img class="img-responsive" src="http://media.tumblr.com/558aff28bfa34dda1690118ee8d29d46/tumblr_inline_nkzeveJIuu1qid8j3.png" alt="image" />

The HTML markup for the radio box and the check box:


{% highlight html %}

<!-- HTML markup for the radio button -->

<div class="radio">
    <label>
        <input name="option1" type="radio">
        <span>option 1</span>
    </label>
</div>

<div class="radio">
    <label>
        <input name="option2" type="radio">
        <span>option 2</span>
    </label>
</div>

<!-- HTML markup for the checkbox -->

<div class="checkbox">
    <label>
        <input type="checkbox">
        <span>check me</span>
    </label>
</div>

{% endhighlight %}

In the above markup, the label the input is within the label tag so that clicking on the radio will also toggle the select-unselect. For this trick to work you need the Glyphicon package that ships by default with bootstrap. If you are not using bootstrap, please get glyphicons for yout site here. The default radio button and checkboxes are replaced by glyphycons. Add the following css snippet to your stylesheet.


{% highlight css %}

/* ========== Custom styles for radio and checkbox =============== */
input[type="radio"],            /* hiding the default checkbox and radio button */
input[type="checkbox"] {
  display:none;
}

input[type="radio"] + span:before,  /* Styling and positioning */
input[type="checkbox"] + span:before {
  position: relative;
  top: 1px;
  display: inline-block;
  font-family: 'Glyphicons Halflings';  /* Glyphicons replace the default elements */
  font-weight: 400;
  line-height: 1;
}


input[type="radio"] + span:before {
  content: "\e165";    /* glyphicon record */
  color: #EF5350;
  margin-right: 5px;
}

input[type="radio"]:checked + span:before {
  content: "\e089";    /* glyphicon ok-circle */
  color: #2196F3;
}


input[type="checkbox"] + span:before {
  content: "\e157";   /* glyphicon unchecked */
  color: #EF5350;
  margin-right: 5px;
}

input[type="checkbox"]:checked + span:before {
  content: "\e067";   /* glyphicon checked */
  color: #2196F3;
}

.checkbox label, .radio label {
    padding-left: 0px;
}

{% endhighlight %}



Now you have a beautifully styled radio button and check box. You can play around with the colours to match your design and also use fontawesome instead of glyphicons. I have been playing around with Codepen a bit lately. So I thought I'll sample this on a pen:

<p data-height="268" data-theme-id="0" data-slug-hash="YPbmMJ" data-default-tab="result" data-user="neoelemento" class='codepen'>See the Pen <a href='http://codepen.io/neoelemento/pen/YPbmMJ/'>Styled Checkbox and Radio Buttons</a> by Vishnu Padmanabhan (<a href='http://codepen.io/neoelemento'>@neoelemento</a>) on <a href='http://codepen.io'>CodePen</a>.</p>
<script async src="//assets.codepen.io/assets/embed/ei.js" async="async"></script>

Hope this helps in making your UI look a bit better. Happy coding!
