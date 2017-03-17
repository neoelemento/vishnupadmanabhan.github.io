---
layout: post
title:  "Desktop apps with Electron - 1"
excerpt: "Let us see how we can create a desktop app using JavaScript, HTML and CSS using Electron framework."
banner: http://res.cloudinary.com/vishnupadmanabhan/image/upload/v1488592226/electron.jpg
author: "Vishnu"
date:   2015-10-25 02:48:00
categories: javascript
comments: true
---
## What is the fuss all about?

In my [last post](http://vishnupadmanabhan.com/javascript-everywhere/), I wrote about how JavaScript has taken over the programming world and now extends beyond the boundaries of a web browser. It exisits on the server side and on various desktop apps as well. So we'll see how to create a simple desktop app using [Electron](http://electron.atom.io).

[Electron](http://electron.atom.io) is an open source framework maintained by [Github](http://github.com) to enable building cross platform desktop apps using web technologies like HTML, CSS and JavaScript. Electron was initially built to power Github's [Atom](http://atom.io) editor. Electron has been gaining popularity as is it easier for developers familiar with web technologies to bring their expertise to the desktop world. Maintaining the project is also easy as it is basically the same codebase for OSX, Windows or Linux platform. Few companies who are already using Electron to power their apps are:

- [Slack](https://slack.com/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Nuclide](http://nuclide.io/)

These are all products created by big companies like **Microsoft** and **Facebook** and are used by freelancers and corporates day in and day out. Electron is really easy to install and get started and can be installed using a prebuilt binary or an npm package. I use Linux as my primary operating system, so I shall follow the conventions for Linux which should be almost the same for OSX as both are Unix based systems. For Windows, the procedure might be a bit different. 

## Setting up Electron

Firstly we need Node.js in our system. Head to [Node.js](http://nodejs.org) website and you can find the installation steps listed for all supported platforms. Once Node is installed, we'll use the node package manager or npm as it is called to install Electron. There are two ways of installing Electron, globally and as a development dependency. Installing Electron gloabally will give you global access to Electron run time and if you do not want a global installation instead you want Electron to be accessible only within the project scope then you can install it as a dependency within the project. for this, navigate to the folder where you store your code files and run the following command in the terminal:

{% highlight bash %}

$ npm install electron-prebuilt -g

{% endhighlight %}

This will install Electron globally. If you see any errors related to permission, run the same command in *sudo* mode as follows:

{% highlight bash %}

$ sudo npm install electron-prebuilt -g

{% endhighlight %}

If you rather prefer installing Electron just within the scope of your project, create a directory for your project and then initialize npm.

{% highlight bash %}

$ mkdir electronapp
$ cd electronapp
$ npm init

{% endhighlight %}

When you run this command, you'll be prompted to enter few details which you can probably leave defaults except the entry point which you can change to app.js. Even if you feel a need to change any of these, you can do so later in the `package.json` file. Once you are done with the above steps, run the following command:

{% highlight bash %}

$ npm install electron-prebuilt --save-dev

{% endhighlight %}

Now you have an Electron app installed and let's dive into it.

If you navigate to the folder where you installed your app and open it with your favourite text editor or IDE, you'll find the following structure:

{% highlight bash %}

electronapp
	+ node_modules
	-  package.json	

{% endhighlight %}

## Little bit of configuration

We do not have much to do with node_modules, but we might have something to do at times with package.json like adding a new plugin or module, but before we start, we make a modification to the package.json and add a scripts section and assign the start script as our app.js file:

{% highlight javascript %}
// package.json
{
  "name": "electronapp",
  "version": "1.0.0",
  "descrition": "Your description",
  "main": "app.js",
  "scripts": {
    "start": "electron ."
  },
  "Author": "Vishnu",
  "license": "MIT",
  "devDependencies": {
    "electron-prebuilt": "~0.34.0"
  }
}	

{% endhighlight %}

Once this is done, go ahead and create your *app.js* file.

{% highlight javascript %}
// app.js
var app = require('app');
var BrowserWindow = required('browser-window');
app.on('ready', function() {
  var mainWindow = new BrowserWindow({
    width: 800, // specifying the height
    height: 600 // and width of the app window
  });
  mainWindow.loadUrl('file://' + __dirname + '/modules/main/main.html');
  mainWindow.openDevTools(); // Optional. Used for debugging purposes.
});

{% endhighlight %}

To explain what you see above, firstly we require the *app* module which forms the basis of the application. Electron runs an instance of Chromium to render the app window, so we include an instance of the browser-window. Once the application is loaded and ready, we create a window that is 800 pixels wide and 600 pixels hight. Once this is done, we load the HTML template. I have saved all the templates under a *modules* folder and by giving each different module it's own folder. In this way code can be more organised.

The *__dirname* keyword returns the root of the application. Each window is rendered from the HTML template. The *mainWindow.openDevTools();* is optional. This opens a dev tools window which is useful if you want to debug the application looking into the DOM since basically each window is just an HTML page. 

## Creating a window

Every screen in an Electron app is an HTML page. By default we display the **main.html** file. You can choose the name, need not be *main* always. Here is the *main.html* template

{% highlight html %}
<!-- main.html -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
</head>
<body class="">

  <h1> This is an electron app </h1>  
  
</body>
</html>

{% endhighlight %}

As you can see, this is just a simple HTML page that acts as a template for the app. When we finally run the electron app, this page will be rendered on the screen. Next, we would love to have menus integrated with our app so that user can access different sections of our app. For this, create a *main.js* file within the main module folder and update the content as follows:

{% highlight javascript %}
// main.js
var remote = require('remote');
var Menu = remote.require('menu');
var menu = Menu.buildFromTemplate([
  {
    label: 'Electron',
    submenu [
      {
        label: 'Options',
        click: function() {
          // stuff you want it to do on click
          // like open another window
        }
      }
    ]
  }
]);

{% endhighlight %}

Here we are requiring the *remote* module to since we are importing *remote* from the renderer process and not from the *main* process. Then we build a menu based on the template. Label gives a main label to the window named *Electron* and a sub menu *Options* which also includes a callback function which defined what happens when a user clicks on the menu item. So the final product looks something like this:

![Electron](https://farm1.staticflickr.com/626/21877277554_86eb77b328_b.jpg)

Voila!

## Why does this matter?

Programming started for desktop and then evolved when web came into existance. Ever since, there has been a clear division between developers - desktop, web and mobile developers. But bringing web technologies to desktop gives web developers an opportunity to explore the desktop space as well.

So, that is how simple it is to create a simple desktop app using Electron. Though our app does not do anything complex right now, it is a good start where we learn how to create a simple window which works across various platforms. In the next post in the series, we'll see how to create multiple windows in an Electron app.

[Part 2 of creating desktop apps with Electron](http://vishnupadmanabhan.com/desktop-apps-with-electron-2/)