# README

Marklet is a Hacker News / Reddit / Digg style bookmark sharing application built on Ruby on Rails. 

Description & Feature List: 

Marklet generates a bookmarklet with a unique id that users can place in their tool bar. When a user comes across a website they want to share with the community, they click on the bookmarklet. The bookmarklet loads marklet.js and a form that posts the page's title, url, and user-selected category to the service under the user's account. Bookmarks are categorized under user-created and user-subscribed categories. Each category has at least one moderator, but can have more. Users can vote on the relevance of each bookmark such that the most popular bookmarks are listed first. Users can also leave comments on each of the bookmarks. 

Completed Features: 

Bookmarklet and Bookmark Submission
Bookmark-related models, views, and controller
User Accounts w/ Devise
Views w/ Twitter's Bootstrap

Road Map: 

Category-related model, views, and controller. This feature is currently about 1/2 completed. 
Category selection on bookmarklet submission form
Voting mechanism
Comments 