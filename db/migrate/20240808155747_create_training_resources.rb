class CreateTrainingResources < ActiveRecord::Migration[6.1]
  def change
    create_table :training_resources do |t|
      t.string :title
      t.string :link
      t.text :commentary
      t.integer :rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
