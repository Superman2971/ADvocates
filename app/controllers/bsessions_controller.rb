class BsessionsController < ApplicationController
  def new
    # Present an empty login form
    @business = Business.new
  end

  def create
    @business = Business.where(name: params[:business][:name]).first
    if @business && @business.authenticate(params[:business][:password])
      bsession[:business_id] = @business.id.to_s
      redirect_to business_path
    else
      redirect_to root_path
    end
  end

  def destroy
    reset_bsession
    redirect_to root_path
  end

end