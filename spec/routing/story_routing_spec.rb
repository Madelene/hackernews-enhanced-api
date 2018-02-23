require 'rails_helper'
require 'spec_helper'

RSpec.describe "Stories" do  
  describe "StoriesController" do
    it "routes get index" do
      expect(get: "/stories/").to route_to(
        controller: "stories",
        action: "index"
        )
    end
    it "routes get show" do
      expect(get: "/stories/1").to route_to(
        controller: "stories",
        action: "show",
        id: "1"
        )
    end       
  end
end