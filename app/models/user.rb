class User < ActiveRecord::Base
  has_secure_password

  validates :name, :email, presence: true
  validates :name, :email, uniqueness: true
  attachment :photo
  
end
