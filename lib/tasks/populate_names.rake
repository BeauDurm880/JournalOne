# lib/tasks/populate_names.rake
namespace :db do
    desc "Populate existing users with fake names"
    task populate_names: :environment do
      User.find_each do |user|
        user.update(name: Faker::Name.name)
      end
    end
  end
  