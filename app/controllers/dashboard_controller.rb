class DashboardController < ApplicationController
  def new
  end
  
  def show 
    @user = User.find(params[:id])
    get_group_data
    get_user_data
  end

  def get_group_data
    @group_total = User.sum("points")
    set_g_month_array
  end
  
  def get_user_data
    set_u_month_array
    @user_actions = UserAction.where(user: current_user).order(:created_at)
    @user_prizes = UserPrize.where(user: current_user).order(:created_at) 
  end

  def set_g_month_array  
    @group_months = months 
    @group_months.each do |key, value|
      key = UserAction.where(completion_month: value).sum(:points_earned)
    end  
  end

  def set_u_month_array
    @user_months = months
    @user_months.each do |key, value|
      key = UserAction.where(completion_month: value, user: current_user).sum(:points_earned)
    end 
  end 

  def months
    {  'Jan' => '', 'Feb' => '', 'Mar' => '', 
       'Apr' => '', 'May' => '', 'Jun' => '', 
       'Jul' => '', 'Aug' => '', 'Sep' => '', 
       'Oct' => '', 'Nov' => '', 'Dec' => '' }
  end 
end
