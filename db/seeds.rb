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

 Genre.create!(
  [
    {
      name: "ケーキ",
      status: true,
    },
    {
      name: "ジュース",
      status: true
    }
  ]
)
Item.create!(
  [
    {
      genre_id: 1,
      name: "ショートケーキ",
      description: "とっても甘い！\n一つで十分。",
      non_taxed_price: 300,
      sales_status: 0,
      
    },
    {
      genre_id: 1,
      name: "チョコケーキ",
      description: "甘すぎる！\n体によくない。",
      non_taxed_price: 300,
      sales_status: 0,
    },
    {
      genre_id: 1,
      name: "チーズケーキ",
      description: "美味しそうな色合い！\nあんまり味がしない.",
      non_taxed_price: 300,
      sales_status: 0,
    },
    {
      genre_id: 1,
      name: "誕生日ケーキ",
      description: "バースデーパーティーにどうぞ！\nなんと食べれるんです。",
      non_taxed_price: 300,
      sales_status: 0,
    }
  ]
 )
 
