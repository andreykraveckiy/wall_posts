class CommentsController < ApplicationController

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
end