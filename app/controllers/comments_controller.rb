class CommentsController < ApplicationController
	#before_action :set_parent, only: [:create]

	def create	
		@comment = Comment.new(comment_params)
		@id = "#{params[:commentable_type]}#{params[:commentable_id]}"
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

		def set_parent
			if params[:commentable_type].eql?("Post")
				@post = Post.find(params[:commentable_id])
			else
				@post = Comment.find(params[:commentable_id])
			end
		end
end