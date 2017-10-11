class ActivitiesController < ApplicationController
  before_action :get_activity, only: [:show, :edit, :update, :destroy]
  before_action :get_user

  def index
    @activities = Activity.find_each

    respond_with(@activities,@user_date)
  end
  def show

  end
  def new
    @activity = Activity.new()

  end
  def create
    @activity = Activity.new(activity_params)
    if @activity.save
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
  def nutrition
    @nutrition_activities = Activity.where(:wellness_type => 'Nutrition').all
    respond_with(@nutrition_activities)
  end
  def fitness
    @fitness_activities = Activity.where(:wellness_type => 'Fitness').all
    respond_with(@fitness_activities)
  end
  def overall_health
    @overall_activities = Activity.where(:wellness_type => 'Overall').all
    respond_with(@overall_activities)
  end

  def wva_event
    @wva_events = Activity.where(:wellness_type => 'WVA Event').all
    respond_with(@wva_events)
  end

  def activity_params
    params.require(:activity).permit(:title, :description, :image_path, :point_value, :activity_status, :strong_type, :wellness_type, :icon_path, :image_path)
  end

  def get_activity
    @activity = Activity.find(params[:id])
  end
  def get_user
    @user = current_user
  end
end
