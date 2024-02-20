# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Seeding data..."

# Find or create a user
user = User.find_or_create_by!(email: 'test@example.com') do |u|
  u.password = 'password123'
  u.password_confirmation = 'password123'
end

5.times do |i|
  Listing.create!(
    title: "Charming Place ##{i + 1}",
    description: "A detailed description of what makes place ##{i + 1} charming.",
    owner_id: user.id # Ensure this matches the foreign key in your Listing model
  )
end

puts "Seeded #{User.count} users and #{Listing.count} listings."
