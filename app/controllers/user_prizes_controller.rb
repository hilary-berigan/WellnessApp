class UserPrizesController < ApplicationController
  before_action :get_user_prize, only: [:show, :edit, :update, :delete]

  def index
    @user_prizes = UserPrize.where(user_id: current_user)
    @recent_prizes = @user_prizes.where('created_at > ?', (Date.today - 1.month) ).all

  end
  def show
  end
  
  def new
    @prize = Prize.find(params[:prize])
    @user = current_user #maybe current_user?
  end
  def create
    @user = User.find(params[:id])
    @user_prize = @user.user_prizes.build(:prize_id=>params[:prize], :user => @user)
    if @user_prize.save
      redirect_to :action => 'show', id: @user_prize.id
    else
      redirect_to :index
    end
  end
  def edit
  end
  def update
    @user_prize.update(user_prize_params)
    @user_prize.save
  end
  def delete
  end
  def user_prize_params
    params.require(:user_prize).permit(:user_id, :description, :prize_id, :image_path)
  end

  def get_user_prize
    @user_prize = UserPrize.find(params[:id])
  end

end
