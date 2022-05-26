class Professor < ApplicationRecord
	def name_with_lastname
		"#{name} #{lastname}"
	end

	def name_email
		"#{name} #{lastname}, #{email}"
	end
end
