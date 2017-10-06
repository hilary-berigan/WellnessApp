class PrizesController < ApplicationController
  def index
    @prizes = Prize.find_each
    @user = current_user
  end
  def show
    @prize = Prize.find(params[:id])

  end
  def new
    @prize = Prize.new
  end
  def create
    @prize = Prize.new(prize_params)
    @prize.save
    redirect_to action: 'show', id: @prize.id
  end
  def edit
    @prize = Prize.find(params[:id])
  end
  def update
    @prize = Prize.find(params[:id])
    @prize.update(prize_params)
    @prize.save
  end
  def destroy
    @prize = Prize.delete(params[:id])
  end
  def prize_params
    params.require(:prize).permit(:title, :description, :image_path, :point_value, :activity_status, :quantity)
  end
end
