# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# 100.times do |i|
#         restaurant= Restaurant.create(
#             name: Faker::Restaurant.name ,
#             location: Faker::Address.street_name,
#             menu: Faker::Restaurant.type ,
#             review: Faker::Restaurant.review  
#         )
#         puts "Restaurant #{restaurant.id} Created Successfull"
#     end

# restaurant_ids=Restaurant.pluck(:id)
# 100.times do |i|
#     restaurant=Restaurant.find(restaurant_ids[rand(restaurant_ids.length)])
#     menu=restaurant.menu_items.create(
#         name: Faker::Food.dish,
#         price: 20+(rand(i))
#     )
#     puts "Menu_items #{menu.id} Created Successfully"
# end