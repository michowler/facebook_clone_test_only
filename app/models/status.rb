class Status < ActiveRecord::Base
  #validates_presence_of :title, :content
  validates :title, presence: true
  validates :content, presence: true
  validates :title, length: { minimum: 8, too_short: "title is too short (minimum is 8 characters)" }
  validates :content, length: { minimum: 10, too_short: "content is too short (minimum is 10 characters)" }
  
  belongs_to :user
  has_many :likes, dependent: :destroy

  default_scope { order(created_at: :desc) }

end
