class Post < ApplicationRecord
  include AASM

  aasm :column => 'status' do
    state :new, :initial => true
    state :pending_review, :rejected, :published, :archived

    after_all_transitions :before_save

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
  validates :title, :category, :price, :description, :photo, :deal, presence: true
  validates :price, numericality: { greater_than: 0, less_than: 10000 }

  def log_status_change
    @@status_log ||= Logger.new("#{Rails.root}/log/my.log")
  end

  def before_save
    log_status_change.info("Changing post №#{self.id} status from #{aasm.from_state} to #{aasm.to_state} at #{Time.now}.")
  end

  def self.daily_archive
    # @posts = Post.where("status = ? and updated_at < ?", 'published', 1.day.ago)
    @posts = Post.where("status = ?", 'published')
    @posts.each do |post|
      if post.may_archive?
        post.archive!
      end
    end
  end
end
