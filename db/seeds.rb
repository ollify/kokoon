# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'faker'

# puts 'creating users'
# 10.times do
#   user = User.new(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name)
#   User.create(
#     first_name: user.first_name,
#     last_name: user.last_name,
#     email: "#{user.first_name}.#{user.last_name}@#{Faker::Internet.domain_name}",
#     phone_number: Faker::PhoneNumber.cell_phone,
#     password: Faker::Internet.password(min_length: 6)
#   )
#   user.save
# end
# puts 'Users created'
# puts 'Creating rentals'


# @user_count = 0

# 10.times do
#   @user_count += 1
#   rental = Rental.new(
#     flat_id: 11,
#     price: [200, 300].sample,
#     start_date: Date.new(2001,2,3),
#     end_date: Date.new(2020,2,3),
#     tenant_id: @user_count
#   )
#   rental.save
# end

# puts 'assigned 10 users'
