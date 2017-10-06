class UserActivitiesController < ApplicationController
  before_action :get_user_activity, only: [:show, :edit, :update, :delete]

  def index
    @user_activities = UserActivity.where(user_id: params[:id])
    @recent_activities = @user_activities.where('created_at > ?', (Date.today - 1.month) ).all
  end
  def show
  end
  def new
    @activity = Activity.find(params[:activity])
    @user = current_user #maybe current_user?
  end
  def create
    @user = User.find(params[:id])
    @activity = Activity.find(params[:activity])
    @user_activity = @user.user_activities.build(:activity_id=>params[:activity], :user => @user, :points_earned => @activity.point_value)
    if @user_activity.save
      redirect_to :action => 'show', id: @user_activity.id
    else
      redirect_to :index
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
  def user_activity_params
    params.require(:user_activity).permit(:user_id, :description, :activity_id, :image_path)
  end

  def get_user_activity
    @user_activity = UserActivity.find(params[:id])
  end
end
