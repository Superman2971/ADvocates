require "spec_helper"
require "rails_helper"

describe "Business Model" do
  before do
    @business = Business.create!(name:"Test",email:"Test@gmail.com",password:"123",tweets:0)
    @no_name = Business.new(email:"Test@gmail.com",password:"123",tweets:0)
    @no_email = Business.new(name:"Test",password:"123",tweets:0)
    @no_password = Business.new(name:"Test",email:"Test@gmail.com",tweets:0)
  end
  
  it "should all me to create a new business" do
    expect(@business).to be_valid
  end

  it "is invalid without a name" do
    expect(@no_name).to be_invalid
  end
  
  it "should include an email" do
    expect(@no_email).to be_invalid
  end
  
  it "should be able to buy tweets" do
    expect(@no_password).to be_invalid
  end
end

describe "User Model" do
  before do
    @user = User.create!(name:"Test", screen_name:"TesterGuy", uid:1)
    @new_user = User.new(name:"Test", screen_name:"TesterGuy", uid:1)
    @no_uid = User.new(name:"Test", screen_name:"TesterGuy")
    @no_screen_name = User.new(name:"Test", uid:1)
  end

  it "should allow me to create a new user" do
    expect(@user).to be_valid
  end

  it "is invalid without a uid and screen_name from their Twitter account" do
    expect(@new_user).to be_valid
    expect(@no_uid).to be_invalid
    expect(@no_screen_name).to be_invalid
  end
end

describe "Campaigns Model" do
  before do
    @campaign = Campaign.create!(name:"Test",business_id:1,status:"Testing")
    @no_info = Campaign.new()
    @no_name = Campaign.new(business_id:1,status:"Testing")
    @no_status = Campaign.new(name:"Test",business_id:1)
    @no_business_id = Campaign.new(name:"Test",status:"Testing")
    @long_tweet = Campaign.new(name:"Test",business_id:1,status:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus. Too Long.")
  end

  it "should allow me to create a new campaign" do
    expect(@campaign).to be_valid
  end

  it "is invalid if no information is included" do
    expect(@no_info).to be_invalid
  end

  it "is invalid without a name for the campaign" do
    expect(@no_name).to be_invalid
  end

  it "is invalid without a status tweet for posting" do
    expect(@no_status).to be_invalid
  end

  it "is invalid if it does not belong to a particular Business" do
    expect(@no_business_id).to be_invalid
  end

  it "is invalid if the status length is greater than 140 characters" do
    expect(@long_tweet).to be_invalid
  end
end

# Add twitter check to user Modal
# Add relationship check (biz should have campaigns, and user/campaigns) 
# add email validation
