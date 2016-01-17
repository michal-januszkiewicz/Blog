class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  validates :user_id, presence: true
  validates :content, presence: true, allow_blank: false
end
