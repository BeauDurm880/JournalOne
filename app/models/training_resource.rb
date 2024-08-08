# app/models/training_resource.rb
class TrainingResource < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :job_tags

  before_save :filter_invalid_job_tags

  private

  def filter_invalid_job_tags
    self.job_tag_ids = self.job_tag_ids.reject { |id| id.blank? || id.to_i == 0 }
  end
end






