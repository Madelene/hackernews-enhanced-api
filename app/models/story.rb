class Story < ApplicationRecord

  def self.top_stories
    client = HackernewsRuby::Client.new
    stories = client.top_stories.take(10)
    top_stories = stories.map { |s| client.get_item(s) }
  end

  def self.story id
    client = HackernewsRuby::Client.new
    story = client.get_item(id) 
    payload = 
      {
        by: story.by,
        descendents: story.descendents,
        id: story.id,
        comments: story.kids.take(10),
        score: story.score,
        time: story.time,
        title: story.title,
        type: story.type,
        url: story.url
      }
  end

end
