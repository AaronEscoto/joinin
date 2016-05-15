class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :subscriptions, foreign_key: :follower_id, dependent: :destroy
  has_many :events, through: :subscriptions
  has_many :posts, dependent: :destroy
  has_many :comments

  # predicate method returning t or f to see if the current user
  # is following a post
  def following?(event)
    events.include? event
  end

  # this method ensures that a user isn't already following a post
  def follow!(event)
    if !following?(event)
      events << event
    end
  end

  def eventlist_user_ids
    event_ids + [id]
  end
end
