class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]
  before_filter :get_current_user_id

  # GET /goals
  # GET /goals.json
  def index
    @goals = Goal.all.where(user_id: current_user[:id])
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
  end

  # GET /goals/new
  def new
    @goal = Goal.new
  end

  # GET /goals/1/edit
  def edit
  end

  # POST /goals
  # POST /goals.json
  def create
    @goal = Goal.new(goal_params)

    respond_to do |format|
      if @goal.save
        flash[:success] = 'Goal was successfully added.'
        format.html { redirect_to '/user_data'}
        format.json { render action: 'show', status: :created, location: @goal }
      else
        format.html { render action: 'new' }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goals/1
  # PATCH/PUT /goals/1.json
  def update
    respond_to do |format|
      if @goal.update(goal_params)
        flash[:success] = 'Goal was successfully updated.'
        format.html { redirect_to '/user_data'}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal.destroy
    respond_to do |format|
      format.html { redirect_to '/user_data' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_params
      params.require(:goal).permit(:user_id, :retail_hrs_per_ro, :elr_retail, :retail_ro_count, :tech_hrs_per_day, :salaries_as_percent_gross, :other_as_percent_gross)
    end

  protected
    def get_current_user_id
      remember_token = User.encrypt(cookies[:remember_token])
      if !User.find_by(remember_token: remember_token).nil?
        
        @current_user = User.find_by(remember_token: remember_token)
        @user_id = @current_user[:id]
      else
        flash[:danger] = "Please log in"
        redirect_to signin_path
      end
    end
end
