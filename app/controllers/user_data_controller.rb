class UserDataController < ApplicationController
  before_action :set_user_datum, only: [:show, :edit, :update, :destroy]
  before_filter :get_current_user_id
  # GET /user_data
  # GET /user_data.json
  def index
    @user_data = UserDatum.all.where(user_id: current_user[:id])
  end

  # GET /user_data/1
  # GET /user_data/1.json
  def show

  end

  # GET /user_data/new
  def new
    @user_datum = UserDatum.new
  end

  # GET /user_data/1/edit
  def edit
    
  end

  # POST /user_data
  # POST /user_data.json
  def create
    @user_datum = UserDatum.new(user_datum_params)

    respond_to do |format|
      if @user_datum.save
        flash.now[:success] = 'User datum was successfully created.'
        format.html { redirect_to @user_datum}
        format.json { render action: 'show', status: :created, location: @user_datum }
      else
        format.html { render action: 'new' }
        format.json { render json: @user_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_data/1
  # PATCH/PUT /user_data/1.json
  def update
    respond_to do |format|
      if @user_datum.update(user_datum_params)
        flash.now[:success] = 'User datum was successfully updated.'
        format.html { redirect_to '/user_data'}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_data/1
  # DELETE /user_data/1.json
  def destroy
    @user_datum.destroy
    respond_to do |format|
      format.html { redirect_to user_data_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_datum
      @user_datum = UserDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_datum_params
      params.require(:user_datum).permit(:user_id, :month, :total_hours_sold, :retail_hours_sold, :total_labour_sales, :retail_labour_sales, :work_days_per_tech, :number_of_techs, :retail_ro_count, :total_gross, :total_variable_expense, :total_salaries)
    end

  
  protected
    def get_current_user_id
      remember_token = User.encrypt(cookies[:remember_token])
      if !User.find_by(remember_token: remember_token).nil?
        
        @current_user = User.find_by(remember_token: remember_token)
        @user_id = @current_user[:id]
      else
        flash[:danger] = "User Data controller says you aren't signed in"
        redirect_to signin_path
      end
      
    end
end
