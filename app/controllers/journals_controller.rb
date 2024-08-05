class JournalsController < ApplicationController
    before_action :set_journal, only: [:show, :edit, :update, :destroy]
  
    def index
      @entries = Journal.all
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
      @entry = Journal.find(params[:id])
    end
  
    def entry_params
      params.require(:journal).permit(:name, :journal_info)
    end
  end
  
  
  
