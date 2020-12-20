# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do
    Bookmark.create(name: Faker::Game.platform)
end

20.times do
    Category.create(name: Faker::Game.genre, privacy: false, bookmark_id: rand(1..3))
end

30.times do
    SubCategory.create(name: Faker::Game.title, privacy: false, category_id: rand(1..3))
end


250.times do
    models = ["Category", "SubCategory"]
    Url.create(url_name: Faker::Internet.url, urlable_id: rand(1..20), urlable_type: models[rand(0..1)]  ) 
end

