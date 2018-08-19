# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "admin",password: "admin123")
Product.create(title: "Metal Gear Solid", description:"metal gear...", image_url: "mgs.jpg", price: 20)
Product.create(title: "Street Fighter V", description:"juego de luchas capcom...", image_url: "sfv.jpg", price: 10)
Product.create(title: "The king of Fighters XIII", description:"juego de luchas snk...", image_url: "kof_xiii.jpg", price: 20)

