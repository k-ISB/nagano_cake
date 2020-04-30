# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
    email: 'test@test.com',
    password: 'password'
 )

 Item.create!(
     genre_id: 1,
     name: "cake",
     description: "美味しいかもしれん",
     non_taxed_price: 300,
     sales_status: 0
 )
 
