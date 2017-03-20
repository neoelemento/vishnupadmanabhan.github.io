---
layout: post
title:  "Adding Gravatar Image to Jekyll"
excerpt: "How to use Gravatar image withing Jekyll website"
banner: http://res.cloudinary.com/vishnupadmanabhan/image/upload/v1488591100/jekyll.jpg
author: "Vishnu"
date:   2017-03-20 00:01:00
categories: Jekyll
comments: true
---
Gravatar is a service that provides a global avatar (profile image) for your online presence. Instead of having to upload a profile image, many apps make use of this service to display profile images.  Let us see how this can be implemented for a Jekyll website.

If your website is not hosted on Github pages then you can use the following method to pull gravatar into your site.
To pull in your gravatar image, head to [Gravatar](https://gravatar.com) website and sign up for an account. Once you have done that, head back to your Jekyll site and create a `_plugins` folder if you haven't created one already. This is where you save all your plugins. Create a `Gravatar.rb` file. Plugins are Ruby files. Once created, copy the following snippet into the file:

```ruby
require 'digest/md5'

module Jekyll
  module GravatarTag

    def pull_gravatar(mail)
      "//www.gravatar.com/avatar/#{hash(mail)}"
    end

    private :hash

    def hash(email)
      email_address = email ? email.downcase.strip : ''
      Digest::MD5.hexdigest(email_address)
    end
  end
end

Liquid::Template.register_filter(Jekyll::GravatarTag)
```

Once done, rebuild your Jekyll website. Once the build is complete, you can pull in your gravatar image as follows:

```html
<img src="{{ 'your@email.com' | pull_gravatar }}?s=150" />
```

Here `your@email.com` is the email that you've used to create Gravatar profile and `s=150` scales the gravatar image down to `150px`. If you do not provide a value for `s`, then the default gravatar size will be pulled. So, in two minuted, you have Gravatar within your Jekyll website.

The above method won't wotk with Github hosted Jekyll website. To pull gravatar within Github hosted site, add `jekyll-gravatar` to your `_config.yml` file:

```yaml
gems:
  - jekyll-paginate
  - jekyll-gravatar
```

Once this is done, run `gem install jekyll-gravatar` from the terminal. Once the installation is comeplete, you can use the following tag to pull in your Gravatar image:

```html
<img src="{{ 'your@email.com' | to_gravatar }}?s=150" />
```

These are the two ways you can install Gravatar support for your Jekyll website whether it is hosted on Github or independently hosted.