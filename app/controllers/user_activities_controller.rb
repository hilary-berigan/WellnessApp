class UserActivitiesController < ApplicationController
  before_action :get_user_activity, only: [:show, :edit, :update, :delete]

  def index
  end
  def show
  end
  def new
    @activity = Activiy.find(params[:activity])
    @user = current_user #maybe current_user?
  end
  def create
    @user = User.find(params[:id])
    @user_activity = @user.user_activity_build(params[:activity])
    @user_activity.save
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
