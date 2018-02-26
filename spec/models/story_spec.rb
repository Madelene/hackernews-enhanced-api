require "spec_helper"
require "rails_helper"

RSpec.describe Story, type: :model do

  it 'returns a list of top stories' do
    client = HackernewsRuby::Client.new
    resp = client.top_stories
    response = resp.map { |s| client.get_item(s) }

    expect(response).to be_an_instance_of(Array)
  end

end

