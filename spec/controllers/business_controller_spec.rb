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

	describe "GET show" do
		before do 
			@business = Business.create! valid_attributes
			get :show, id: @business.id
		end

		it "should render the show template" do
			expect(response).to render_template :show
		end

		it "should succeed" do
			expect(response).to be_success
		end

		it "should assign business" do
			expect(assigns(:business)).to eq(@business)
		end
	end

	# describe "GET new" do
	# 	before do
	# 		get :new
	# 	end

	# 	it "should render the new template successfully" do
	# 		expect(response).to render_template :new
	# 		expect(response).to be_success
	# 	end

	# 	it "should assign business to be a new business" do
	# 		expect(assigns(:business)).to be_a(Business)
	# 		expect(assigns(:business)).to_not be_persisted
	# 	end
	# end

	describe "POST create" do
		describe "successfully saves" do
			it "should be saved to the DB" do
				expect do
					post :create, business: valid_attributes
				end.to change(Business, :count).by(1)
			end

			it "should redirect to the show page for business" do
				post :create, business: valid_attributes
				expect(response).to redirect_to business_path(assigns(:business))
			end
		end

		# describe "unable to save" do
		# 	let :invalid_attibutes do
		# 		{
		# 			:name => nil,
		# 			:email => nil,
		# 			:password => nil
		# 		}
		# 	end

		# 	it "should not create any records in the database" do
		# 		expect do 
		# 			post :create, business: invalid_attributes 
		# 		end.to_not change(Business, :count).by(1)
		# 	end

		# 	it 'should render the new template' do
		# 		post :create, business: invalid_attributes
		# 		expect(response).to render_template :new
		# 	end
		# end
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

	# describe "PUT update" do
	# 	before do
	#       @test_business = Business.create! valid_attributes
	#     end

	#     describe "with successful update" do
	#       let :update_attributes do
	#         {
	# 					name: "Stark Industries",
	# 					email: "tstark@stark.com",
	# 					password: "ImIronMan",
	#         }
	#       end

	#       before do
	#         put :update, id: @test_business.id, business: update_attributes
	#       end

	#       it "should update the business record in the database" do
	#         expect(@test_business.reload.password).to eq("ImIronMan")
	#       end

	#       it "should redirect to the show page of business" do
	#         expect(response).to redirect_to business_path(assigns(:business))
	#       end
	#     end

	#     describe "with invalid update attributes" do
	#       let :invalid_update_attributes do
	#         {
	# 					name: "LexCorp",
	# 					email: "lluthor@lex.com",
	# 					password: "IHateSuperman"
	#         }
	#       end

	#       before do
	#         put :update, id: @test_business.id, business: invalid_update_attributes
	#       end

	#       it "should not update the business record in the database" do
	#         expect(@test_business.reload.password).to eq("ImBatman")
	#       end

	#       it "should rerender the edit view template" do
	#         expect(response).to render_template :edit
	#       end
	#     end
	# end

	describe "DELETE business" do
		before do
			@business = Business.create! valid_attributes
			get :show, id: @business.id
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