class ActivitiesController < ApplicationController
  before_action :get_activity, only: [:show, :edit, :update, :destroy]
  def index
    @user = Thread.current[:current_user]
    @activities = Activity.find_each
    respond_with(@activities)
  end
  def show

  end
  def new
    @activity = Activity.new

  end
  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      render 'index'
    else
    end

  end
  def edit
    @activity = Activity.find(params[:id])
    puts @activity
    $stdout.flush
  end
  def update
    @activity.update(activity_params)
    @activity.save
    render 'show'
  end
  def destroy
    @activity.destroy
    flash[:success] = "Activity Deleted"
    redirect_to activities_url
  end



  def activity_params
    params.require(:activity).permit(:title, :description, :image_path, :point_value, :activity_status, :strong_type)
  end
  def get_activity
    @activity = Activity.find(params[:id])
  end
end
