# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

10.times do |i|
  Book.create!(
    title: "Book Title #{i+1}",
    author: "Author #{i+1}",
    description: "This is a description for book #{i+1}.",
    price: rand(10.0..100.0).round(2),
    stock: rand(1..100)
  )
end