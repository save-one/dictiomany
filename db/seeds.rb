# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


 25.times do |n|
 	diction = Diction.create(name: "金融#{n}", category_parent: "金融", category: "金融", user_id: 1, public_flg: true)
 	27.times do |w|
		word = Word.create(name: "金融単語#{n}-#{w}", kana: "キンユウタンゴ#{n}-#{w}", category_parent: "金融", category: "金融", diction_id: diction.id)
		2.times do |m|
			meaning = Meaning.create(content: "金融意味#{n}-#{w}-#{m}", word_name: "金融単語#{n}-#{w}", word_kana: "キンユウタンゴ#{n}-#{w}", word_category_parent: "金融", word_category: "金融", word_id: word.id)
		end
	end
 end

 25.times do |n|
 	diction = Diction.create(name: "建設・不動産#{n}", category_parent: "建設・不動産", category: "建設", user_id: 1, public_flg: true)
 	27.times do |w|
		word = Word.create(name: "建設単語#{n}-#{w}", kana: "ケンセツタンゴ#{n}-#{w}", category_parent: "建設・不動産", category: "建設", diction_id: diction.id)
		2.times do |m|
			meaning = Meaning.create(content: "建設意味#{n}-#{w}-#{m}", word_name: "建設単語#{n}-#{w}", word_kana: "ケンセツタンゴ#{n}-#{w}", word_category_parent: "建設・不動産", word_category: "建設", word_id: word.id)
		end
	end
 end

 25.times do |n|
 	Contact.create(title: "お問い合わせ#{n}", content: "お問い合わせ#{n}", user_id: 1)
 end

