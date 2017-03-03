---
layout: post
title:  "My blogging workflow"
excerpt: "Blogging on Jekyll using Visual Studio Code."
banner: http://res.cloudinary.com/neoelemento/image/upload/v1462390492/blog/Blogging_Workflow-min.jpg
author: "Vishnu"
date:   2016-04-25 00:13:00
categories: blogging jekyll
---
Starting in 2010, I have tried various blogging platforms. [Blogger](https://www.blogger.com/), WordPress (both [self hosted](https://wordpress.org/) and [.com](https://wordpress.com/) one), [Tumblr](https://www.tumblr.com/) have all at one time or the other, hosted my thoughts. Initially blogger felt really simple but as WordPress came in, it seemed to be more customisable. I ran a self hosted WordPress site for quite sometime, but felt that for my blog I do not need anything as complicated as WordPress, with a database and all that. Also, I ended up paying for domain and hosting as well since WordPress.com did not allow free custom domain mapping. I did not want to pay a big amount for hosting. Tumblr is good, it lets you customize the themes and custom domain mapping is free and simple. But I felt some restrictions there as well.

Though I love all of them and they have their own merits and demerits, I was on lookout for a better solution where I have more control. I didn't want to deal with database connections, wanted to be able to integrate any design and wanted a simple interface for writing articles. Few months back I stumbled upon Jekyll and as of today, I am sticking to it. This blog runs on Jekyll.

## Dr. Jekyll? . . . what?
**Jekyll is a static site generator with no database but just static files generated for your content**. This makes it an awesome tool for writing blog posts just focusing on the content and nothing else. **Jekyll supports [markdown format](https://daringfireball.net/projects/markdown/)** with Liquid syntax. Jekyll uses the Liquid templating language to process templates. More details on Liquid can be found [here](https://github.com/Shopify/liquid/wiki).

### So why Jekyll?
Jekyll is what I was looking for in a blog platform. Simple writing, no database and simple hosting. Github supports hosting for Jekyll sites and also has custom domain feature. This is one of the reasons I love it. The workflow is as simple as drafting an article and pushing it to a github repo. Since this is similar to writing code and pushing it, developers would love this way of publishing content. That being said, you don't have to be adeveloper to post using Jekyll, though some programming knowledge will get you the most out it.

<div class="info-box hide-on-small-only">
<p><strong>Note: </strong>I am a linux user and this post will help you setup Jekyll on linux and OSX. If you are a windows user, please follow <a href="http://jekyll-windows.juthilo.com/" target="_blank">this wonderful guide</a>, it'll help.</p>
</div>

To install Jekyll, you need to have Ruby installed in your system. There is a detailed installation instruction on the [Jekyll website docs](https://jekyllrb.com/docs/home/), but a quick start instruction would be as follows:

{% highlight bash %}
# Installing Jekyll and creating a new site
~ $ gem install jekyll
~ $ jekyll new myBlog
~ $ cd myBlog
~/myblog $ jekyll serve
# => Now browse to http://localhost:4000
{% endhighlight %}

### How I use Jekyll
Initially when I started with Jekyll, I used a plain template that comes with base installation. But there are really good documentation for templating and integrating your own design in Jekyll. So I decided to create a simple little theme for my blog. Once it was done, integrating with Jekyll was simple insertion of Liquid tags.

The folder structure of a Jekyll installation has the following folder structure:

{% highlight text %}

├── _drafts
|   ├── my-favourite-car.md
|   └── i-love-technology.md
├── _includes
|   ├── footer.html
|   └── header.html
├── _layouts
|   ├── default.html
|   └── post.html
├── _posts
|   ├── 2016-10-25-my-blogging-workflow.md
|   └── 2016-04-23-be-in-charge.md
├── _site
├── css
|   └── main.scss
├── .gitignore
├── _config.yml
└── index.html

{% endhighlight %}

Each of the above folders and files have the following functions:

- **_drafts**: This is the folder where all of your draft posts go. All in progress posts and the ones that aren't ready to go live stay in this folder. When you boot up the Jekyll server in the local machine, adding a `--drafts` flag like `jekyll serve --drafts` will render the draft posts as well. This helps in previewing the post before publishing. The format of draft files is without a date for example `title.md`.

- **_includes**: This folder contains the templates for files which will be included in the layout for a consistent view across pages. Common files include `header.html` and `footer.html`. The liquid tag `{{ "{%" }} include file.ext %}` can be used to include the partial in `_includes/file.ext`. 

- **_layouts**: Layouts folder houses all the layout files. The `default.html` layout file contains the base style which can be extended to a `posts.html` or `pages.html` file. These are the templates that wrap posts. Layouts are chosen on a post-by-post basisThe liquid tag `{{ "{%" }} content %}` is used to inject content into the web page. 

- **_posts**: This is where all your posts reside in markdown or textile format. Each post file has a specific naming convention. It is date + the title of the post with words separated by hyphen (-). For example this post is called `2016-10-25-my-blogging-workflow.md`. You get the idea.

- **_site**: When a Jekyll site is built, it creates a static site within the sites folder. This folder is usually added to `.gitignore` file to avoid checking in.

- **index.html**: This is the main template file for your blog. When you visit the home page, this is the page that you see. Normally this will be like a list of all posts and extends one of the layout files within the layouts folder.

Jekyll also supports permalinks and SEO friendly URL. The base configuration of a Jekyll site is in a _config.yml file. This is where you specify the basic configuration of your blog. Here is a sample:

{% highlight yaml %}
# Site settings
title: neo-elemento
owner: Vishnu Padmanabhan
email: mymail@mydomain.com
description: > # this means to ignore newlines until "baseurl:"
  This is where you type in your site's description.
  Can be multiline as well.
baseurl: "/blog" # the subpath of your site, e.g. /blog/ # this will be '/' if blog is in the root
url: "http://neoelemento.com" # the base hostname & protocol for your site
twitter_username: your_username
github_username:  your_username

# Build settings
markdown: kramdown
permalink: /:year/:month/:day/:title/
paginate: 7
{% endhighlight %}

Each of the post will have something called **Front Matter**. Any file that contains a YAML front matter block will be processed by Jekyll as a special file. The front matter must be the first thing in the file and must take the form of valid YAML set between triple-dashed lines. Here is a basic example from my blog:

{% highlight text %}
---
layout: post
title:  "My blogging workflow"
excerpt: "My blogging workflow on Jekyll using VSCode"
author: "Vishnu"
categories: blogging, jekyll
---
{% endhighlight %}

Between these triple-dashed lines, you can set predefined variables or even create custom ones of your own. These variables will then be available to you to access using Liquid tags both further down in the file and also in any layouts or includes that the page or post in question relies on.


## Visual Studio Code
[Visual Studio Code](https://code.visualstudio.com/) is a cross platform, open source source code editor developed by Microsoft. It includes support for debugging, embedded Git control, syntax highlighting, intelligent code completion, snippets, and code refactoring. It is also customizable, so users can change the editor's theme, keyboard shortcuts, and preferences. I am big editor juggler. I am never satisfied with one editor and keep trying different ones. If at all there is an editor that supports linux, I would've tried it. Since many years I am a Sublime Text user. I like minimal and fast editors. I don't use IDEs for coding, I just use editors with plugins.

So when Microsoft came out with VSCode, I was a bit surprised to see that it was supported in Linux. VSCode is built using Github's [Electron Framework](http://neoelemento.com/blog/2015/10/25/desktop-apps-with-electron-1/). Downloaded and tried and I loved the user interface. It provides syntax highlighting and intellisense support for many languages. But what makes it good for blogging is it's markdown support.

### Markdown editing
I have been hearing about markdown, but never paid much attention to it as I was comfortable with the WYSIWYG editors that came with WordPress and other blogging platforms. Sublime has been my code editor since 2012. I love it,nothing more or less to be said. Sublime provides syntax highlighting and other plugins for markdown editing as well, but VSCode natively supports the markdown preview.

Here is how this post looks in VSCode:

<a data-flickr-embed="true"  href="https://www.flickr.com/photos/neoelemento/26648766135/in/dateposted/" title="VSCode Markdown"><img src="https://farm2.staticflickr.com/1619/26648766135_fd3b6996e8_b.jpg" width="100%" alt="VSCode Markdown"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>

### Git integration
This is one of my most favourite feature. Being a Linux user since past few years, I am a fan of command line. So my git workflow involves using git on the terminal. I've had no problems with it. But yeah when you are writing and pushing edits on a regular basis, you might not want to switch between terminal and your editor. 

VSCode makes it real simple by integrating git within itself. Committing and pushing is piece of cake. This seamlessly integrates with the writing workflow. Write, save, commit, push - done! This might seem like a big deal if you aren't used to this workflow. That being said, you can host a Jekyll site outside of Github. That's your choice but Jekyll is ready for that as well. I highly recommend using Jekyll as you will not be disappointed.

If you need to know more about the design integration, reach out to me at my Twitter handle mentioned below the post and I shall be happy to let you know.