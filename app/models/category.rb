class Category < ApplicationRecord
  resourcify
  
  has_many :posts
end
