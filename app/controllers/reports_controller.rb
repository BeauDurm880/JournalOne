class ReportsController < ApplicationController
  before_action :set_date_range, only: [:day_rating, :day_rating_pdf]

  def day_rating
    @day_rating_data = load_day_rating_data
  end

  def day_rating_pdf
    @day_rating_data = load_day_rating_data
    @journals = Journal.where(created_at: @start_date..@end_date)

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "day_rating_report",
               template: "reports/day_rating_pdf.html.erb",
               layout: 'pdf.html',
               page_size: 'A4'
      end
    end
  end

  private

  def load_day_rating_data
    Journal.where(created_at: @start_date..@end_date)
           .group("DATE(created_at)", :id)  # Group by date and id
           .order("DATE(created_at) ASC")   # Order by date in ascending order
           .pluck("DATE(created_at)", "AVG(day_rating)", "id")
  end

  def set_date_range
    @start_date = params[:start_date].present? ? Date.parse(params[:start_date]) : 1.month.ago.to_date
    @end_date = params[:end_date].present? ? Date.parse(params[:end_date]) : Date.today

    # Ensure that start_date is not after end_date
    if @start_date > @end_date
      flash[:alert] = "Start date cannot be after end date."
      @start_date = 1.month.ago.to_date
      @end_date = Date.today
    end
  end
end




