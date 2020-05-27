# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
Car.destroy_all
User.destroy_all

5.times do
  file = URI.open('https://source.unsplash.com/random')
  username = Faker::Name.name
  password = Faker::Lorem.characters(number: 10)
  email = Faker::Internet.email
  description = Faker::Hipster.sentence
  address = Faker::Address.street_address
  new_user = User.new(username: username, password: password, email: email, description: description, address: address)
  new_user.save!
  new_user.photo.attach(io: file, filename: "#{new_user.id}", content_type: 'image/jpg')

end

5.times do |index|
  file = URI.open('https://source.unsplash.com/featured/?wolkswagen')
  brand = Faker::Vehicle.manufacture
  model = Faker::Vehicle.model(make_of_model: 'Toyota')
  year = rand(1950..2020)
  address = Faker::Address.city
  description = Faker::Hipster.paragraphs(number: 10).join("\n\n")
  horse_power = rand(100..500)
  price = rand(50..600)
  user_id = User.all.sample.id
  new_car = Car.new(address: address, brand: brand, model: model, year: year, description: description, horse_power: horse_power, price: price, user_id: user_id)
  new_car.save!
  new_car.photos.attach(io: file, filename: "#{new_car.id}", content_type: 'image/jpg')
end
