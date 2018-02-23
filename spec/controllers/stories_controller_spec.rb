require 'spec_helper'
require 'rails_helper'

RSpec.describe StoriesController, type: :controller do
  let(:story) { FactoryBot.create(:story) }

  context "GET index" do
    it "returns a successful 200 response" do
      get :index, format: :json
      expect(response).to have_http_status(200)
    end
    it "populates an array of top stories" do
      get :index
      stories = JSON.parse(response.body)
      if stories == !nil
        expect(stories["stories"]).to be_an(Array)
      end
    end
    it "responds with json" do
      get :index, format: :json 
      expect(response.content_type).to eq "application/json"
    end
  end

end
