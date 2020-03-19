# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
shelter1 = Shelter.create!(name: "Larry's Lizards", address: "1331 17th Street", city: 'Denver', state: 'CO', zip: "80202")
shelter2 = Shelter.create!(name: "Ricardos Reptiles", address: "150 Main Street", city: 'Hershey', state: 'PA', zip: "17033")
