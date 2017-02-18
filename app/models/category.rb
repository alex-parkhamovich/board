class Category < ApplicationRecord
  resourcify
  
  has_many :posts
  validates :title, presence: true
end
