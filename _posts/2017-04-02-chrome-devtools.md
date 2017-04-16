---
layout: post
title:  "Chrome DevTools Tips"
excerpt: "Chrome DevTools is awesome. How well do you know it?"
banner: http://res.cloudinary.com/vishnupadmanabhan/image/upload/v1490846558/chrome.png
author: "Vishnu"
date:   2017-04-02 00:01:00
categories: Chrome
comments: true
---
Chrome is the default browser I use. This is mainly because of DevTools. I love to use it during any development that I do. DevTools makes life incredibly easy and productive. Let's take a look at a few things we can do with DevTools that are really cool.

**Scroll to view**: This is a very useful feature if you spend a lot of time fiddling with UI elements in the dev tools. Usually, when you do _inspect element_ on an UI element, it opens up the dev tools with that item selected. But if in some cases if the element scrolls out of the window, there will be an indication with a small arrow on the page displayed which tells you if the element is scrolled above or below the visible window. Instead of manually having to scroll up or down, just right-click the element in the source and select _scroll to view_ and the element scroll back to the visible window.

<figure>
  <img src="http://res.cloudinary.com/vishnupadmanabhan/image/upload/v1491025343/Chrome/scroll-into-view-min.gif" alt="Scroll Into View">
  <figcaption>Scroll into view in action</figcaption>
</figure>

---

**Sources**: Sometimes, you would want to fiddle around with some style or UI changes. Traditionally you would shuttle between your code editor and your browser to make the changes and see them and save them. But sources tab allows you to edit your source files from within Chrome DevTools and save them if you need to. This is pretty handy and allows you to make the changes on the fly. For this, you have to right click on the sources panel and add your local folder to the workspace. Once done, open and edit the file and Chrome will ask you to map the file. Select the file mapping and go on editing.

<figure>
  <img src="http://res.cloudinary.com/vishnupadmanabhan/image/upload/v1491113082/Chrome/sources.gif" alt="View Sources">
  <figcaption>View Sources</figcaption>
</figure>

---

**Console Table**: Often we do a `console.log()` to display the data and inspect them. But if we have a collection of data, it might be a little cumbersome to explore them in the normal tree structure that `console.log()` outputs. Instead using `console.table()` displays the data in a nice table layout where it is easy to understand and read the data.

```javascript
let cars = [
    { name: 'Aston Martin', country: 'UK' },
    { name: 'Jaguar', country: 'UK' },
    { name: 'Porsche', country: 'Germany' },
    { name: 'Audi', country: 'Germany' },
    { name: 'BMW', country: 'Germany' },
    { name: 'Lamborghini', country: 'Italy' },  
    { name: 'Ferrari', country: 'Italy' },  
];

console.log(cars);
console.table(cars);
```

<figure>
  <img src="http://res.cloudinary.com/vishnupadmanabhan/image/upload/v1491115127/Chrome/consolelog.jpg" alt="Console Log">
  <figcaption>Console Log</figcaption>
</figure>

<figure>
  <img src="http://res.cloudinary.com/vishnupadmanabhan/image/upload/v1491115127/Chrome/consoletable.jpg" alt="Console Table">
  <figcaption>Console Table</figcaption>
</figure>

---

**Warning, Error, Info**: Sometimes when you write a JavaScript app, you want certain errors and warnings to be displayed. If you just use `console.log()` it won't be highlighted specifically as an error and the user might fail to notice. Instead, you can use the following to display your message as a warning, info or error.

```javascript
console.warn('This is a warning!');
console.info('This is an info.');
console.error('This is a error!');
```

<figure>
  <img src="http://res.cloudinary.com/vishnupadmanabhan/image/upload/v1491116332/Chrome/consolewie.jpg" alt="Console Warning, Info and Error">
  <figcaption>Console Warning, Info and Error</figcaption>
</figure>

---

**Grouping**: When you have to console related information about different items, there is a good chance that it gets confusing and difficult to read and understand the relationship. With `console.group()`, you'll be able to group together related information and make it easier to read.

```javascript
let cars = [
    { name: 'Aston Martin', country: 'UK' },
    { name: 'Jaguar', country: 'UK' },
    { name: 'Porsche', country: 'Germany' },
    { name: 'Audi', country: 'Germany' },
    { name: 'BMW', country: 'Germany' },
    { name: 'Lamborghini', country: 'Italy' },  
    { name: 'Ferrari', country: 'Italy' },  
];

// Without grouping
cars.forEach(car => {
    console.log(`This is ${car.name}`);
    console.log(`${car.name } is from ${car.country}`);
    console.log(`${car.country} is in Europe`);
});

// With grouping
cars.forEach(car => {
    console.group(`${car.name}`);
    console.log(`This is ${car.name}`);
    console.log(`${car.name } is from ${car.country}`);
    console.log(`${car.country} is in Europe`);
    console.groupEnd(`${car.name}`);
});

// With grouping collapsed
cars.forEach(car => {
    console.groupCollapsed(`${car.name}`);
    console.log(`This is ${car.name}`);
    console.log(`${car.name } is from ${car.country}`);
    console.log(`${car.country} is in Europe`);
    console.groupEnd(`${car.name}`);
});
```
Without any grouping, the content is not easy to read and understand:
<figure>
  <img src="http://res.cloudinary.com/vishnupadmanabhan/image/upload/v1491117827/Chrome/consolenogroup.jpg" alt="Console No Group">
  <figcaption>Console No Group</figcaption>
</figure>

Much more clearer using `console.group()`:
<figure>
  <img src="http://res.cloudinary.com/vishnupadmanabhan/image/upload/v1491117828/Chrome/consolegroup.jpg" alt="Console Group">
  <figcaption>Console Group</figcaption>
</figure>

More clearer when used with `console.groupCollapsed`:
<figure>
  <img src="http://res.cloudinary.com/vishnupadmanabhan/image/upload/v1491117827/Chrome/consolegroupcoll.jpg" alt="Console Group Collapsed">
  <figcaption>Console Group Collapsed</figcaption>
</figure>

---

So there you have it, few (if not many) Chrome DevTools tricks. Try them out during your new project and see which of them are useful.

<div class="embed-responsive embed-responsive-16by9">
    <iframe src="https://www.youtube.com/embed/xfay8iwdxMs?rel=0&amp;showinfo=0" frameborder="0"></iframe>
</div>