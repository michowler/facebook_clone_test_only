class Like < ActiveRecord::Base

  validates :user_id, presence: true
  validates :status_id, presence: true
  validates :user_id, uniqueness: { scope: :status_id }
  
  belongs_to :user
  belongs_to :status

end