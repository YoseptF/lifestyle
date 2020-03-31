# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest_client'
require 'open-uri'

User.create(
  name: 'Joseph'
)

GAMESPOT_API = ENV['GAMESPOT_API'] || process.env.GAMESPOT_API

xml_res = RestClient.get "http://www.gamespot.com/api/articles/?api_key=#{GAMESPOT_API}&sort=publish_date:desc&limit=120&feld_list=authors,title,body,image,categories"
data_hash = Hash.from_xml(xml_res.body)

articles = data_hash["response"]["results"]["article"]

articles.length.times do |time|
  article = articles[time]
  article["categories"]["category"].each do |cat|
    if Category.find_by(name: cat["name"]).nil?
      Category.create(
        name: cat["name"],
        priority: Random.rand(1..5)
      )
    end
  end

  if User.find_by(name: article["authors"]).nil?
    User.create(
      name: article["authors"]
    )
  end

  art = Article.create(title: article["title"], author_id: User.find_by(name: article["authors"]).id, text: article["body"])

  url = articles[time]["image"]["original"].gsub(' ', '%20').gsub('(', '%28').gsub(')', '%29').gsub(',', '%2C').gsub('×','%C3%97').gsub('[', '%5B').gsub(']', '%5D')

  art.image.attach(io: open(url),filename: "#{articles[time]["title"].parameterize}.jpg")

  article["categories"]["category"].each do |category|
    art.categories << Category.find_by(name: category["name"])
  end
end



30.times do
  User.create(
    name: Faker::Name.name
  )
end

80.times do
  Vote.create(
    user_id: Random.rand(User.first.id..User.last.id),
    article_id: Random.rand(Article.first.id..Article.last.id)
  )
end


# cate = articles[0]["categories"]["category"].map {|cat| cat["name"]["name"]}
# art = User.find_by(name: articles[0]["authors"]).articles.build(
#     title: articles[0]["title"],
#     text: articles[0]["body"],
#     categories: Category.find_by(name: cate)
#   )

# articles.length.times do |time|
#   art = User.find_by(name: articles[time]["authors"]).articles.build(
#     title: articles[time]["title"],
#     text: articles[time]["body"],
#     categories: Category.find_by(name: articles[time]["categories"]["category"].select {|cat| cat["name"]})
#   )

#   art.save

#   art.image.attach(
#     io: open(articles[time]["image"]["original"]),
#     filename: "#{articles[time]["title"].parameterize}.jpg"
#   )
# end
