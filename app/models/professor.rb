class Professor < ApplicationRecord
	def name_with_lastname
		"#{name} #{lastname}"
	end
end
