# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(email: 'abc@def.com', password: '123456', password_confirmation: '123456')
puts 'Created User'

user_profile = UserProfile.create(first_name: 'Shabana', middle_name: '', last_name: 'Noor',
                                  dob: DateTime.new(1995, 3, 28), gender: 2, country_code: 91, contact_number: 1_234_567_890, user: user)

puts 'Profile Created'

user_profile.user_addresses.create(address_line1: 'Line 1', address_line2: 'Line 2', address_line3: 'Line 3',
                                   city: 'City', state: 'State', pincode: '400241', country_code: '+91', contact_number: '1234567890')

puts 'Address Created'

product = Product.create(name:'Apple', price: 200)

puts 'Product Created'
