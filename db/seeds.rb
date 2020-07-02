# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CATEGORIES = %w[chinese italian japanese french belgian].freeze

puts 'Cleaning up db'
Restaurant.destroy_all
Review.destroy_all
puts 'Cleaning up done'

5.times do
  new_restaurant = Restaurant.create({
                                       name: Faker::Restaurant.name,
                                       category: CATEGORIES.sample,
                                       address: Faker::Address.street_address
                                     })
  puts "Created restaurant #{new_restaurant.id}"
  rand(1..3).times do
    new_review = Review.new({
                              content: Faker::Restaurant.review,
                              rating: rand(0..5)
                            })
    new_review.restaurant = new_restaurant
    new_review.save
    puts "Created review #{new_review.id} for #{new_restaurant.id}"
  end
end
