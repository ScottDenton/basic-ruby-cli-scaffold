# Feel free to use the Faker gem to write some nice seed data!
# Here are the docs: https://github.com/stympy/faker
# Remember: run `rake db:seed` to use this file
10.times do
  City.create(name: Faker::LordOfTheRings.location)
end

30.times do
  User.create(name: Faker::RickAndMorty.character, age:rand(18..70))
end

15.times do
  Neighborhood.create(name: Faker::Pokemon.location, city_id: rand(0..10))
end


20.times do
  Listing.create(title: Faker::Hobbit.location, description: Faker::FamousLastWords.last_words , address: Faker::Address.street_address , price: rand(100..500), host_id: rand(1..30), neighborhood_id: rand(1..15)  )
end


#
