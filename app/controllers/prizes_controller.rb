class PrizesController < ApplicationController
  def index
  end
  def show
  end
  def new
  end
  def create
    @prize = Prize.new
    @prize.create(prize_params)
    @prize.save
  end
  def edit
    @prize = Prize.find(params[:id])
  end
  def update
    @prize = Prize.find(params[:id])
    @prize.update(prize_params)
    @prize.save
  end
  def delete
  end
  def prize_params
    params.require(:prize).permit(:title, :description, :image_path, :point_value, :activity_status, :quantity)
  end
end
