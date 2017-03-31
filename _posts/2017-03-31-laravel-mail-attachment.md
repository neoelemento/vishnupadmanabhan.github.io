---
layout: post
title:  "Email attachments using Laravel"
excerpt: "Easy way to send attachments with your emails using Laravel"
banner: http://res.cloudinary.com/vishnupadmanabhan/image/upload/v1490964241/laravel.png
author: "Vishnu"
date:   2017-03-31 00:01:00
categories: Laravel
comments: true
---
If you have used Laravel framework, you would know that it abstracts some of the difficults tasks. I have used it in past for various projects and have seen a great improvement in productivity within my teams. Lately Laravel has been gaining popularity amongst developers.

If you have ever built a SAAS app or even a small reporting app for your boss, it would have some kind of a built-in mailing system either to send the users some information or to mail that report to your boss at the end of the week. While this is not so complicated using the built in PHP `mail()` function, what happens when you have an attachment with your email? Things get a little bit complex.

Without using a framework, just using PHP's `PHPMailer()` class, we can send mail as follows:

```php
$email = new PHPMailer();
$email->From      = 'me@example.com';
$email->FromName  = 'Me';
$email->Subject   = 'Your free PDF';
$email->Body      = 'Hey, thanks for signing up, here is the PDF I promised you!';
$email->AddAddress( 'you@example.com' );

$file_to_attach = 'freestuff/free-file.pdf';

$email->AddAttachment( $file_to_attach , 'free-file.pdf' );

return $email->Send();
```
Looks a little cumbersome or maybe I am just a minimalist :wink: Using Laravel, it is just the matter of using the `attach()` method of Laravels `Mail` facade.

```php
Mail::send('emails.freefile', [], function ($m) {
    $m->to('you@example.com');
    $m->subject('Your free PDF');
    $m->body('Hey, thanks for signing up, here is the PDF I promised you!');
    $m->attach(storage_path('freestuff/free-file.pdf'));
});
```

Here `emails.freefile` is the route which fires the email. The file is picked from the storage path which is the `storage` directory and in this case the `storage/freestuff` folder.

Sometimes, instead of an attachment you want a file or an image to be embeddeed within your email. Can be your logo or an email signature. This can be done useing the `embed()` method and passing the location of the file.

{% raw %}
```php
<h1>Here is an aweosme image for you!</h1>

// using blade template for embedding image
<img src="{{ $message->embed(storage_path('embed.jpg')) }}">

Thanks!
```
{% endraw %}

There, it is that simple.