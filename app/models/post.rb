class Post < ApplicationRecord
  include AASM

  aasm :column => 'status' do
    state :new, :initial => true
    state :pending_review, :rejected, :published, :archived

    event :review do
      transitions :from => [:new, :archived], :to => :pending_review
    end

    event :reject do
      transitions :from => :pending_review, :to => :rejected
    end

    event :publish do
      transitions :from => :pending_review, :to => :published
    end

    event :archive do
      transitions :from => [:new, :pending_review, :rejected, :published], :to => :archived
    end

    event :edit do
      transitions :from => [:new, :pending_review, :rejected, :archived, :published], :to => :new
    end
  end

  belongs_to :user
  belongs_to :category

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "original/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
