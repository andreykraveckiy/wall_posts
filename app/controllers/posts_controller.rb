class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index]
	
  def index
  end

  def create
  	@post = current_user.posts.build(post_params) if user_signed_in?
  	if @post.save
  		flash[:success] = "Post created!"
  	end 
    respond_to do |format|
  	  format.html { render 'index' }
      format.js
    end
  end

  def destroy
  end

  private

  	def post_params
  		params.require(:post).permit(:content)
  	end
end
