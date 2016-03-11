class Post < ActiveRecord::Base

  validates :post_text, :user_id, presence: true
  attachment :photo

end
