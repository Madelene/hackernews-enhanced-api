class StoriesController < ApplicationController

	expose(:id) { params[:id] }

  def index
  	render json: { top_stories: Story.top_stories }
  end

  def show
  	render json: { story: Story.story(id) }
  end

end
