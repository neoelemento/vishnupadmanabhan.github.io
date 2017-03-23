---
layout: post
title:  ".NET Core - MVC"
excerpt: "Intro to .NET Core MVC app using cli"
banner: http://res.cloudinary.com/vishnupadmanabhan/image/upload/v1489831960/NET.jpg
author: "Vishnu"
date:   2017-03-23 00:01:00
categories: ASP.NET
comments: true
---
In the [previous post](http://vishnupadmanabhan.com/dotnet-core-intro/), we learnt how to create a basic .NET Core console app. But I think that isn't what you are looking for. You are looking for something that is, even more, fun than a basic console app. You want something that works on the internet! That's right, you want a web app.

In this post, we will see what happens when we choose `mvc` instead of `console` while we used the `dotnet new` command which we used earlier. But before we jump into creating an MVC app, let's try to take our console app and make it a web app. In order to make it a web app we need to add a web server into it.

### What is MVC pattern?
The Model-View-Controller is a software architectural pattern that divides an application into three interconnected components namely - Model, View and Controller. MVC patter helps in decoupling of these components in order to have a cleaner code base, reusable components and reduced development time. The MVC pattern is widely used in program development with programming languages such as Java, Smalltalk, C++, Ruby and PHP.

- **Model**: Model represents the logical structure of data and class associated with it. This object model does not contain any information about the user interface. It manages the data, logic and rules of the application. Model implements the logic for the application's data domain. Often, model objects retrieve and store model state in a database.
- **View**: Views are the components that display the application's user interface. It is a collection of classes representing the elements in the user interface. View can also update the output to the user based on the change in Model. Typically, this UI is created from the data within the model.
- **Controller**: Controllers are the components that handle user interaction, carry out operations on the model and ultimately select a view to render. Controller connects the model and the view and communicates between the classes in model and view. Controller handles the responses to a user interaction in an application.

## Web Server - Kestral
Traditionally ASP.NET apps used the IIS web server to run. IIS Express was a lightweight version of IIS which Visual Studio uses to run and preview apps during development. ASP.NET uses a web server called **Kestrel**. Kestrel is a cross-platform HTTP server based on [libuv](http://libuv.org/){:target="_blank"}, a cross-platform asynchronous I/O library.

Kestrel is a web server that can be used in ASP.NET Core applications during development and also if the app is being used within an internal network. But for production, servers like IIS, Apache or Nginx are preferred to be used. This is mostly because these robust servers have better security than the relatively new Kestrel.

That being said, ASP.NET Core is designed to work with Kestral so as to provide consistency across all the platforms. So, these other servers need proxy the requests back to Kestrel. This enables control over the startup process. We'll look more into setting up the servers with Kestral in a later post.

## Console to the web
In order to make the console app work as a web app, we need to make some modifications to our code which includes adding Kestral web server. Firstly, let's go ahead and create a `Startup.cs` file and write the following code into it.

```csharp
using System;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;

namespace ConCore
{
    public class Startup
    {
        public void Configure(IApplicationBuilder app)
        {
            app.Run(context => {
                return context.Response.WriteAsync("Hello cool!");
            });
        }
    }
}
```

Once we have created the `Startup.cs`, we need to tell `Program.cs` file to use our new file and server the page using the Kestrel web server.

```csharp
using System;
using Microsoft.AspNetCore.Hosting;
using movingtotheweb;

namespace ConCore
{
    class Program
    {
        static void Main(string[] args)
        {
            var host = new WebHostBuilder()
                        .UseKestrel()
                        .UseStartup<Startup>()
                        .Build();

            host.Run();
        }
    }
}
```

Once we run our project now, we see `Hello cool!` displayed in our browser.

### Dive into Core MVC
Now that we have seen how to create a basic web app from a console app, lets go ahead and dive into MVC. Back to our terminal, lets type:

```powershell
PS D:\Code> mkdir CoreMVC
PS D:\Code> cd CoreMVC
PS D:\Code\CoreMVC> dotnet new mvc
```

Tada! There you have your MVC app created. Here is the folder structure you see within your MVC folder:

![MVC Struct](http://res.cloudinary.com/vishnupadmanabhan/image/upload/v1489776722/NetCore/mvcstruct.jpg)

You can see that there are various folders created that include a `controllers` folder and a `views` folder. By default there is no `models` folder, but we will be creating one as we move along. We can also see our familiar `CoreMVC.csproj`, `Program.cs` and `Startup.cs` files too. In addition to these, there are various `.json` files like `appsettings.json`, `bundleconfig.json` and `bower,json`. We'll see what each of these do as we move on.

Let's run our app and see what happens:

```powershell
PS D:\Code\CoreMVC> dotnet run
Hosting environment: Production
Content root path: D:\Code\CoreMVC
Now listening on: http://localhost:5000
Application started. Press Ctrl+C to shut down.
```

Our app is now running on localhost port 5000. Let's open that URL in our browser.

![MVC Struct](http://res.cloudinary.com/vishnupadmanabhan/image/upload/v1489777022/NetCore/mvcapp.jpg)

When we open the URL at which our project is served we see a lovely *bootstrapped* website. This is a basic template that MVC creates using the bootstrap front-end framework. Instead of just using a basic web page, this enables you to edit and extend the application quickly as bootstrap takes care of UI structuring and basic styling.

We can see three links on to namely *Home*, *About* and *Contact*. These are routes that MVC creates for displaying various sections in our app.

If we look at the `Program.cs` file within our MVC app, we can see that it is almost similar to the our modified `Program.cs` from our console app that we converted to a web app earlier.

```csharp
namespace CoreMVC
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var host = new WebHostBuilder()
                .UseKestrel()
                .UseContentRoot(Directory.GetCurrentDirectory())
                .UseIISIntegration()
                .UseStartup<Startup>()
                .Build();

            host.Run();
        }
    }
}
```

But if you take a look at the `Startup.cs` file, it is much different from what we had in our console app. We will look deeper into the contents of `Startup.cs` in the next post in the series.

### Routing
Within our `Startup.cs` file, we have a section for routing:

```csharp
...
...

app.UseMvc(routes =>
            {
                routes.MapRoute(
                    name: "default",
                    template: "{controller=Home}/{action=Index}/{id?}");
            });
```

The above code snippet registers a default route format and also a default route for our app. The name is `default` and template defines the URL structure for our app. If we call the `about` method within our `HomeController`, the URL structure will be `http://localhost:5000/Home/About`.

We have more items withing `Startup.cs` into which we will take a look in upcoming posts.

## Watching for changes
So far, after every change, we had to rerun `dotnet run` to see the changes on the browser. If you have worked with other platforms you would've seen the changes instantly reflecting on the browser upon refreshing the page.

To enable this feature in Core, we need to add a tool called `dotnet watch` to our project. Open the `CoreMVC.csproj` file and add this line before the closing `</Project>` tag.

```xml
<ItemGroup>
    <DotNetCliToolReference Include="Microsoft.DotNet.Watcher.Tools" Version="1.0.0" />
</ItemGroup>
```

Once the above line is added, run `dotnet restore` to pull in the tool into our project. Once this is done, run `dotnet watch run` which will run your prject and keep a watch for any file changes and rebuild the solution so that the changes reflect upon browser refresh. Any command in Core can be run with `watch` like `dotnet watch test` to run your tests while watching for file changes. As you can see, this is an extremely useful utility.

So there you have it, a full fledged MVC web application up and running withing a few minutes. In the upcoming posts,we will dive deeper into each of the components of the Core MVC app and build a real world app out of it.