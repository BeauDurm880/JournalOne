
class TrainingResourcesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_training_resource, only: [:show, :edit, :update, :destroy]
  
    def index
      @training_resources = TrainingResource.all
      @training_resource = TrainingResource.new
    end
  
    def show
    end
  
    def new
      @training_resource = TrainingResource.new
    end
  
    def create
      clean_job_tag_ids
      @training_resource = current_user.training_resources.build(training_resource_params)
  
      if @training_resource.save
        redirect_to training_resources_path, notice: 'Training resource was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      clean_job_tag_ids
      if @training_resource.update(training_resource_params)
        redirect_to training_resources_path, notice: 'Training resource was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @training_resource.destroy
      redirect_to training_resources_path, notice: 'Training resource was successfully deleted.'
    end
  
    private
  
    def set_training_resource
      @training_resource = TrainingResource.find(params[:id])
    end
  
    def training_resource_params
      params.require(:training_resource).permit(:title, :link, :commentary, :rating, job_tag_ids: [])
    end
  
    def clean_job_tag_ids
      if params[:training_resource][:job_tag_ids].present?
        params[:training_resource][:job_tag_ids].reject! { |id| id.blank? || id.to_i == 0 }
      end
    end
  end
  
  
  
  
  
  
  
  
  
  
  
  
  