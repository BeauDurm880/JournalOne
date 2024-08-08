# app/models/job_tag.rb
class JobTag < ApplicationRecord
    has_and_belongs_to_many :training_resources
  end
  