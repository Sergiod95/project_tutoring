class User < ApplicationRecord
	has_secure_password
	
	validates :userid, presence: true
	validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address"}

	def name_with_lastname
		"#{name} #{lastname}"
	end

	def name_list
		"#{name} #{lastname}, #{email}, #{userid}"
	end

	def name_email
		"#{name} #{lastname}, #{email}"
	end

end

