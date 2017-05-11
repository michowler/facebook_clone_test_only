class User < ActiveRecord::Base

	validates :email, presence: true
	validates :name, presence: true
	validates :email, uniqueness: true
	validates :password_confirmation, presence: true
	validates :password, length: { in: 6..20 }
	validates :email, format: { with: /\S+@\S+\.\S+/}

	has_secure_password

	#has_many :statuses, dependent: :destroy
	#has_many :likes, dependent: :destroy

	 def has_valid_email
	   if (self.email =~ /\w+@\w+.\w+/).nil?
	     self.errors.add(:email, "must be a valid email address")
	   end
	 end

end