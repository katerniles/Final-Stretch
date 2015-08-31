# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
	product = Product.create([{ name: 'Tree' }, { description: 'Oak' }, { image_url: '/images/oak.jpg' }, { colour: 'green' }])
	User.create first_name: "Kate", last_name:"Russell",email:"krussellnd@gmail.com", admin:true, password:"password", password_confirmation: "password"
