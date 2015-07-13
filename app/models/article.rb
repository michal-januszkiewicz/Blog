class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :comments,
                                :reject_if => lambda { |a| a[:content].blank? },
                                :allow_destroy => true
end
