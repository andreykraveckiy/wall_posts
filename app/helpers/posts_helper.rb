module PostsHelper
	def posts
		@posts ||= Post.all
	end
end
