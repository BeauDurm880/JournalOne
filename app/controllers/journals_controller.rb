class JournalsController < ApplicationController
    before_action :set_journal, only: [:show, :edit, :update, :destroy]
  
    def index
      @entries = Journal.all
  
      # Filter by date range
      if params[:start_date].present? && params[:end_date].present?
        start_date = Date.parse(params[:start_date])
        end_date = Date.parse(params[:end_date])
        @entries = @entries.where(created_at: start_date.beginning_of_day..end_date.end_of_day)
      end
  
      # Filter by rating
      if params[:min_rating].present? && params[:max_rating].present?
        min_rating = params[:min_rating].to_i
        max_rating = params[:max_rating].to_i
        @entries = @entries.where(day_rating: min_rating..max_rating)
      end
  
      # Default sorting by creation date descending
      @entries = @entries.order(created_at: :desc)
    end
  
    def show
      # The @entry instance variable is already set by the before_action
    end
  
    def new
      @entry = Journal.new
    end
  
    def create
      @entry = Journal.new(entry_params)
      if @entry.save
        redirect_to journals_path, notice: 'Journal entry was successfully created.'
      else
        render :new
      end
    end
  
    def edit
      # @entry is already set by the before_action
    end
  
    def update
      if @entry.update(entry_params)
        redirect_to journals_path, notice: 'Journal entry was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @entry.destroy
      redirect_to journals_path, notice: 'Journal entry was successfully deleted.'
    end
  
    private
  
    def set_journal
      @entry = Journal.find_by(id: params[:id])
      if @entry.nil?
        redirect_to journals_path, alert: 'Journal entry not found.'
      end
    end
  
    def entry_params
        params.require(:journal).permit(:name, :journal_info, :day_rating, :trainings_done, :internal_work_done)
      end
  end
  
  
  
