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
raise "Development seeds only (for now)!" unless Rails.env.development?

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
  quantity: 0,
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


puts "PRODUCTS DONE!"

puts "Re-creating USERS ..."

User.destroy_all

User.create!({
  firstname: "Stevie",
  lastname: "Wonder",
  email: "1@1",
  password: "12"
  })

User.create!({
  firstname: "Mae",
  lastname: "West",
  email: "1@1",
  password: "12"
  })

User.create!({
  firstname: "Richard",
  lastname: "Gere",
  email: "3@1",
  password: "12"
  })

puts "USERS DONE!"


## REVIEWS

puts "Re-creating Reviews ..."

Review.destroy_all

Review.create!({
  user_id: 1,
  product_id: 2,
  description: "I love this fabric, I think it's tres chic, and flattering as can be.",
  rating: 5
})

Review.create!({
  user_id: 2,
  product_id: 9,
  description: "Looks okay on my wrist, but would look better on my floor HEY! Wowwweeeeeokayokayokay who says, ya dirty rat!.",
  rating: 2
})

Review.create!({
  user_id: 1,
  product_id: 11,
  description: "This bed is sooo optimal!! I luv it!! Wish I had 1 for all my guests and all the friends in the world.",
  rating: 5
})

Review.create!({
  user_id: 3,
  product_id: 10,
  description: "OMG I am ObSeSsEd with dis bed!!1! eeeek!!",
  rating: 5
})

Review.create!({
  user_id: 2,
  product_id: 11,
  description: "This chair hurt my butt, but I like it hard ohhhhhwowwwwkay! Would prefer the Iron Throne. xo",
  rating: 1
})

Review.create!({
  user_id: 2,
  product_id: 12,
  description: "I love this bookshelf it's so red. I think...",
  rating: 4.5
})

Review.create!({
  user_id: 3,
  product_id: 12,
  description: "Not sure why this bed is so uncomfy. Also what are boox??",
  rating: 1.5
})

puts "REVIEWS DONE!"

