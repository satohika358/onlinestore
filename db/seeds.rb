# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Item.delete_all
# . . .
Item.create!(name: 'Wind', description: 'Basic Wind Magic.', price: 400)
Item.create!(name: 'Fire', description: 'Basic Fire Magic.', price: 700)
Item.create!(name: 'Ruin', description: 'Dark Mage only. Basic Dark Magic.', price: 600)
Item.create!(name: 'Thunder', description: 'Basic Thunder Magic.', price: 1000)
Item.create!(name: 'Nosferatu', description: 'Dark Mage only. Absorbs HP.', price: 1200)