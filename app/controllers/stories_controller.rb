class StoriesController < ApplicationController

	expose(:id)       { params[:id] }
	expose(:title)    { params[:title] }
	expose(:by)       { params[:by] }
	expose(:score)    { params[:score] }
	expose(:count)    { params[:count] }

  def index
  	render json: { top_stories: Story.sort(title, by, score, count) }
  end

  def show
  	render json: { story: Story.single_story(id, count) }
  end

end