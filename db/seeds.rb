# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  j = User.create(email: "joe@test.com", name: "Joe", password: "nimda")
  b = User.create(email: "bob@test.com", name: "Bob", password: "nimda")
  
  tech = Category.create(name: "Technology")
  astro = Category.create(name: "Astronomy")
  tools = Category.create(name: "Tools")
  
  j.categories = [tech, astro]
  b.categories = [astro, tools]
  
  Bookmark.create(url: "http://www.google.com", title: "Google", user: j, category: tools)
  Bookmark.create(url: "http://www.universetoday.com", title: "Universe Today", user: j, category: astro)
  Bookmark.create(url: "http://news.ycombinator.com/", title: "Hacker News", user: b, category: tech)