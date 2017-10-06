class DashboardsController < ApplicationController
  before_action :set_dashboard, only: [:show, :edit, :update, :destroy]

  # GET /dashboards
  # GET /dashboards.json
  def index

    if user_signed_in?
      @user = User.find(current_user.id)
      get_group_data
      get_user_data

    end
  end

  # GET /dashboards/1
  # GET /dashboards/1.json

  def show


  end

  def get_group_data
    @group_total = UserActivity.sum(:points_earned)
    set_g_month_array
  end

  def get_user_data
    set_u_month_array
    @user_actions = UserActivity.where(user: current_user).order(:created_at)
    @user_prizes = UserPrize.where(user: current_user).order(:created_at)
    @act_points = UserActivity.where(user: current_user).sum(:points_earned).to_i ||= 0
    @prize_points = UserPrize.where(user: current_user).sum(:points_earned).to_i ||= 0
    @total_points = @act_points - @prize_points
  end

  def set_g_month_array
    @group_months = months
    @group_months.each do |key, value|
      @group_months[key] = UserActivity.where("cast(strftime('%m', created_at) as int) = ?", value).sum(:points_earned)

    end
  end

  def set_u_month_array
    @user_months = months
    @user_months.each do |key, value|
      key = UserActivity.where(completion_month: value, user: current_user).sum(:points_earned)
    end
  end

  def months
    {  'Jan' => '01', 'Feb' => '05', 'Mar' => '09',
       'Apr' => '02', 'May' => '06', 'Jun' => '10',
       'Jul' => '03', 'Aug' => '07', 'Sep' => '11',
       'Oct' => '04', 'Nov' => '08', 'Dec' => '12' }
  end

  # GET /dashboards/new
  def new
    @dashboard = Dashboard.new
  end

  # GET /dashboards/1/edit
  def edit
  end

  # POST /dashboards
  # POST /dashboards.json
  def create
    @dashboard = Dashboard.new(dashboard_params)

    respond_to do |format|
      if @dashboard.save
        format.html { redirect_to @dashboard, notice: 'Dashboard was successfully created.' }
        format.json { render :show, status: :created, location: @dashboard }
      else
        format.html { render :new }
        format.json { render json: @dashboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dashboards/1
  # PATCH/PUT /dashboards/1.json
  def update
    respond_to do |format|
      if @dashboard.update(dashboard_params)
        format.html { redirect_to @dashboard, notice: 'Dashboard was successfully updated.' }
        format.json { render :show, status: :ok, location: @dashboard }
      else
        format.html { render :edit }
        format.json { render json: @dashboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dashboards/1
  # DELETE /dashboards/1.json
  def destroy
    @dashboard.destroy
    respond_to do |format|
      format.html { redirect_to dashboards_url, notice: 'Dashboard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dashboard
      @dashboard = Dashboard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dashboard_params
      params.fetch(:dashboard, {})
    end
end
