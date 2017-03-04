---
layout: post
title:  "HTTP status codes"
excerpt: "There are various HTTP codes that are returned from a server. What do these numbers mean?"
banner: http://res.cloudinary.com/vishnupadmanabhan/image/upload/v1488591916/http.jpg
author: "Vishnu"
date:   2015-11-22 08:13:00
categories: http
---
If you are an Internet user or a developer, you would've come across various status codes as responses. When you search a particular page and it shows up '**404 - not found!**'. What does this mean exactly? Let's take a look at the most commonly seen HTTP responses.

## 100s - Hold on, we are processing!
Anything that falls in the 100s represents a process that is still going on. The server has taken your request and is processing it. So you should probably wait. These are few requests that fall in this category:

* **100 - Continue**: This is a confirmation that the server has received the request headers and the client can proceed to send the request body. This is to prevent sending request body of big size to the server if the request header is rejected by the server. Makes things more efficient.

* **101 - Switching Protocols**: When there is a request from the client to switch protocols, the server acknowledges with a 101 response.

* **102 - Processing**: This is a response from the server acknowledging that it has received the request and is processing it, but there is no response yet.

## 200s - Things are doing great!
A 200 status code implies that things are fine and your request has been successfully been processed and response has been provided. This is what we hope to see in our console!

* **200 - OK**: This means a successful HTTP request. You are happy. End of the story.

* **201 - Created**: This means that the server has accepted your request, completed the required processing and a new resource has been created.

* **202 - Accepted**: Well, server has accepted your request and is taking time to process it. But you do not have a confirmation yet on whether the request might be successfully processed or not.

There are many more like **204 - No content**, **206 - Partial Content** etc.

## 300s - Sorry, we aren't here anymore
A 300 response indicates that the request needs additional action from the client successfully complete itself. These are mostly used in redirecting URLs. 

* **300 - Multiple Choices**: This response indicates multiple choices to complete the request. Useful if you want to decide the response based on file types.

* **301 - Moved Permanently**: The request URL has been permanently moved to a different location.

* **307 - Temporary Redirect**: This is just a temporary redirect. For now, the request should be directed to a different URL, but later on the requests should be redirected back to the existing URL.

## 400s - Now see, your bad!
This set of response is returned when there is a client side error. 

* **400 - Bad Request**: This happens when a server cannot or will not process a request due to a client side error.

* **401 - Unauthorized**: This request is specifically used when there is a requirement for authentication and it has either failed or not been provided. This is what you get when you try to access pages that require a username and password of some sort but you haven't entered them or you do not have permission to view the content.

* **403 - Forbidden**: This is similar to 401 in that the server is refusing the request, but authentication will make no difference whatsoever.

* **404 - Not found**: This is the most common response that we all have encountered. This means that the requested resource or URL is not presently found. But this does not mean that it wouldn't be available in the future and you can make further requests.

* **408 - Request Timeout**: This indicates that the server has timed out waiting for the request. This is what you see on many websites when you wait for a long time to provide an input.

There are many many more!

## 500s - Oops, my bad!
Things here indicate a server error -  the server is not able to process and respond as expected.

* **500 - Internal Server Error**: This is a developer's nightmare. This is the most generic error which provide no explanation of the problem whatsoever. Hard to debug!

* **501 - Not Implemented**: This happens when server either does not recognize the request method, or it lacks the ability to fulfill the request. But future availability is not ruled out.

* **502 - Bad Gateway**: This happens when your server, acting as a gateway and has received an invalid response from an upstream server.

* **503 - Service Unavailable**: This is returned when the server is either overloaded or down for maintenance.

* **504 - Gateway Timeout**: This is similar to 503, but here the upstream server delays in providing a timely response.

* **508 Loop Detected**: This happens when there is a redirect loop in your application. Prevents the server from entering an infinite loop.


These are just a few handful, but enough for most situations that we encounter. There are a [list of HTTP codes listed in Wikipedia](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes){:target="_blank"} for your reference.