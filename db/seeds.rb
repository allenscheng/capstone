# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


deal = DailyDeal.create(user_id: 1, name:"hat", description:"Black Chicago White Sox fitted", price:6.00, product_link:"http//:hat.com")
deal = DailyDeal.create(user_id: 2, name:"laptop", description:"13 inch Macbook pro", price:1000.00, product_link:"http//:laptop.com")

wish_list = WishList.create(user_id:1, product_link:"http//:sofa.com")
wish_list = WishList.create(user_id:2, product_link:"http//:lamp.com")

user = User.create(first_name:"user", last_name:"user", email:"user@email.com", password:"password")
user = User.create(first_name:"allen", last_name:"cheng", email:"allen@email.com", password:"password")