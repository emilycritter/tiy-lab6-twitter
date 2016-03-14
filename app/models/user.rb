class User < ActiveRecord::Base
  acts_as_followable
  acts_as_follower

  has_many :posts, dependent: :destroy

  has_secure_password

  validates :name, :email, presence: true
  validates :name, :email, uniqueness: true
  validates :name, format: { with: /\A[a-zA-Z][a-zA-Z0-9]+\z/,
      message: "must start with a letter and only contain letters and numbers" }

  attachment :photo

end
