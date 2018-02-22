class Story < ApplicationRecord
  @client = HackernewsRuby::Client.new

  class << self 

    def top_stories
      stories = @client.top_stories.take(10)
      top_stories = stories.map { |s| @client.get_item(s) }
    end

    def story id
      story = @client.get_item(id) 
      payload = 
      {
        by: story.by,
        descendents: story.descendents,
        id: story.id,
        kids: story.kids.take(10),
        comments: story.kids.take(10).map { |comment| @client.get_item(comment) },
        score: story.score,
        time: story.time,
        title: story.title,
        type: story.type,
        url: story.url
      }
    end

  end

end