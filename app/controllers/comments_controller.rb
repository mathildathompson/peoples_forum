class CommentsController < ApplicationController

	def index
    @suggestion = Suggestion.find(params[:suggestion_id].to_i)
    @comments = @suggestion.comments
 
  end


	def new
    @comment = Comment.new   
    @suggestion = Suggestion.find(params[:suggestion_id])
    @comment.suggestion = @suggestion
  end

  def create
    @comment = Comment.new(params[:comment])
    #@comment.suggestion_id = params[:suggestion_id]
    @suggestion = Suggestion.find(params[:suggestion_id])
    @comment.save
    redirect_to suggestion_comments_path(@suggestion)
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes(params[:comment])
    
  end

end
