class Product < ApplicationRecord

	before_save :downcase_names
	after_initialize :titleize_names

	has_many :records
	belongs_to :category

	def downcase_names
	    self.send("#{:name}=", self.send(:name).downcase) if self.send(:name)
	end

	def titleize_names
		self.send("#{:name}=", self.send(:name).titleize) if self.send(:name)
	end
end
