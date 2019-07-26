# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end


# 200.times do |time|
#   title = Faker::Games::Dota.hero
#   content = Faker::Games::Dota.quote
#   Post.create!(title: title, content: content)
# end

100.times do |time|
  content = Faker::Games::Dota.quote
  User.first.microposts.create!(content: content)
end

100.times do |n|
  Laptop.create!(name: "Laptop #{n+1}", processor: ["i3", "i5", "i7"].sample, ram: [4, 8, 16].sample)
end

100.times do |n|
  Pc.create!(name: "PC #{n+1}", processor: ["i3", "i5", "i7"].sample, ram: [4, 8, 16].sample)
end
