class Post < ActiveRecord::Base
  belongs_to :user, inverse_of: :posts
  has_many :comments, as: :commentable, dependent: :destroy

  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true 
  validates :content, presence: true
end
