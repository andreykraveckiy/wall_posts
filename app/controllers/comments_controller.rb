class CommentsController < ApplicationController
	def create
		@comment = current_user.comment.build(comment_params)
			if @comment.save
				flash[:success] = "Micropost created!"
				redirect_to root_url
			else
				render 'static_pages/home'
			end
		redirect_to posts_path
	end

	private

		def comment_params
			params.require(:comment).permit(:content, :commentable)
		end
end