class BusinessesController < ApplicationController
  def index
    if !current_business
      redirect_to root_path
    end
    @businesses = Business.all
  end

  def show
    if !current_business
      redirect_to root_path
    end
    @business = Business.find(params[:id])
  end

  def new
    if !current_business
      redirect_to root_path
    end
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
    if !current_business
      redirect_to root_path
    end
    @business = Business.find(params[:id])
  end

  def update
    if !current_business
      redirect_to root_path
    end
    @business = Business.find(params[:id])
    if @business.update(business_params)
      redirect_to business_path(@business.id)
    else
      render "edit"
    end
  end

  def destroy
    Business.find(params[:id]).campaigns.destroy_all
    Business.find(params[:id]).destroy
    reset_session
    redirect_to root_path
  end

  private

  def business_params
    params.require(:business).permit(:name, :email, :password, :password_confirmation)
  end

end
