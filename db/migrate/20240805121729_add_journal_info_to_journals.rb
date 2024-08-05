class AddJournalInfoToJournals < ActiveRecord::Migration[6.1]
  def change
    add_column :journals, :journal_info, :string
  end
end
