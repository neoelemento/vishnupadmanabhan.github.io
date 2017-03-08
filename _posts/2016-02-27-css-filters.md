---
layout: post
title:  "CSS Filters"
excerpt: "Let's take a look at various CSS filters"
banner: http://res.cloudinary.com/vishnupadmanabhan/image/upload/v1488591817/css.jpg
author: "Vishnu"
date:   2016-02-27 01:13:00
categories: css
---

Today we take a look at various CSS filters. There was a time when for any kind of web design, Photoshop or Fireworks were the tools. Things like gradients, shadows, filters etc were possible only through image editing tools like Photoshop. So if you are one of them, you know how difficult it was to get a gradient or a shadow by creating images and repeating them - horror! But now, CSS implements most of those effects through a property called *filter*. Let's see how.

Few of these filters might not be supported by older browsers, but you can always use [Can I use](http://caniuse.com/#search=css%20filter%20effects) to check if which browser offers support. So when you are using these filters, keep in mind your target audience and the browser they might be using. For our samples we'll use this wonderful image of a London Red Bus.

## Blur
Blur filter does what is says, it adds a blur effect. The intensity of blur is controlled by pixel value or inch value.

{% highlight css %}

img {
    filter: blur(5px);
    /* Second option: this also takes in inch value */
    filter: blur(.5in); 
}

{% endhighlight %}

<img src="https://farm8.staticflickr.com/7319/8747502274_d536934ba2_b.jpg" style="width: 40%; margin: auto; float:left">

<img src="https://farm8.staticflickr.com/7319/8747502274_d536934ba2_b.jpg" style="filter: blur(5px); width: 40%; margin: auto; float:right">
<div style="clear:both"></div>

## Brightness
Brightness filter adjusts the brightness of the image. Simple as that.

```css

img {
    filter: brightness(30%);
    /* Second option: also takes integer value factor */
    filter: brightness(5); 
}

```

<img src="https://farm8.staticflickr.com/7319/8747502274_d536934ba2_b.jpg" style="width: 40%; margin: auto; float:left">

<img src="https://farm8.staticflickr.com/7319/8747502274_d536934ba2_b.jpg" style="filter: brightness(30%); width: 40%; margin: auto; float:right">
<div style="clear:both"></div>

## Contrast
Contrast filter controls the contrast of the image. More the contrast, more difference between the lighter and darker areas of the image.

{% highlight css %}

img {
    filter: contrast(200%);
    /* Second option: also takes integer value factor */
    filter: contrast(5); 
}

{% endhighlight %}

<img src="https://farm8.staticflickr.com/7319/8747502274_d536934ba2_b.jpg" style="width: 40%; margin: auto; float:left">

<img src="https://farm8.staticflickr.com/7319/8747502274_d536934ba2_b.jpg" style="filter: contrast(200%); width: 40%; margin: auto; float:right">
<div style="clear:both"></div>

## Drop Shadow
Drop Shadow filter 

{% highlight css %}

img {
    filter: drop-shadow(10px 20px 20px black);
}
{% endhighlight %}

<img src="https://farm8.staticflickr.com/7319/8747502274_d536934ba2_b.jpg" style="width: 40%; margin: auto; float:left">

<img src="https://farm8.staticflickr.com/7319/8747502274_d536934ba2_b.jpg" style="filter: drop-shadow(10px 20px 20px black); width: 40%; margin: auto; float:right">
<div style="clear:both"></div>

### **Drop Shadow vs Box Shadow**
The difference between classic `box-shadow` property and `drop-shadow` filter is that `drop-shadow` conforms to the shape of the image rather (especially while using png images) than just giving a rectangular box as shown below. Also, filters enable graphic acceleration and make use of your CPU power rather than just relying on browser. We will apply both the effects on a png image of an apple and see the difference. The first apple has `filter: drop-shadow(10px 20px 20px black);` filter and the second on has `box-shadow: 10px 20px 20px black;` applied:

<img src="http://res.cloudinary.com/neoelemento/image/upload/v1465239649/blog/Goofy.png" style="filter: drop-shadow(10px 20px 20px black); width: 40%; margin: 20px auto; border: none;  width: 40%; float:left">

<img src="http://res.cloudinary.com/neoelemento/image/upload/v1465239649/blog/Goofy.png" style="box-shadow: 10px 20px 20px black; width: 40%; margin: 20px auto; border: none;  width: 40%; float:right">
<div style="clear:both"></div>


## Grayscale
Grayscale filter de-saturates the colour and adds a grayscale effect. More the percentage, more the grayscale effect. At 100%, the image becomes completely grayscale without any colour whatsoever.

{% highlight css %}

img {
    filter: grayscale(75%);
}

{% endhighlight %}

<img src="https://farm8.staticflickr.com/7319/8747502274_d536934ba2_b.jpg" style="width: 40%; margin: auto; float:left">

<img src="https://farm8.staticflickr.com/7319/8747502274_d536934ba2_b.jpg" style="filter: grayscale(75%); width: 40%; margin: auto; float:right">
<div style="clear:both"></div>

## Hue Rotate
Hue Rotate filter makes use of the **[Colour Circle](https://en.wikipedia.org/wiki/Color_wheel)**. It takes a degree value as argument and this degree value indicates the angle of rotation on the colour circle where your actual colour takes the top spot. More about colour circle can be seen [here](https://en.wikipedia.org/wiki/Color_wheel). 

In the following example, a 180 degree rotation in hue changes the reddish-yellow tint of the image to a bluish-green tint.

{% highlight css %}

img {
    filter: hue-rotate(180deg);
}

{% endhighlight %}

<img src="https://farm8.staticflickr.com/7319/8747502274_d536934ba2_b.jpg" style="width: 40%; margin: auto; float:left">

<img src="https://farm8.staticflickr.com/7319/8747502274_d536934ba2_b.jpg" style="filter: hue-rotate(180deg); width: 40%; margin: auto; float:right">
<div style="clear:both"></div>

## Invert
Invert filter inverts the colour spectrum of the image. In percentages, 0% means the original image colours are retained without any inversion and 100% inversion completely inverts the entire colour spectrum.

{% highlight css %}

img {
    filter: invert(90%);
}

{% endhighlight %}

<img src="https://farm8.staticflickr.com/7319/8747502274_d536934ba2_b.jpg" style="width: 40%; margin: auto; float:left">

<img src="https://farm8.staticflickr.com/7319/8747502274_d536934ba2_b.jpg" style="filter: invert(90%); width: 40%; margin: auto; float:right">
<div style="clear:both"></div>

## Opacity
Opacity filter controls the opacity of the image. Takes a percentage value with 0% making the image completely transparent and 100% making the image completely opaque, like how it originally is.

{% highlight css %}

img {
    filter: opacity(30%);
}

{% endhighlight %}

<img src="https://farm8.staticflickr.com/7319/8747502274_d536934ba2_b.jpg" style="width: 40%; margin: auto; float:left">

<img src="https://farm8.staticflickr.com/7319/8747502274_d536934ba2_b.jpg" style="filter: opacity(30%); width: 40%; margin: auto; float:right">
<div style="clear:both"></div>

## Saturate
Saturate filter controls how much colour intensity is displayed. More saturation, more intense the colour.

{% highlight css %}

img {
    filter: saturate(300%);
}

{% endhighlight %}

<img src="https://farm8.staticflickr.com/7319/8747502274_d536934ba2_b.jpg" style="width: 40%; margin: auto; float:left">

<img src="https://farm8.staticflickr.com/7319/8747502274_d536934ba2_b.jpg" style="filter: saturate(300%); width: 40%; margin: auto; float:right">
<div style="clear:both"></div>

## Sepia
Sepia filter adds a old or vintage look to your pictures. This effect can be seen in Instagram and other popular image sharing apps. This also takes a percentage value.

{% highlight css %}

img {
    filter: sepia(75%);
}


{% endhighlight %}

<img src="https://farm8.staticflickr.com/7319/8747502274_d536934ba2_b.jpg" style="width: 40%; margin: auto; float:left">

<img src="https://farm8.staticflickr.com/7319/8747502274_d536934ba2_b.jpg" style="filter: sepia(75%); width: 40%; margin: auto; float:right">
<div style="clear:both"></div>

## Multiple filters
Finally, it is also possible to apply multiple filters and create a compounded effect. You just keep adding them one after the other.

{% highlight css %}

img {
    filter: hue-rotate(180deg) blur(2px) contrast(30%) saturate(130%);
}

{% endhighlight %}

<img src="https://farm8.staticflickr.com/7319/8747502274_d536934ba2_b.jpg" style="width: 40%; margin: auto; float:left">

<img src="https://farm8.staticflickr.com/7319/8747502274_d536934ba2_b.jpg" style="filter: hue-rotate(180deg) blur(1px) contrast(90%) saturate(130%); width: 40%; margin: auto; float:right">
<div style="clear:both"></div>

<br >
Hopefully this gives a overview of few of the filters offered by CSS. Next time, try using it in your projects and see how much time and effort it saves from using a image editing tool. Again it is a choice. If you feel these gets you where you want to be, by all means use them.

Happy coding!