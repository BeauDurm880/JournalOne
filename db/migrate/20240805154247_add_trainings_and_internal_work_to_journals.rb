class AddTrainingsAndInternalWorkToJournals < ActiveRecord::Migration[6.1]
  def change
    add_column :journals, :trainings_done, :string
    add_column :journals, :internal_work_done, :string
  end
end
