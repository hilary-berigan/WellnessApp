class UserActionsController < ApplicationController
  def index
  end 
  def show
  end
  def new
  end 
  def create
    @user_action = UserAction.new
    @user_action.create(user_action_params)
    @user_action.save
  end
  def edit
    @user_action = UserAction.find(params[:id])
  end
  def update
    @user_action = UserAction.find(params[:id])
    @user_action.update(user_action_params)
    @user_action.save
  end
  def delete
  end 
  def user_action_params
    params.require(:action).permit(:user_id, :description, :point_value, :type, :active_status)
  end
end
