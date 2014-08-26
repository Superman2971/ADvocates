class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  def new
    @campaign = Campaign.new
    @business = Business.find(session[:business_id])
  end

  def create
    @campaign = Campaign.new(campaign_params)
    if @campaign.save
      redirect_to campaigns_path
    else
      render 'new'
    end
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def update
    @campaign = Campaign.find(params[:id])
    if @campaign.update_attributes(campaign_params)
      redirect_to campaign_path
    else
      render 'edit'
    end
  end

  def destroy
    Campaign.find(params[:id]).destroy
    redirect_to campaigns_path
  end

  private

  def campaign_params
    params.require(:campaign).permit(:name, :business_id)
  end

end
