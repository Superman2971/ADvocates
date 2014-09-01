require 'spec_helper'

describe BusinessesController do 
	let :valid_attributes do
		{
			name: "Wayne Enterprises",
			email: "bwayne@wayne.com",
			password: "ImBatman",
		}
	end

	describe "GET #index" do
		let :business1 do
			Business.create! valid_attributes
		end
		let :business2 do
			Business.create! valid_attributes
		end

		before do
			get :index
		end

		it "should render the index template" do
			expect(response).to render_template :index
		end

		it "should succeed" do
			expect(response).to be_success
		end

		it "should assign @businesses to be all businesses" do
			expect(assigns(:businesses)).to include(:business1, :business2)
		end
	end


end