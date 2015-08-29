FactoryGirl.define do 
	factory :comment do
		user 
		body "This is a comment!"
		rating 5
		association :product, factory: :product
	end
end