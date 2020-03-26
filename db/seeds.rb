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

xml_res = RestClient.get "http://www.gamespot.com/api/articles/?api_key=#{ENV['GAMESPOT_API']}&offset=1000&limit=20&feld_list=authors,title,body,image,categories"
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

  art = Article.create(title: article["title"],
     author_id: User.find_by(name: article["authors"]).id,
      text: article["body"]
    )

  art.image.attach(
    io: open(articles[time]["image"]["original"]),
    filename: "#{articles[time]["title"].parameterize}.jpg"
  )

  article["categories"]["category"].length.times do |time|
    art.categories << Category.find_by(name: article["categories"]["category"][time]["name"])
  end
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
