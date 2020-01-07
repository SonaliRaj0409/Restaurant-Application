User.create!(name:  "Admin",
             email: "foodorder@gmail.com",
             password:              "foodorder",
             password_confirmation: "foodorder",
             admin: true)
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(1)
50.times do
  name = Faker::Lorem.sentence(5)
  users.each { |user| user.restaurants.create!(name: name) }
end
restaurants = Restaurant.order(:created_at).take(1)
1.times do
  name = Faker::Lorem.sentence(5)
  cost = 110
  restaurants.each { |restaurants| restaurants.menus.create!(name: name, price: price) }
end