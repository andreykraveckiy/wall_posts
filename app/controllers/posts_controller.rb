class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :all_posts, only: [:index, :create, :destroy]

  def create
    @post = current_user.posts.build(post_params) if user_signed_in?
    @post.save
    respond_to do |format|
      format.html { render 'index' }
      format.js
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { render 'index' }
      format.js
    end
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end

    def all_posts
      @posts = Post.all
    end
end
