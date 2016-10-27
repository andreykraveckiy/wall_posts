class CommentsController < ApplicationController
  before_action :parent_object, only: [:new, :create]
  before_action :set_id, only: [:new, :create]

  def new
    @comment = Comment.new
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.js
    end
  end

  def create  
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:success] = "Comment created!"
    end
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.js
    end
  end

  private

    def comment_params
      params.permit(:content, :commentable_id, :commentable_type, :user_id)
    end

    def parent_object     
      if params[:commentable_type].eql?("Post")
        @object = Post.find(params[:commentable_id])
      else
        @object = Comment.find(params[:commentable_id])
      end
    end

    def set_id
      @id = "#{params[:commentable_type]}#{params[:commentable_id]}"
    end
end