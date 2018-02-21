class Story < ApplicationRecord

  def self.top_stories
    client = HackernewsRuby::Client.new
    stories = client.top_stories.take(10)
    stories.map { |s| client.get_item(s) }
  end

end
