# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

# Let's do this ...

## CATEGORIES

puts "Finding or Creating Categories ..."

cat1 = Category.find_or_create_by! name: 'Apparel'
cat2 = Category.find_or_create_by! name: 'Electronics'
cat3 = Category.find_or_create_by! name: 'Furniture'

## PRODUCTS

puts "Re-creating Products ..."

Product.destroy_all

cat1.products.create!({
  name:  'Men\'s Classy shirt',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel1.jpg'),
  quantity: 10,
  price: 64.99
})

cat1.products.create!({
  name:  'Women\'s Zebra pants',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel2.jpg'),
  quantity: 18,
  price: 124.99
})

cat1.products.create!({
  name:  'Hipster Hat',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel3.jpg'),
  quantity: 4,
  price: 34.49
})

cat1.products.create!({
  name:  'Hipster Socks',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel4.jpg'),
  quantity: 8,
  price: 25.00
})

cat1.products.create!({
  name:  'Russian Spy Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel5.jpg'),
  quantity: 8,
  price: 1_225.00
})

cat2.products.create!({
  name:  'Modern Skateboards',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics1.jpg'),
  quantity: 40,
  price: 164.49
})

cat2.products.create!({
  name:  'Hotdog Slicer',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics2.jpg'),
  quantity: 3,
  price: 26.00
})

cat2.products.create!({
  name:  'World\'s Largest Smartwatch',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics3.jpg'),
  quantity: 32,
  price: 2_026.29
})

cat3.products.create!({
  name:  'Optimal Sleeping Bed',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture1.jpg'),
  quantity: 320,
  price: 3_052.00
})

cat3.products.create!({
  name:  'Electric Chair',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture2.jpg'),
  quantity: 2,
  price: 987.65
})

cat3.products.create!({
  name:  'Red Bookshelf',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture3.jpg'),
  quantity: 0,
  price: 2_483.75
})

## USERS

puts "Re-creating Users ..."

User.destroy_all

User.create!({
  first_name:  'Peter',
  last_name: 'Piper',
  email: 'peter@piper.com',
  password_digest: 'peter'
})

User.create!({
  first_name:  'Tom',
  last_name: 'Thumb',
  email: 'tom@thumb.com',
  password_digest: 'tom'
})

User.create!({
  first_name:  'Jack',
  last_name: 'Horner',
  email: 'jack@horner.com',
  password_digest: 'jack'
})

## REVIEWS

puts "Finding Users ..."

usr1 = User.find_by first_name: 'Peter'
usr2 = User.find_by first_name: 'Tom'
usr3 = User.find_by first_name: 'Jack'


puts "Finding Products ..."

prd1 = Product.find_by name: 'Red Bookshelf'
prd2 = Product.find_by name: 'Optimal Sleeping Bed'
prd3 = Product.find_by name: 'Hotdog Slicer'

puts "Re-creating Reviews ..."

Review.destroy_all

usr1.reviews.create!({
  description: Faker::Hipster.paragraph(5),
  rating: 4,
  product_id: prd1.id,
  created_at: '2018-06-27 14:09:36 +0800'
})

usr1.reviews.create!({
  description: Faker::Hipster.paragraph(5),
  rating: 5,
  product_id: prd2.id,
  created_at: '2018-04-11 14:09:36 +0800'
})

usr2.reviews.create!({
  description: Faker::Hipster.paragraph(6),
  rating: 5,
  product_id: prd1.id,
  created_at: '2018-07-27 14:09:36 +0200'
})

usr2.reviews.create!({
  description: Faker::Hipster.paragraph(6),
  rating: 4,
  product_id: prd3.id,
  created_at: '2018-08-27 14:09:36 +0200'
})

usr3.reviews.create!({
  description: Faker::Hipster.paragraph(7),
  rating: 5,
  product_id: prd3.id,
  created_at: '2017-08-31 14:09:36 UTC'
})

usr3.reviews.create!({
  description: Faker::Hipster.paragraph(7),
  rating: 3,
  product_id: prd2.id,
  created_at: '2016-08-27 14:09:36 UTC'
})

usr3.reviews.create!({
  description: Faker::Hipster.paragraph(7),
  rating: 5,
  product_id: prd1.id,
  created_at: '2017-03-27 23:53:38 UTC'
})

puts "DONE!"
