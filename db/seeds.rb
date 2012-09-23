# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  j = User.create(email: "joe@test.com", name: "Joe", password: "nimda")
  p = User.create(email: "peter@test.com", name: "Peter", password: "nimda")
  q = User.create(email: "qaugmire@test.com", name: "Quagmire", password: "nimda")
  
  tech = Category.create(name: "Technology", description: "A category related to technology.")
  astro = Category.create(name: "Astronomy", description: "A category related to astronomy.")
  tools = Category.create(name: "Tools", description: "A category related to technical tools.")
  skiing = Category.create(name: "Skiing", description: "All about skiing")
  
  j_tech_sub = Subscriber.create(category: tech, user: j, moderator: true)
  p_tech_sub = Subscriber.create(category:tech, user: p, moderator: false)
  q_tech_sub = Subscriber.create(category:tech, user: q, moderator: false)
  tech.subscribers = [j_tech_sub, p_tech_sub, q_tech_sub]
  
  j_astro_sub = Subscriber.create(category: astro, user: j, moderator: true)
  astro.subscribers = [j_astro_sub]
  
  p_tools_sub = Subscriber.create(category: tools, user: p, moderator: true)
  tools.subscribers = [p_tools_sub]
  
  q_skiing_sub = Subscriber.create(category: skiing, user: q, moderator: true)
  
  j.categories = [tech, astro]
  p.categories = [astro, tools]
  q.categories = [tech, skiing]
      
  Bookmark.create(url: "http://www.google.com", title: "Google", user: j, category: tools)
  Bookmark.create(url: "http://www.universetoday.com", title: "Universe Today", user: j, category: astro)
  Bookmark.create(url: "http://news.ycombinator.com/", title: "Hacker News", user: p, category: tech)
  Bookmark.create(url: "http://www.vooza.com/", title: "Vooza", user: q, category: tech)
  Bookmark.create(url: "http://www.tripphix.com", title: "TripPhix", user: p, category: tech)
  Bookmark.create(url: "http://www.breckenridge.com", title: "Breckenridge", user: q, category: skiing)