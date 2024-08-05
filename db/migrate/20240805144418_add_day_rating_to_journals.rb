class AddDayRatingToJournals < ActiveRecord::Migration[6.1]
  def change
    add_column :journals, :day_rating, :integer
  end
end
