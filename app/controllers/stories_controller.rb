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
  	single_story = Story.single_story(id, count)
  	
  	if single_story
  		render json: { story: single_story }
    else
  	  render json: { message: "This story does not exist." }, status: 200
  	end
  end

end