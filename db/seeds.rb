# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Car.destroy_all

15.times do
  avatar = "https://source.unsplash.com/random"
  name = Faker::Name
  password = Faker::Hipster.word
  email = Faker::Internet.email
  description = Faker::Hipster.sentence
  address = Faker::Address.street_address
  new_user = User.new(avatar: avatar, name: name, password: password, email: email, description: description, address: address)
  new_user.save!
end

15.times do
  brand = Faker::Vehicle.manufacture
  model = Faker::Vehicle.model(make_of_model: 'Toyota')
  year = rand(1950..2020)
  description = Faker::Hipster.sentence
  horse_power = rand(100..500)
  price = rand(50..600)
  user_id = User.all.sample.id
  new_car = Car.new(brand: brand, model: model, year: year, description: description, horse_power: horse_power, price: price, user_id: user_id)
  new_car.save!
end
