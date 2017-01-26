class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "original/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
