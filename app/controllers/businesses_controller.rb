class BusinessesController < ApplicationController

    before_action :set_business, only: [:show,:edit,:update,:destroy]
    before_action :control_access, only: [:show,:edit,:update,:destroy]

  def index
    @businesses = Business.all
  end

  def show
  end

  def new
    @business = Business.new
    
  end

  def create
    @business = Business.new(business_params)
    if @business.save
      @business = Business.where(name: params[:business][:name]).first
      session[:business_id] = @business.id.to_s
      redirect_to business_path(@business.id)
    else
      flash[:notice] = "Password must be at least 6 characters and match the password confirmation"
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    if @business.update(business_params)
      redirect_to business_path(@business.id)
    else
      render "edit"
    end
  end

  def destroy
    @business.campaigns.destroy_all
    @business.destroy
    reset_session
    redirect_to root_path
  end

  private

  def control_access
    if @business.id.to_s != current_business.to_s
      redirect_to root_path
    end
  end

  def set_business
    @business = Business.find(params[:id])
  end

  def business_params
    params.require(:business).permit(:name, :email, :password, :password_confirmation)
  end

end
