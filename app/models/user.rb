class User < ActiveRecord::Base
  acts_as_followable
  acts_as_follower

  has_many :posts, dependent: :destroy

  has_secure_password

  validates :name, :email, presence: true
  validates :name, :email, uniqueness: true
  attachment :photo

end
