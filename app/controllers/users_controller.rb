class UsersController < ApplicationController
  before_action :get_user, only: [:show, :edit, :update, :delete, :add_user_prizes, :add_user_activities]

  def index
  end
  def show

  end
  def new
  end
  def show_user_prizes
  end
  def show_user_activities
  end
  def create
  end
  def edit
  end
  def add_user_prizes
    @prizes = Prize.find_each
    @user.current_proc = "_add_user_prizes"
  end
  def add_user_activities
    @activities = Activity.find_each
    @user.current_proc = "_add_user_activities"
    redirect_to :edit
  end
  def update
    @user.update(user_params)
    if params[:user_prize_attributes][:prize_id] != ""
      make_user_prize
      redirect_to :show_user_prizes
    elsif params[:user_activity_attributes][:activity_id] != ""
      make_user_activity

    end
  end
  def delete
  end


  def user_params
    params.require(:user).permit(:name, :age_group, user_activity_attributes: [:activity_id, :image_path],
                                      user_prize_attributes: [:prize_id])

  end

  def get_user
    @user = User.find(params[:id])
  end

  def make_user_activity
    activity = Activity.find(id: params[:user_activity_attributes][:activity_id])
    point_val = activity.point_value
    @user.update_points(point_val)
  end
  def make_user_prize
    prize = Prize.find(params[:user_prize_attributes][:prize_id])
    point_val = prize.point_value * -1
    @user.update_points(point_val)
  end
  def update_user_points(points)
    @user.points = @user.points + points
    @user.save
  end
  def get_current_process

  end
end
