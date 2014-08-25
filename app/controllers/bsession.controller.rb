class BsessionsController < ApplicationController
  def new
    # Present an empty login form
    @business = Business.new
  end

  def create
    b = Business.where(name: params[:business][:name]).first
    if b && b.authenticate(params[:business][:name])
      bsession[:business_id] = b.id.to_s
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