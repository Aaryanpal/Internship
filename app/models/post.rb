class Post < ApplicationRecord  
  max_paginates_per 2
  has_many :comments, dependent: :destroy
  
  validates :title, presence: true
  validates :content, presence: true
end
