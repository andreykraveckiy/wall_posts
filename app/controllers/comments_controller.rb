class CommentsController < ApplicationController

	def create	
		@comment = Comment.new(comment_params)
			if @comment.save
				flash[:success] = "Comment created!"
			end
		redirect_to posts_url
	end

	private

		def comment_params
			params.permit(:content, :commentable_id, :commentable_type, :user_id)
		end
end