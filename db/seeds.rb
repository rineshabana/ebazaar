# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.all.map(&:destroy)
Category.all.map(&:destroy)
User.all.map(&:destroy)
puts "Destroyed Existing Data"
def get_new_image
    url = "https://picsum.photos/600/600"
    name = Faker::Name.first_name.downcase
    file_name = "#{name}.jpg"
    full_path = "/tmp/#{file_name}"
    File.open(full_path, "wb") do |f| 
        f.write HTTParty.get(url).body
    end
    return [file_name , full_path]
end
purge_later = []

user = User.create!(email: 'abc@def.com', password: '123456', password_confirmation: '123456', roles: %i[user admin seller])
puts 'Created User'

user_profile = UserProfile.create!(first_name: 'Shabana', middle_name: '', last_name: 'Noor',
                                  dob: DateTime.new(1995, 3, 28), gender: 2, country_code: 91, contact_number: 1_234_567_890, user: user)

puts 'Profile Created'

user_profile.user_addresses.create!(address_line1: 'Line 1', address_line2: 'Line 2', address_line3: 'Line 3',
                                   city: 'City', state: 'State', pincode: '400241', country_code: '+91', contact_number: '1234567890')

puts 'Address Created'
categories = Category.create!([{name:"Electronics"},{name:"HealthCare"},{name: "Sports"},{name:"Gaming"},{name: "Education"}])

puts 'Category Created'

16.times do
    data = get_new_image
    purge_later << data
    product = Product.new(name:Faker::Commerce.product_name, price: Faker::Commerce.price(range: 2000.00..10000.0, as_string: false))
    product.image.attach(io: File.open(data.last), filename: data.first , content_type: 'application/jpg')
    2.times do 
        data = get_new_image
        purge_later << data
        product.support_images.attach(io: File.open(data.last), filename: data.first , content_type: 'application/jpg')
    end
    product.category_ids = categories.sample(2).map(&:id)
    product.save!
    puts 'Product Created'

    product_features = []
    3.times do
        product_features << ProductFeature.create!(product: product, name: Faker::Quote.famous_last_words)
    end
    puts 'ProductFeature Created'

    product_identifiers = []

    product_identifiers << ProductIdentifier.create!(product: product, name: "Serial Number", value: Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3).upcase)

    product_identifiers << ProductIdentifier.create!(product: product, name: "ISIN", value: Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3).upcase)

    puts 'ProductIdentifier Created'
end

puts "Deleting tmp files created for images"
purge_later.each do |data|
    File.delete(data.last)
end
