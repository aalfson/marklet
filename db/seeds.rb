# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  j = User.create(email: "joe@test.com", name: "Joe", password: "nimda")
  b = User.create(email: "bob@test.com", name: "Bob", password: "nimda")
  
  tech = Category.create(name: "Technology", description: "A category related to technology.")
  astro = Category.create(name: "Astronomy", description: "A category related to astronomy.")
  tools = Category.create(name: "Tools", description: "A category related to technical tools.")
  
  j_tech_sub = Subscriber.create(category: tech, user: j, moderator: true)
  b_tech_sub = Subscriber.create(category:tech, user: b, moderator: false)
  tech.subscribers = [j_tech_sub, b_tech_sub]
  
  j_astro_sub = Subscriber.create(category: astro, user: j, moderator: true)
  astro.subscribers = [j_astro_sub]
  
  b_tools_sub = Subscriber.create(category: tools, user: b, moderator: true)
  tools.subscribers = [b_tools_sub]
  
  j.categories = [tech, astro]
  b.categories = [astro, tools]
      
  Bookmark.create(url: "http://www.google.com", title: "Google", user: j, category: tools)
  Bookmark.create(url: "http://www.universetoday.com", title: "Universe Today", user: j, category: astro)
  Bookmark.create(url: "http://news.ycombinator.com/", title: "Hacker News", user: b, category: tech)