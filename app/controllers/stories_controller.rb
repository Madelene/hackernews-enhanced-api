class StoriesController < ApplicationController

  def index
  	render json: { top_stories: Story.top_stories }
  end

  def show
  end

end
