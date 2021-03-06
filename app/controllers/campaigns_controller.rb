class CampaignsController < ApplicationController
  
  respond_to :json

  def index
    @campaigns = Campaign.all
    respond_with @campaigns, each_serializer: CampaignSerializer
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
      @campaign.modify_quantity
      redirect_to businesses_path
    else
      flash[:notice] = "Need more tweets in order to make that campaign post"
      redirect_to businesses_path
    end
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def update
    @campaign = Campaign.find(params[:id])
    if @campaign.update_attributes(campaign_params)
    redirect_to businesses_path
    else
      render 'edit'
    end
  end

  def destroy
    Campaign.find(params[:id]).destroy
    redirect_to businesses_path
  end

  private

  def campaign_params
    params.require(:campaign).permit(:name, :status, :avatar, :location, :followers, :business_id, :tweets)
  end

end
