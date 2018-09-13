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
  quantity: 0,
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

cat1.products.create!({
  name:  'Human Feet Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel6.jpg'),
  quantity: 82,
  price: 224.50
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
  quantity: 23,
  price: 2_483.75
})

# REVIEWS
Review.create!({
  product_id: 1,
  user_id: 1,
  description: 'This is good',
  rating: 4
})

Review.create!({
  product_id: 2,
  user_id: 1,
  description: 'This is bad',
  rating: 4
})

Review.create!({
  product_id: 3,
  user_id: 1,
  description: 'This is okay',
  rating: 1
})

Review.create!({
  product_id: 4,
  user_id: 1,
  description: 'This is terrible',
  rating: 2
})

Review.create!({
  product_id: 5,
  user_id: 1,
  description: 'This is a description',
  rating: 3
})

Review.create!({
  product_id: 6,
  user_id: 1,
  description: 'This is a description',
  rating: 3
})

# USERS

User.create!({
  first_name: 'Test',
  last_name: 'McTest',
  email: 'test1@gmail.com',
  password_digest: '$2a$10$p9ZCs39bB8gf.mlWyWO8jua5drroNCRfvk8meX.vjVUlczYuY1zBG'
})

User.create!({
  first_name: 'Test2',
  last_name: 'McTest2',
  email: 'test2@gmail.com',
  password_digest: '$2a$10$p9ZCs39bB8gf.mlWyWO8jua5drroNCRfvk8meX.vjVUlczYuY1zBG'
})

User.create!({
  first_name: 'Test3',
  last_name: 'McTest3',
  email: 'test3@gmail.com',
  password_digest: '$2a$10$p9ZCs39bB8gf.mlWyWO8jua5drroNCRfvk8meX.vjVUlczYuY1zBG'
})

User.create!({
  first_name: 'Test4',
  last_name: 'McTest4',
  email: 'test4@gmail.com',
  password_digest: '$2a$10$p9ZCs39bB8gf.mlWyWO8jua5drroNCRfvk8meX.vjVUlczYuY1zBG'
})

puts "DONE!"
