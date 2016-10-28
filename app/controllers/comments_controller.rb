class CommentsController < ApplicationController
  before_action :parent_object, only: [:new, :create]
  before_action :set_parent_id, only: [:new, :create]
  before_action :set_own_id, only: [:edit, :update]

  def new
    @comment = Comment.new
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.js
    end
  end

  def create  
    @comment = Comment.new(comment_params)
    @comment.save
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.js
    end
  end

  def update 
    @comment = Comment.find(params[:id])
    @comment.update_attributes(comment_params)
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.js
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @parent_id = "#{@comment.commentable_type}#{@comment.commentable_id}"
    if @comment.commentable_type.eql?("Post")
      @object = Post.find(@comment.commentable_id)
    else
      @object = Comment.find(@comment.commentable_id)
    end
    @comment.destroy
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

    def set_parent_id
      @parent_id = "#{params[:commentable_type]}#{params[:commentable_id]}"
    end

    def set_own_id
      @own_id = "Comment#{params[:id]}"
    end
end