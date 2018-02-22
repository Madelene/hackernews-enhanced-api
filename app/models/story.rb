class Story < ApplicationRecord
  @client = HackernewsRuby::Client.new

  class << self 

    def top_stories
      stories = @client.top_stories.take(10)
      top_stories = stories.map { |s| @client.get_item(s) }
    end

    def single_story id, count=0
      story = @client.get_item(id) 
      payload = 
      {
        by: story.by,
        descendents: story.descendents,
        id: story.id,
        kids: story.kids.take(10),
        comments: count ? story[:kids].take(count.to_i).map { |comment| @client.get_item(comment) } : story.kids.take(10).map { |comment| @client.get_item(comment) },
        score: story.score,
        time: story.time,
        title: story.title,
        type: story.type,
        url: story.url
      }
    end

    def sort title=nil, by=nil, score=0, count=0
      stories = top_stories

      if title
        stories.select { |story| story.title == title }  
      elsif by
        stories.select { |story| story.by == by }
      elsif score
        stories.select { |story| story.score == (score.to_i) }
      elsif count
        top_stories.take(count.to_i)
      else
        stories
      end
    end

  end

end
