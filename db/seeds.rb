# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Inventory.destroy_all

Inventory.create(sku: 'A2A1N-GBBC', name: 'ARRIVAL WOVEN JOGGERS', description: 'Blank for now', stock: 120)
Inventory.create(sku: 'B2A4F-BBBB', name: 'TRAINING LONG SLEEVE CROP TOP', description: 'Blank for now', stock: 45)
Inventory.create(sku: 'I1A9U-BBKQ', name: 'ANIMAL PRINT SLING BAG', description: 'Blank for now', stock: 60)