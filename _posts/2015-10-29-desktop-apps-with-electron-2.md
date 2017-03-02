---
layout: post
title:  "Desktop apps with Electron - 2"
excerpt: "In this post we see how to add multiple window options to the app that we made in previous post."
author: "Vishnu"
date:   2015-10-29 08:00:00
categories: javascript
---
## Creating multiple windows in your electron app
In my [last post](http://neoelemento.com/blog/2015/10/25/desktop-apps-with-electron-1/), I wrote about how to get a basic [Electron](http://electron.atom.io/) app up and running. But what do you do if you want a multi-window app? For example, if you want to display various user specific options once you select from the app menu. Let’s see how to get this done.

In our *main.js* file, we add a couple of lines of code to trigger the options window when a user clicks on the *options* menu. For this we include a module called **ipc** which enables us to send commands across when an event occurs. So we include the module and add a callback for the *options* menu. `ipc.send('display-options')` sends a command `display-options` (this can be named anything) to the main process when a user clicks on *options* menu. After this we will modify the app.js file to capture this event.

```javascript
// main.js
var remote  = require('remote');
var Menu    = remote.require('menu');
var ipc     = require('ipc');

var menu = Menu.buildFromTemplate([
  {
    label: 'Electron',
    submenu: [
      {
        label: 'Options',
        click: function() {
          ipc.send('display-options');
        }
      }
    ]
  }
]);

Menu.setApplicationMenu(menu);
```

You'll see that in our exisiting *app.js* file we have added another browser window instance called `optionsWindow` and assign it a width and height. We also assign a property `show: false` to ensure that this window is not diplayed when our main app is loaded. We want the options window to be displayed only when the user clicks on options from the menu dropdown. Here we also catch the command **display-options** using `ipc.on('display-options')` method. Within the callback we call the *show* method on optionsWindow as `optionsWindow.show();` to display the options window.

```javascript
// app.js
var app = require('app');
var BrowserWindow = require('browser-window');
var ipc = require('ipc');

app.on('ready', function(){
  var mainWindow = new BrowserWindow({
    width: 800,
    height: 600
  });
  mainWindow.loadUrl('file://' + __dirname + '/modules/main/main.html');
  mainWindow.openDevTools();

  var optionsWindow = new BrowserWindow({
    width: 300,
    height: 300,
    show: false
  });
  optionsWindow.loadUrl('file://' + __dirname + '/modules/options/options.html');
  ipc.on('display-options', function() {
    optionsWindow.show();
  });
});
```

Options window is just another html file.

```html
<!-- options.html -->
<h1>Edit your options here</h1>
```

So back in the command line when we run npm start the app window boots up and when we click on the options menu, we see this little window pop up.

![Electron Multiwindow](https://farm6.staticflickr.com/5757/22426371697_2cce97e2ee.jpg)

So there we have a multi window app built out of HTML and JavaScript. We haven’t even scratched the surface of what we can do with Electron. Feel free to explore more of this wonderful technology and share your experiences over at my twitter handle. I will be doing some experiments and someday some serious projects using electron!
