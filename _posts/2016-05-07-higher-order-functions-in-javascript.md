---
layout: post
title:  "Higher order functions in JavaScript"
excerpt: "A look into functional programming concept in JavaScript"
banner: http://res.cloudinary.com/neoelemento/image/upload/v1481370004/blog/ES-min.jpg
author: "Vishnu"
date:   2016-05-07 00:01:00
categories: javascript programming
---
If you have been reading other posts on this blog, you might see that I am a [fan of JavaScript](http://neoelemento.com/blog/2015/10/24/javascript-everywhere/). We skimmed through the surface of ES6 in an [earlier post](http://neoelemento.com/blog/2016/05/06/getting-started-with-es6/). Today we'll go a bit into the functional programming aspect of JavaScript. Concept of functional programming makes programming a joy by saving complication and development time as well.

## Functional Programming
We all know what functions are. Be it any high level language like C, C++, Java, PHP or Python, they all have functions. Functions enable re-using a set of instructions. Let's take the following simple example:

{% highlight javascript %}
// return the sum of two numbers
function sum(x, y) {
    return x + y;
}
sum(3, 4); // returns 7
{% endhighlight %}

The above example shows a simple function to add two numbers which can be passed as arguments. This is the same across most of the major programming languages. But only few of them let you do something like this:

{% highlight javascript %}
// return  the sum of two numbers
var sum = function(x, y) {
    return x + y;
}
sum(3, 4); // returns 7
{% endhighlight %}

Here, we are creating an anonymous function and assigning it to a variable `sum`. The result is the same. So this means that functions are values and can be assigned to variables. Also, functions can be passed in as arguments within other functions. The functions that accept another function as an argument are called **Higher Order Functions**. Higher order functions are very useful and important to do functional programming in JavaScript. Let's take a look at few of the higher order functions that JavaScript provides:

- Filter
- Find
- Map 
- Reduce

### Filter
A filter is a higher order function that accepts another function as an argument to iterate over an array and filter out elements that fall under the filtering criteria defined by the function that is passed in. The function that is passed in as the argument is called a **callback function**. To make this more clear, let's take a look at the following example:

{% highlight javascript %}
// List of cars
var cars = [
  { name: 'Aston Martin', country: 'UK' },
  { name: 'Jaguar', country: 'UK' },
  { name: 'Porsche', country: 'Germany' },
  { name: 'Audi', country: 'Germany' },
  { name: 'BMW', country: 'Germany' },
  { name: 'Lamborghini', country: 'Italy' },  
  { name: 'Ferrari', country: 'Italy' },  
];

// filter out German cars using loop
var german = [];
for (var i = 0; i < cars.length; i++) {
    if (cars.country === 'Germany') {
        german.push(cars[i]);    
    }    
}
{% endhighlight %}

We have a list of cars with their make and the country of origin. We are filtering out the cars that are made in Germany. To do this in a traditional way, we use a for loop to iterate through the list and try to find the cars that match our criteria by using the condition `if (cars.country === 'Germany')`. Whenever this condition is true, that element is pushed into the array `german[]`. Once the loop runs through the entire list, the array `german[]` will be a list of all German cars.

This works fine, but now, let's use `filter()` to do the same job.

{% highlight javascript %}
// List of cars
var cars = [
  { name: 'Aston Martin', country: 'UK' },
  { name: 'Jaguar', country: 'UK' },
  { name: 'Porsche', country: 'Germany' },
  { name: 'Audi', country: 'Germany' },
  { name: 'BMW', country: 'Germany' },
  { name: 'Lamborghini', country: 'Italy' },  
  { name: 'Ferrari', country: 'Italy' },  
];

// using 'filter'
var german = cars.filter(function(cars) {
    return car.country === 'Germany';    
});
{% endhighlight %}

See how simple it is? Using the `filter` function, we were able to achieve the same result without using any for loop and in less lines of code. Here, an anonymous callback function is passed into `filter` and it expects the callback function to return `true` or `false` based on the condition.

To break it down, if we compare the two examples, in the first one, we have the responsibility of iterating through the loop, matching the items that fit the the filtering criteria and also pushing the matching elements to the array. But in the second example, `filter` function takes the job of iterating and pushing the items into the array. So now the sole purpose of the callback is the specify the criteria for a match.

The filter function can also be re-written as:

{% highlight javascript %}
// List of cars
var cars = [
  { name: 'Aston Martin', country: 'UK' },
  { name: 'Jaguar', country: 'UK' },
  { name: 'Porsche', country: 'Germany' },
  { name: 'Audi', country: 'Germany' },
  { name: 'BMW', country: 'Germany' },
  { name: 'Lamborghini', country: 'Italy' },  
  { name: 'Ferrari', country: 'Italy' },  
];

// function to return german cars
var isGerman = function(car) {
    return car.country === 'German';
}
// function to return British cars
var isBritish = function(car) {
    return car.country === 'UK';
}
// filtering German cars
var german = cars.filter(isGerman);
// filtering British cars
var british = cars.filter(isBritish);
{% endhighlight %}

In this way we have completely separated the filtering criteria from the `filter` function. So, we can have the callback functions defined separately and have the filter functions call them as and when required. This really helps in writing clean and maintainable code.

### Find
The `find` function is a higher order function similar to `filter` where the difference is that while `filter` returns a list of items matching the filter criteria, `find` returns only the first match. Using the same sample the output will be as follows:

{% highlight javascript %}
// List of cars
var cars = [
  { name: 'Aston Martin', country: 'UK' },
  { name: 'Jaguar', country: 'UK' },
  { name: 'Porsche', country: 'Germany' },
  { name: 'Audi', country: 'Germany' },
  { name: 'BMW', country: 'Germany' },
  { name: 'Lamborghini', country: 'Italy' },  
  { name: 'Ferrari', country: 'Italy' },  
];

// function to return german cars
var isGerman = function(car) {
    return car.country === 'German';
}
// function to return British cars
var isBritish = function(car) {
    return car.country === 'UK';
}
// filtering german cars
var german = cars.find(isGerman); // output => { name: 'Porsche', country: 'Germany' }
// filtering british cars
var british = cars.find(isBritish); // output => { name: 'Aston Martin', country: 'UK' }
{% endhighlight %}

It is useful when you are want to find a match in an array.

### Map
Map is a higher order function like `filter`, but unlike `filter`, which returns an array based on the filter criteria, `map` transforms them. Let's take our earlier example of a list of cars and try to return the make of all cars using traditional for loop:

{% highlight javascript %}
// List of cars
var cars = [
  { name: 'Aston Martin', country: 'UK' },
  { name: 'Jaguar', country: 'UK' },
  { name: 'Porsche', country: 'Germany' },
  { name: 'Audi', country: 'Germany' },
  { name: 'BMW', country: 'Germany' },
  { name: 'Lamborghini', country: 'Italy' },  
  { name: 'Ferrari', country: 'Italy' },  
];

var names = [];
for (var i = 0; i < cars.length; i++){
    names.push(cars[i].name);   
}
{% endhighlight %}

The `for` loop here iterates through each item within `cars` and pushes the `name` property back into the array. Same old stuff. Now let's see how this might change when we apply `map` over the list of cars.

{% highlight javascript %}
// List of cars
var cars = [
  { name: 'Aston Martin', country: 'UK' },
  { name: 'Jaguar', country: 'UK' },
  { name: 'Porsche', country: 'Germany' },
  { name: 'Audi', country: 'Germany' },
  { name: 'BMW', country: 'Germany' },
  { name: 'Lamborghini', country: 'Italy' },  
  { name: 'Ferrari', country: 'Italy' },  
];

// return the name of cars
var names = cars.map(function(car) {
    return car.name;    
});

// return the name and country
var names = cars.map(function(car) {
    return car.name + " is from " + car.country;    
});
{% endhighlight %}

This looks pretty much similar to the `filter` function, but the difference is where `filter` expects the callback function to return a `true` or `false` value to decide whether to list the item, `map` is expecting the callback to do the transformation over the items in the list to create a new array instead of returning the original items. Oh a long sentence, but I am sure you can understand :sunglasses:

The first `map` returns a list of all car names and the second one returns the `car name + " is from " country` string. This has the same advantages of reduced code size and easy maintainability. The same thing in ES6 would be as follows:

{% highlight javascript %}
// return the name in ES6ways
var names = cars.map((car) => { return car.name; });
// the above statement can be further simplified as follows:
var names = cars.map(car => car.name);
// you can even replace the variable car with something like x
var names = cars.map(x => x.name); // tada!!!
{% endhighlight %}

Using ES6 arrow operator `=>` see how this whole expression turned into something as simple as `var names = cars.map(x => x.name);`. It exactly tells you what the transformation is `x` becomes `x.name`. Now that looks like something out of your algebra class from your school days. That's why it is called *functional programming* :wink:

I hope by now the advantages of functional programming and ES6 is becoming more clearer.

### Reduce
So far we have seen iterating over a list of items and returning another list of items that satisfy a particular criteria (`filter`) or get the list of items transformed in a particular way (`map`). Now there are some instances where we need to calculate a single value from an array, like finding the sum of all the values from a collection of numbers.

Let's take the previous example of collection of cars and assume that a wealthy billionaire owns all of these cars. He decides to calculate the worth of all his cars. We add another property `price` to the list. Let's see how we might calculate the total price using traditional `for` loop:

{% highlight javascript %}
// List of cars
var cars = [
  { name: 'Aston Martin', country: 'UK', price: 250 },
  { name: 'Jaguar', country: 'UK', price: 150 },
  { name: 'Porsche', country: 'Germany', price: 120 },
  { name: 'Audi', country: 'Germany', price: 100 },
  { name: 'BMW', country: 'Germany', price: 75 },
  { name: 'Lamborghini', country: 'Italy', price: 450 },  
  { name: 'Ferrari', country: 'Italy', price: 550 },  
];

// return the total price of cars
var totalPrice = 0;
for (var i = 0; i < cars.length; i++) {
    totalPrice += cars[i].price;   
}
{% endhighlight %}

Simple stuff, we just iterate over all the items and add the price to the variable `totalPrice` which has an initial value of `0`. Simple *programming 101*. Now let's implement the same using `reduce` function.

{% highlight javascript %}
// List of cars
var cars = [
  { name: 'Aston Martin', country: 'UK', price: 250 },
  { name: 'Jaguar', country: 'UK', price: 150 },
  { name: 'Porsche', country: 'Germany', price: 120 },
  { name: 'Audi', country: 'Germany', price: 100 },
  { name: 'BMW', country: 'Germany', price: 75 },
  { name: 'Lamborghini', country: 'Italy', price: 450 },  
  { name: 'Ferrari', country: 'Italy', price: 550 },  
];

// return the total price of cars
var totalPrice = cars.reduce(function(sum, car) {
    return sum + car.price;   
}, 0);

// simplified using ES6 syntax
var totalPrice = cars.reduce((sum, car) => {sum + car.price}, 0);
{% endhighlight %}

The `reduce` function takes in two arguments, the `sum` and the current item `car`. What is does as it iterates through the list, it adds the `car.price` of that particular item to the `sum`. Thereby `sum` becoming a total of all prices. This is a very simple example of how `reduce` works. It also takes an object as the start value for `sum`, which in our case is denoted by the `0` passed in right after the callback function.

So, `reduce` is a very powerful higher order function that can be used when there are no fitting ready made solutions like `map` or `filter`. So welcome to the world of functional programming, hope this excites you a bit about JavaScript. There are many resources online on functional programming and ES6 in general. Learning to program the functional way will definitely help in becoming a better programmer in any language.

Happy coding!