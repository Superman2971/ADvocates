require "spec_helper"
require "rails_helper"

describe User do
  before do
    @user = User.create!(name:"Test", screen_name:"TesterGuy", uid:1)
    @new_user = User.new(name:"Test", screen_name:"TesterGuy", uid:1)
    @no_uid = User.new(name:"Test", screen_name:"TesterGuy")
    @no_screen_name = User.new(name:"Test", uid:1)
  end

  it "should allow me to create a new user" do
    expect(@user).to be_valid
    expect(User.count).to eq(1)
  end

  it "is invalid without a uid and screen_name from their Twitter account" do
    expect(@new_user).to be_valid
    expect(@no_uid).to be_invalid
    expect(@no_screen_name).to be_invalid
  end

  it "should have many Campaigns" do
    relation = User.reflect_on_association(:campaigns)
    relation.macro.should == :has_many
  end
end
