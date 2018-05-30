# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


 25.times do |n|
 	Diction.create(name: "金融#{n}", category_parent: "金融", category: "金融", user_id: 1, public_flg: true)
 end

 25.times do |n|
 	Diction.create(name: "建設・不動産#{n}", category_parent: "建設・不動産", category: "建設", user_id: 1, public_flg: true)
 end

 25.times do |n|
 	Contact.create(title: "お問い合わせ#{n}", content: "お問い合わせ#{n}", user_id: 1)
 end

