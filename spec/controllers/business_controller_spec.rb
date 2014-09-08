require 'spec_helper'
require "rails_helper"

describe BusinessesController do 
	let :valid_attributes do
		{
			name: "Wayne Enterprises",
			email: "bwayne@wayne.com",
			password: "ImBatman",
		}
	end

	describe "GET index" do
		before do 
			@business = Business.create! valid_attributes
			get :index, id: @business.id
		end

		it "should render the show template" do
			expect(response).to render_template :index
		end

		it "should succeed" do
			expect(response).to be_success
		end
		
	end


	describe "POST create" do
		describe "successfully saves" do
			it "should be saved to the DB" do
				expect do
					post :create, business: valid_attributes
				end.to change(Business, :count).by(1)
			end

			it "should redirect to the show page for business" do
				post :create, business: valid_attributes
				expect(response).to redirect_to businesses_path
			end
		end
	end

	describe "GET edit" do
		before do
			@business = Business.create! valid_attributes
			get :edit, id: @business.id
		end

		it "should render the edit template" do
		  expect(response).to render_template :edit
		  expect(response).to be_success
		end

		it "should assign the business" do
			expect(assigns(:business)).to eq(@business)
		end
	end

	describe "DELETE business" do
		before do
			@business = Business.create! valid_attributes
			get :index, id: @business.id
		end

		it "should delete a business from the database" do
			expect do
				delete :destroy, id: @business.id
			end.to change(Business, :count).by(-1)
		end

		it "should redirect to the root page" do
			delete :destroy, id: @business.id
			expect(response).to redirect_to root_path
	 	end

	end

end