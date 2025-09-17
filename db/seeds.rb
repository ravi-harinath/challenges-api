# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


require 'faker'

puts "Creating fake challenges..."

30.times do
  start_date = Faker::Date.between(from: 2.months.ago, to: Date.today)
  end_date = Faker::Date.between(from: start_date, to: 2.months.from_now)

  Challenge.create!(
    title: Faker::Lorem.sentence(word_count: 3),
    description: Faker::Lorem.paragraph(sentence_count: 2),
    start_date: start_date,
    end_date: end_date
  )
end

puts "30 fake challenges created successfully!"