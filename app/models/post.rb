class Post < ActiveRecord::Base
  belongs_to :user
  validates :post_text, :user_id, presence: true
  attachment :photo

end
