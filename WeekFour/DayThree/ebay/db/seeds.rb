# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name:"David",email:"david@example.com",username:"david",password:"11234")
User.create(name:"Miguel",email:"miguel@example.com",username:"miguel",password:"11234")
User.create(name:"Flo",email:"flo@example.com",username:"flo",password:"11234")
User.create(name:"Soy",email:"soy@example.com",username:"soy",password:"11234")
