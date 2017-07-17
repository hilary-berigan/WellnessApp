class ActionsController < ApplicationController
  def index
  end 
  def show
  end
  def new
  end 
  def create
    @action = Action.new
    @action.create(action_params)
    @action.save
  end
  def edit
    @action = Action.find(params[:id])
  end
  def update
    @action = Action.find(params[:id])
    @action.update(action_params)
    @action.save
  end
  def delete
  end 
  def action_params
    params.require(:action).permit(:id, :title, :description, :point_value, :type, :active_status)
  end
end
