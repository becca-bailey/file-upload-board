# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

becca = User.create!(first_name: "Becca", last_name: "Nelson", email: "beccanelson88@gmail.com", password: "password")

10.times do
  category = becca.categories.create!(name: Faker::Hacker.adjective)
  20.times do
    post = category.posts.create!(title: Faker::Hipster.sentence, link_url: Faker::Internet.url,  image_url: Faker::Avatar.image, body: Faker::Hipster.paragraph)
    becca.posts << post
  end
end
