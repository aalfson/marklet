# MARKLET - READ ME

Marklet is a Hacker News / Reddit / Digg style bookmark sharing application built on Ruby on Rails.

## Demo

For the moment, you can find a demo of the application here: [marklet](http://marklet.herokuapp.com/)

## Description & Feature List:  

Marklet generates a bookmarklet with a unique id that users can place in their tool bar. When a user comes across a website they want to share with the community, they click on the bookmarklet. The bookmarklet loads marklet.js and a form that posts the page's title, url, and user-selected category to the service under the user's account. Bookmarks are categorized under user-created and user-subscribed categories. Each category has a moderator that can modify the category and its bookmarks. 

In the future, users will be able to vote on the relevance of each bookmark such that the most popular bookmarks are listed first. Users will also be able to leave comments on each of the bookmarks. 

## Requires: 

* [Devise](https://github.com/plataformatec/devise)
* [Bootstrap](https://github.com/twitter/bootstrap)

## Completed Features: 

* Bookmarklet and Bookmark Submission
* Bookmark-related models, views, and controller
* Category-related model, views, and controller
* User Accounts w/ Devise
* Views w/ Twitter's Bootstrap

## Road Map: 

* Testing for Bookmarklet
* Voting mechanism
* Comments 

## Known issues: 
* Bookmarklet has issues saving HTTPS pages
* Native page css can cause minor inconsistencies in the way the submit form is rendered. 

************************************************

### NOTE: You must change the urls in public/marklet.js and user#bookmarklet to reflect you host. 

************************************************
