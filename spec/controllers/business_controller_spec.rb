require 'spec_helper'

describe BusinessesController do 
	let :valid_attributes do
		{
			name: "Wayne Enterprises",
			email: "bwayne@wayne.com",
			password: "ImBatman",
		}
	end

	describe "GET #show" do
		before do 
			@test_business = Business.create! valid_attributes
			get :show, id: @test_business.id
		end

		it "should render the show template" do
			expect(response).to render_template :show
		end

		it "should succeed" do
			expect(response).to be_success
		end

		it "should assign @businesses to all businesses" do
			expect(assigns(:business)).to eq(@test_business)
		end
	end

	describe "Get edit" do
		before do
			@test_business = Business.create! valid_attributes
			get :edit, id: @test_business.id
		end

		it "should render the edit template" do
		  expect(response).to render_template :edit
		  expect(response).to be_success
		end

		it "should assign the business " do
			expect(assigns(:business)).to eq(@test_business)
		end
	end

	describe "put/patch update" do
		before do
	      @test_business = Business.create! valid_attributes
	    end

	    describe "with successful update" do
	      let :new_attributes do
	        {
						name: "Stark Industries",
						email: "tstark@stark.com",
						password: "ImIronMan",
	        }
	      end

	      before do
	        patch :update, id: @test_business.id,
	        business: new_attributes
	      end

	      it "should update the business record in the database" do
	        expect(@test_business.reload.password).to eq("ImIronMan")
	      end

	      it "should redirect to the index of all businesss" do
	        expect(response).to redirect_to business_path(@test_business.id)
	      end
	    end

	    describe "with invalid update attributes" do
	      let :invalid_update_attributes do
	        {
						name: "LexCorp",
						email: "lluthor@lex.com",
						password: "IHateSuperman",
	        }
	      end

	      before do
	        put :update, id: @test_business.id, business: invalid_update_attributes
	      end

	      it "should not update the business record in the database" do
	        expect(@test_business.reload.password).to eq("ImBatman")
	      end

	      it "should rerender the edit view template" do
	        expect(response).to render_template :edit
	      end
	    end
	end

	describe "delete #destroy" do
		before do
			@test_business = Business.create! valid_attributes
		end

		it "should delete a business in the DB" do
			expect do
				delete :destroy, id: @test_business.id
			end.to change(Business, :count).by(-1)
			expect(response).to redirect_to business_path(@test_business.id)
	 	end

	end

end