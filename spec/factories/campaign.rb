FactoryGirl.define do 
	factory :campaign do
		name "Test"
		business_id 1
		status "Testing"
		location "Test"
		followers "Test"
		tweets 50
		avatar Rack::Test::UploadedFile.new('spec/fixtures/test.jpg', 'image/jpeg')
	end
	
end