---
layout: post
title:  "JavaScript Everywhere!"
excerpt: "JavaScript has come a long way as a programming language, just my thoughts on it and a retrospect."
banner: http://res.cloudinary.com/vishnupadmanabhan/image/upload/v1488592010/js.jpg
author: "Vishnu"
date:   2015-10-24 11:05:00
categories: javascript
comments: true
---
## Retrospect
For past few years, JavaScript has taken over the programming world like no other language before. From something like this:

{% highlight javascript %}
// simple alert box
alert('How are you today?');

{% endhighlight %}

to something as complex as:

{% highlight javascript %}
// a Node.js server
var http = require("http");
var server = http.createServer(function(request, response) {
  response.writeHead(200, {"Content-Type": "text/html"});
  response.write("working");
});

server.listen(80);
console.log("Server is listening");

{% endhighlight %}

My earliest memory of JavaScript is from a time when it was used to popup little messages on the screen using our ever dear friend, the alert box. It was considered to be an evil language for quite a long time. In fact I thought of it to be so useless that I never bothered to give it a serious thought. But this changed over time and today I consider JavaScript to be one of the most popular and powerful languages.

Today, you can create a web app, mobile app and a desktop app using JavaScript, HTML and CSS. That means if you spend sometime mastering JavaScript, you are not restricted in developing for just the browser. Apart fron powering web applications and web apps, JavaScript is powering text editors, pre processing tools, mobile apps and much more.

## Web space

Beginning with the web space, we have seen countless frameworks and libraries coming up in the JS world recently. Starting with [jQuery](http://jquery.org). jQuery was cool and still is. It gave much more flexibility and creating dynamic web pages became easier. Towards the end of first decade came a long list of JavaScript frameworks like [Angular](http://angularjs.org), [Backbone](http://backbonejs.org), [Ember](http://emberjs.com) etc. Some of these were MVC type framworks that could handle the entire front end and a backend language was required only as a persistence layer.

On of the major breakthrough in JavaScript world came with [Node.js](http://nodejs.org). Node took JavaScript from being a client side scripting language to a server side language. With node came [npm](http://npmjs.com) - **Node Package Manager**, which became the default package manager for JavaScript runtime. It helps in installing modules through a simple command as follows:

{% highlight bash %}

$ npm install module

{% endhighlight %}

This gave a real flexibility for a developer improve his workflow and also helped in bringing a convergence between frontend and backend platforms. In short you could build a complete web application using JavaScript all the way from frontend to backend and what do you know, web was never the same again!

## Mobile space

JavaScript has made it's presence felt in the mobile world initially through responsive web for mobile. These are websites that are respond to the screen size and adopt a different layout when viewed through a mobile screen. [jQuery Mobile](https://jquerymobile.com) was a step in the direction which provided an HTML5 based UI system which enabled access through smartphones and tablets. But these were just websites or webapps that adjusted the layout for mobile screens. 

JavaScript for native app development for mobile became a thing with [PhoneGap](http://phonegap.com). PhoneGap was an app development framework that used native web technologies like HTML, CSS and JavaScript to create native iOS and Android applications. PhoneGap was maintained by Adobe ho later decided to donate the source to Apache and that became [Cordova](https://cordova.apache.org/). Both are basically the same maintained by different companies.

From then on, there have been different frameworks like [Ionic](http://ionicframework.com) and [React Native](https://facebook.github.io/react-native) that even more simplified the process of building and shipping apps. Biggest advantage of such JavaScript powered frameworks were that the same codebase could be used for developing for iOS and Android. They have opened up the app development ecosystem to the traditional web developers.

## Desktop space

Apart from web and mobile, JavaScript has also made it's presence felt in the desktop space as well. [Node Webkit](http://nwjs.io) enable creating desktop applications using JavaScript. Recently [Github](http://github.com) launched a text editor called [Atom](http://atom.io) which was powered using web technologies. They have released their platform called [Electron](http://electron.atom.io) which helps to create cross platform web applications using frontend web technologies.

## Good times!

So in short, JavaScript is now capable of powering a wide range of devices and platforms. Great to see that a language that was once considered to be evil, made a strong comeback and now, developers can't do without JavaScript!