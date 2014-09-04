require "spec_helper"

describe Business do
  it "is valid with name, email, password, and tweets" do
    business = FactoryGirl.build(:business)
    expect(business).to be_valid
  end

  it "is invalid without a name" do
    business = FactoryGirl.build(:business, name: nil)
    expect(business).to be_invalid
  end
  
  it "is invalid without an email" do
    business = FactoryGirl.build(:business, email: nil)
    expect(business).to be_invalid
  end
  
  it "is invalid without a password" do
    business = FactoryGirl.build(:business, password: nil)
    expect(business).to be_invalid
  end

  it "should have many tweets" do
    business = FactoryGirl.build(:business)
    expect(business.tweets).to eq(100)
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