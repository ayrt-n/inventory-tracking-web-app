# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Product.destroy_all
Inventory.destroy_all

joggers = Product.create(sku: 'A2A1N-GBBC', name: 'ARRIVAL WOVEN JOGGERS', price: 38.00)
crop_top = Product.create(sku: 'B2A4F-BBBB', name: 'TRAINING LONG SLEEVE CROP TOP', price: 26.00)
sling_bag = Product.create(sku: 'I1A9U-BBKQ', name: 'ANIMAL PRINT SLING BAG', price: 26.00)

joggers.create_inventory(quantity: 120)
crop_top.create_inventory(quantity: 45)
sling_bag.create_inventory(quantity: 60)