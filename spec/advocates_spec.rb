require "spec_helper"
require "rails_helper"

describe "Business Model" do
  it "should all me to create someone" do
    expect(Business.new(name:"Ian", email:"ian@gmail.com",password:"123",tweets:0)).to be_success
  end
end