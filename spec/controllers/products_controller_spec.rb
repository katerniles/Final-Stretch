require 'rails_helper'

describe ProductsController, :type => :controller do
	describe "GET #index" do
		it "responds with an http 200 code" do
			get :index
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "successfully renders product index" do
			get :index
			expect(response).to render_template("index")
		end
	end
end
