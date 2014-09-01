require "spec_helper"
require "rails_helper"

describe "Business Model" do
  before do
    @business = Business.create!(name:"Ian", email:"ian@gmail.com",password:"123",tweets:0)
  end
  
  it "should all me to create someone" do
    expect(@business).to be_valid
  end
  
  it "should all me to create someone" do
    expect(@business).to be_valid
  end
  
  it "should all me to create someone" do
    expect(@business).to be_valid
  end
  
  it "should all me to create someone" do
    expect(@business).to be_valid
  end
end