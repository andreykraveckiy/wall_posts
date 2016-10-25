class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  has_many 	:comments, class_name: "Comment", 
  					as: :commentable, dependent: :destroy
  belongs_to :user

  default_scope -> { order('created_at ASC') }
  validates :user_id, presence: true  
	validates :commentable, presence: true
	validates :content, presence: true
end
