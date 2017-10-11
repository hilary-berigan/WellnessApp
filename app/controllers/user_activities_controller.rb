class UserActivitiesController < ApplicationController
  before_action :get_user_activity, only: [:show, :edit, :update, :delete]
  before_action :get_user


  def index
    ws = Date.today.at_beginning_of_week
    sun = ws - 1
    mon = sun + 1
    tue = mon + 1
    wed = tue + 1
    thu = wed + 1
    fri = thu + 1
    sat = fri + 1

    @sun_activities = UserActivity.where("completion_date = ? AND user_id = ?", sun, @user).joins(:activity).order('activities.wellness_type')
    @mon_activities = UserActivity.where("completion_date = ? AND user_id = ?", mon, @user).joins(:activity).order('activities.wellness_type')
    @tue_activities = UserActivity.where("completion_date = ? AND user_id = ?", tue, @user).joins(:activity).order('activities.wellness_type')
    @wed_activities = UserActivity.where("completion_date = ? AND user_id = ?", wed, @user).joins(:activity).order('activities.wellness_type')
    @thu_activities = UserActivity.where("completion_date = ? AND user_id = ?", thu, @user).joins(:activity).order('activities.wellness_type')
    @fri_activities = UserActivity.where("completion_date = ? AND user_id = ?", fri, @user).joins(:activity).order('activities.wellness_type')
    @sat_activities = UserActivity.where("completion_date = ? AND user_id = ?", sat, @user).joins(:activity).order('activities.wellness_type')

  end

  def show
  end

  def new
    @activity = Activity.find(params[:activity_id])
    @user_activity = UserActivity.new(user: @user, activity: @activity)

  end

  def create
    @activity = Activity.find(params[:activity_id])
    @user_activity = UserActivity.new(user_activity_params)
    @user_activity.user = @user

    if @user_activity.save
      redirect_to :action => 'show', id: @user_activity.id, user_id: @user.id
    else
      redirect_to :action => 'index', user_id: @user.id
    end
  end

  def edit
  end

  def update
    @user_activity.update(user_activity_params)
    @user_activity.save
  end
  def delete
  end

  def get_user
    user_id = params[:user_id] || current_user.id
    @user =  User.find(user_id)
  end

  def user_activity_params
    params.require(:user_activity).permit(:user_id, :description, :activity_id, :image_path, :completion_date)
  end


  def get_user_activity
    @user_activity = UserActivity.find(params[:id])

  end
end
