class ActivitiesController < ApplicationController
  before_action :get_activity, only: [:show, :edit, :update, :destroy]
  before_action :get_user

  def index
    @activities = Activity.find_each
  end
  def show

  end
  def new
    @activity = Activity.new()

  end
  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      @activities = Activity.find_each
      render 'index'
    else
    end

  end
  def edit
    get_activity
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
  def self
    @self_activities = Activity.where(:strong_type => 'Self').find_each
  end
  def train
    @train_activities = Activity.where(:strong_type => 'Train').find_each

  end
  def responsibility
    @resp_activities = Activity.where(:strong_type => 'Responsibility').find_each

  end
  def opportunities
    @opp_activities = Activity.where(:strong_type => 'Opportunities').find_each

  end
  def numbers
    @num_activities = Activity.where(:strong_type => 'Numbers').find_each

  end
  def goals
    @goals_activities = Activity.where(:strong_type => 'Goals').find_each

  end

  def activity_params
    params.require(:activity).permit(:title, :description, :image_path, :point_value, :activity_status, :strong_type, :wellness_type, :icon_path)
  end

  def get_activity
    @activity = Activity.find(params[:id])
  end
  def get_user
    @user = current_user
  end
end
