---
layout: post
title:  "Prevent mass assignment in .NET Core"
excerpt: "Prevent the manipulation of posted data in Asp.Net Core using data attributes"
banner: http://res.cloudinary.com/vishnupadmanabhan/image/upload/v1489831960/NET.jpg
author: "Vishnu"
date:   2017-03-29 00:01:00
categories: ASP.NET
comments: true
---
A mass-assignment vulnerability occurs when a user passes an HTTP parameter through a request, and that parameter changes a value in your database that isn't expected to be changed. For example, suppose you have a user authentication system where there are normal users and admin users. Admins have access to protected system settings and have rights to modify them. 

By default, every user that signs up will be a normal user. Suppose you have a flag within your database called `is_admin` that determines whether a user is an admin or not. A hacker user might send an `is_admin` parameter through an HTTP request, by [modifying the form](http://homakov.blogspot.in/2012/03/how-to.html){:target="\_blank"} through the dev tools or by using tools like [Postman](https://getpostman.com){:target="\_blank"}, which is then passed into your model's create method, allowing the user to assign themselves as an administrator.

This can be prevented by specifying the model attributes that you want to be mass assigned.

Consider we have a user model as follows:

```csharp
public class User  
{
    public string Name { get; set; }
    public string Email { get; set; }
    public bool IsAdmin { get; set; }
}
```

An associated for accepting user input as follows:

```html
@model User

<form asp-action="AddUser" asp-Controller="User">  
    <div class="form-group">
        <input type="textBox" asp-for="Name" placeholder="Name"/>
    </div>
    <div class="form-group">
        <input type="email" asp-for="Email" placeholder="Email"/>
    </div>
    
    <button type="submit">Submit</button>
</form>  
```

This posts to a method `AddUser()` within our `UserController`:

```csharp
[HttpPost]
public IActionResult AddUser(UserModel model)  
{
    return View("Index", model);
}
```
This seems all good until someone adds another field from within the developer tools like so before submitting the form:

```html
<form asp-action="AddUser" asp-Controller="User">  
    <div class="form-group">
        <input type="textBox" asp-for="Name" placeholder="Name"/>
    </div>
    <div class="form-group">
        <input type="email" asp-for="Email" placeholder="Email"/>
    </div>
    <!-- adding the below to the submit html to mass assign the 'is_admin' field-->
    <input value="true" name="is_admin" />
    <button type="submit">Submit</button>
</form>

```

The model binder will bind the value, and the value will be updated to `is_admin` within the database. Let us see how we can fix this using the _Data Attributes_. 

```csharp
public class User  
{
    [MaxLength(150)]
    [Display(Name = "Name")]
    [Required]
    public string Name { get; set; }

    [MaxLength(150)]
    [Display(Name = "Email")]
    [Required]
    public string Email { get; set; }

    [BindNever]
    public bool IsAdmin { get; set; }
}
```

Here the `BindNever` attribute prevents any modification to be made to the field once a post is made. This is just one of the ways you can prevent mass assignment within a .NET Core application. An alternative way to do this is by using `ModelMetaData` attribute.

```csharp
[ModelMetadataType(typeof(UserModel))]
public class BindingUser  
{
    public string Name { get; set; }
}

public class User  
{
    [MaxLength(200)]
    [Display(Name = "Full name")]
    [Required]
    public string Name { get; set; }

    public bool IsAdmin { get; set; }
}
```

By using `ModelMetaData` attribute, you are allowing to separate all the annotations and metadata to a different class while keeping the `BindingUser` and `User` distinct. The thing to note here is that there is an implicit contract between the models now. Renaming `Name` to `FullName` on your `User` model will remove all the validation attributes as there will be no more matching contract.

There are few other ways of preventing mass assignment as well. But these are the ones I personally feel are the simpler ones. Use them as you feel fit.