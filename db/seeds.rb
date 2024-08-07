# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# db/seeds.rb

require 'faker'

# Get the current month and year
current_month = Date.today.month
current_year = Date.today.year

# Get the number of days in the current month
days_in_month = Time.days_in_month(current_month, current_year)

# Create a journal entry for each day of the current month
(1..days_in_month).each do |day|
  date = Date.new(current_year, current_month, day)

  # Check if an entry for this date already exists to prevent duplicates
  unless Journal.exists?(created_at: date.beginning_of_day..date.end_of_day)
    Journal.create!(
      name: Faker::Lorem.sentence(word_count: 3),     # Random title
      created_at: date,                               # Use 'created_at' for the entry date
      updated_at: date,                               # Ensure 'updated_at' is also set
      journal_info: Faker::Lorem.paragraph,           # Use 'journal_info' for the description
      day_rating: rand(1..10),                        # Random happiness rating from 1 to 10
      trainings_done: Faker::Lorem.words(number: 3).join(', '),
      internal_work_done: Faker::Lorem.sentence(word_count: 5)
    )
  end
end

puts "Added journal entries for each day of #{Date::MONTHNAMES[current_month]} #{current_year} where missing."
