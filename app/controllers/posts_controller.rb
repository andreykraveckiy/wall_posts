class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index]
	
  def index
  	@post = current_user.posts.build if user_signed_in?
  end

  def create
  	@post = current_user.posts.build(post_params)
  	if @post.save
  		flash[:success] = "Post created!"
  	end 
  	@post = current_user.posts.build if user_signed_in?
  	render 'index'
  end

  def destroy
  end

  private

  	def post_params
  		params.require(:post).permit(:content)
  	end
end
