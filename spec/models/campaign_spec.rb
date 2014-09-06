require "spec_helper"
require "rails_helper"


describe "Campaign" do


  it "is valid with a name, business_id, status, location, followers, tweets, and avatar" do
    campaign = FactoryGirl.build(:campaign)
    expect(campaign).to be_valid
  end

  it "is not valid without a name" do
    campaign = FactoryGirl.build(:campaign, name: nil)
    expect(campaign).to be_invalid
  end

  # it "is not valid without business_id" do
  #   campaign = FactoryGirl.build(:campaign, business: nil)
  #   expect(campaign).to be_invalid
  # end

  # it "is invalid without tweets" do
  #   campaign = FactoryGirl.build(:campaign, tweets: nil)
  #   expect(campaign).to be_invalid
  # end

  it "is invalid without a status tweet for posting" do
    campaign = FactoryGirl.build(:campaign, status: nil)
    expect(campaign).to be_invalid
  end

  it "is valid only if status is less than 140 characters" do
    campaign = FactoryGirl.build(:campaign)
    expect(campaign.status.length).to be <= (140)
    expect(campaign.tweets).to eq(50)
  end 

  it "is invalid without a location" do
    campaign = FactoryGirl.build(:campaign, location: nil)
    expect(campaign).to be_invalid
  end

  it "is invalid without a followers parameter" do
    campaign = FactoryGirl.build(:campaign, followers: nil)
    expect(campaign).to be_invalid
  end


  it "should have many Users" do
    relation = Campaign.reflect_on_association(:users)
    relation.macro.should == :has_many
  end

  it "should belong to a Business" do
    relation = Campaign.reflect_on_association(:business)
    relation.macro.should == :belongs_to
  end
end



