class Post < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  has_many :comments
  acts_as_followable
  acts_as_commentable
end
