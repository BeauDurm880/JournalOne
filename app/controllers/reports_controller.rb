class ReportsController < ApplicationController
  def day_rating
    @day_rating_data = Journal.where(created_at: 1.month.ago..Time.current)
                              .group_by_day(:created_at)
                              .average(:day_rating)
  end
end

