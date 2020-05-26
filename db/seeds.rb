# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Car.destroy_all
User.destroy_all

images = [
  'https://static-assets.tesla.com/configurator/compositor?&bkba_opt=2&view=STUD_3QTR_V2&size=1400&model=ms&options=$MDLS,$MTS05,$PPSW,$RFFR,$WTMS,$INB3W,$PI01,$APBS,$SC05,$CPF0&',
  'https://cars.usnews.com/dims4/USNEWS/c63efbe/2147483647/resize/640x420%3E/format/jpeg/quality/85/?url=https%3A%2F%2Fcars.usnews.com%2Fstatic%2Fimages%2Farticle%2F202004%2F126924%2F02_2019_Acura_RDX_Advance_1crop-min_640x420.jpg',
  'https://i.insider.com/5d0bd4b7e3ecba5d97628a02?width=1100&format=jpeg&auto=webp',
  'https://www.autocar.co.uk/sites/autocar.co.uk/files/styles/body-image/public/1-corvette-stingray-c8-2019-fd-hr-hero-front_0.jpg?itok=SEYe_vLy',
  'https://www.telegraph.co.uk/content/dam/news/2017/11/11/Lam1_trans%2B%2BnAdySV0BR-4fDN_-_p756cVfcy8zLGPV4EhRkjQy7tg.jpg',
  'https://article.images.consumerreports.org/f_auto/prod/content/dam/CRO%20Images%202019/Cars/November/CR-Cars-InlineHero-2020-Toyota-Prius-AWD-f-11-19',
  'https://www.racv.com.au/content/dam/racv/images/royalauto-2019/moving/cars/general/australias-best-cars-2019/best-medium-cars-under-65k/1.TOYOTA-CAMRY.jpg.transform/heroMob/image.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRQ57PaEpZbPxFjGe-3y2T-LevyR3AAfBab55eGD6ld7QlMHfd_&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSNzZPC6OAIA4Lr1Do7SGVLRxdRVjhWU82JxVEv2N0K4s2iB3gL&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSd9vqsJm1SIHQeCzCAoxb3_KHaAMsLh5be-SUTpt1MBRXKZMFD&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRIki6fktSbzCnNXTbB2RcbipoHngne35Vr1beKzqWz0JzWMTIg&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT3y3QLRsHCMwT5-NTQQvdpXl_n6yAlio1UmRvWxk3zGfRJhXk8&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSS80Lh9QcJtNVii6282OukusN061eNe6Kj31R991KgEKsmfyR2&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR6v3lPupmGlo0PBybQTwqFUkNXiaxCG4hYS_EomNmONfJaD_nH&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQz3FF_Per00QT7mi2ouRWsLQ2Gdw-m4PeK2QXVV75C-JNNEuR7&usqp=CAU'
]

15.times do
  avatar = "https://source.unsplash.com/random"
  username = Faker::Name.name
  password = Faker::Lorem.characters(number: 10)
  email = Faker::Internet.email
  description = Faker::Hipster.sentence
  address = Faker::Address.street_address
  new_user = User.new(avatar: avatar, username: username, password: password, email: email, description: description, address: address)
  new_user.save!
end

15.times do |index|
  brand = Faker::Vehicle.manufacture
  photo = images[index]
  model = Faker::Vehicle.model(make_of_model: 'Toyota')
  year = rand(1950..2020)
  description = Faker::Hipster.sentence
  horse_power = rand(100..500)
  price = rand(50..600)
  user_id = User.all.sample.id
  new_car = Car.new(photo: photo, brand: brand, model: model, year: year, description: description, horse_power: horse_power, price: price, user_id: user_id)
  new_car.save!
end
