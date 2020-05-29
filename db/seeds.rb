# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
Booking.destroy_all
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

cities = %w(Zurich Lausanne Renens Morges Geneva Basel Lucern Locarno Lugano Interlaken Bern Davos Thun Sion Zermatt)
car_photos = [
  'https://www.mercedes-benz.com/en/classic/classic-cars-for-sale-mercedes-benz-all-time-stars/_jcr_content/root/slider/sliderchilditems/slideritem/image/MQ7-0-image-20190816165034/01-mercedes-benz-all-time-stars-concours-edition-cars-300-sl-1700x720.jpeg',
  'https://cdn.aarp.net/content/dam/aarp/auto/2017/02/1140-classic-car-safety.imgcache.rev30757a1d44e422554cbd71f0df22a617.jpg',
  'https://assets.bwbx.io/images/users/iqjWHBFdfxIU/i7hAtwFPyO5w/v1/1000x-1.jpg',
  'https://imagescdn.dealercarsearch.com/dealerimages/13225/27219/fxslide3.jpg',
  'https://i.pinimg.com/originals/0b/6c/93/0b6c93a8f983f8cbe1ea0827e11f1212.jpg',
  'https://imagescdn.dealercarsearch.com/dealerimages/14801/26992/vidfallback1.jpg',
  'https://d2egmpncr9xdtw.cloudfront.net/wp-content/uploads/2017/04/09920_4044.jpg',
  'https://imagescdn.dealercarsearch.com/dealerimages/11627/27257/fxslide4.jpg',
  'https://classiccarrental.es/wp-content/uploads/2019/06/FOT6.jpg',
  'https://www.legendarycollectorcars.com/wp-content/uploads/2010/05/IMG_7063-Small.jpg',
  'https://i.pinimg.com/originals/0e/e9/f3/0ee9f30a0d4d7b35e1a309b80d023c74.jpg',
  'https://hips.hearstapps.com/roa.h-cdn.co/assets/16/23/23256575993_178114b2e5_k.jpg',
  'https://imagescdn.dealercarsearch.com/dealerimages/11627/27257/fxslide2.jpg',
  'https://resources.stuff.co.nz/content/dam/images/1/x/4/s/5/n/image.related.StuffLandscapeThreeByTwo.1464x976.1x4hkg.png/1569461044055.jpg',
  'https://www.kidston.com/views/themes/uploads/2019/12/Lancia_Flaminia_Sports_0021.jpg',
  'https://cdn07.carsforsale.com/CustomTemplatePhotos/391603/photos/ss2.5c0523ad.jpg',
  'https://www.classiccarsfriesland.com/wp-content/uploads/2018/12/Jaguar-XK-150-FHC-british-racing-green-001-1.jpg',
  'https://s22734.pcdn.co/wp-content/uploads/2-Front-low.jpg',

]

100.times do |index|
  file = URI.open(car_photos.sample)
  brand = Faker::Vehicle.manufacture
  model = Faker::Vehicle.model(make_of_model: 'Toyota')
  year = rand(1950..2020)
  address = cities.sample
  description = Faker::Hipster.paragraphs(number: 10).join("\n\n")
  horse_power = rand(100..500)
  price = rand(50..600)
  user = User.all.sample
  new_car = Car.new(address: address, brand: brand, model: model, year: year, description: description, horse_power: horse_power, price: price, user: user)
  new_car.save!
  new_car.photos.attach(io: file, filename: "#{new_car.model} photo #{new_car.id}")
  puts 100 - index
end
