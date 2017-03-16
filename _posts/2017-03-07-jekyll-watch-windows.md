---
layout: post
title:  "Jekyll on Windows"
excerpt: "Installing Jekyll on Windows and associated issues"
banner: http://res.cloudinary.com/vishnupadmanabhan/image/upload/v1488591100/jekyll.jpg
author: "Vishnu"
date:   2017-03-07 00:01:00
categories: jekyll
---
I recently changed to Windows 10 as my primary operating system. I have been using Jekyll as my blogging platform since a long time now. Hosted on Github Pages, integrates nicely with VSCode as editor. VSCode supports markdown and has git integration too.

I have [written](http://vishnupadmanabhan.com/my-blogging-workflow/) previously about getting up and running with Jekyll. But when I tried the same with Windows, I ran into problems. For starters, getting Ruby and Jekyll installed. I used something called **Chocolatey**, which is a package manager for Windows similar to **Homebrew** for Mac and **apt-get** for Ubuntu.

After I got everything installed and up and running, I ran into problems. Every time I ran Jekyll serve, I saw this:

```bash
D:\code\blog>jekyll serve --drafts
----------
Incremental build: disabled. Enable with --incremental
      Generating...
                    done in 0.575 seconds.
                    --watch arg is unsupported on Windows.
```

This part of the console output was troubling: 

`--watch arg is unsupported on Windows.`

This meant that I cannot live preview the changes that I make. This was a big deal because I like previewing the changes I make and the blog posts I write on the browser. The serve command watched the files for any changes and you can see the changes if you refresh the page. Not being able to do on Windows was a dealbreaker for me.

I wasn't gonna give up, so I found out that making a change to one of the files within Jekyll would help in getting "watch" work on internet.

Update this line in build.rb `(C:\jekyll\lib\jekyll\commands\build.rb)` to say `unless` instead of `if`:

```ruby
# change this
if Utils::Platforms.windows?
# to this
unless Utils::Platforms.windows?
```

Once I made this change, all my previous linux commands started working like a charm. So there you go. If you have build issues on Windows, this solution got you covered.