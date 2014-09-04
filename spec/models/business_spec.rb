require "spec_helper"

describe Business do
  before do
    @business = Business.create!(name:"Test",email:"Test@gmail.com",password:"123456456",tweets:0)
    @no_name = Business.new(email:"Test@gmail.com",password:"123456",tweets:0)
    @no_email = Business.new(name:"Test",password:"123456",tweets:0)
    @no_password = Business.new(name:"Test",email:"Test@gmail.com",tweets:0)
  end
  
  it "should allow me to create a new business" do
    expect(@business).to be_valid
    expect(Business.count).to eq(1)
  end

  it "is invalid without a name" do
    expect(@no_name).to be_invalid
  end
  
  it "is invalid without an email" do
    expect(@no_email).to be_invalid
  end
  
  it "is invalid without a password" do
    expect(@no_password).to be_invalid
  end

  it "should have many Campaigns" do
    relation = Business.reflect_on_association(:campaigns)
    relation.macro.should == :has_many
  end

  it "should have an email meeting validation requirements" do
    expect("testing@gmail.com").to match(/\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i)
    expect("testing.com").to_not match(/\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i)
    expect("testing@gmail").to_not match(/\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i)
  end
end