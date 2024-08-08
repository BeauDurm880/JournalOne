class CreateJobTagsTrainingResourcesJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_table :job_tags_training_resources, id: false do |t|
      t.belongs_to :job_tag
      t.belongs_to :training_resource
    end
  end
end



