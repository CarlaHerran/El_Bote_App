class Boat < ApplicationRecord
	has_many :oceans
	has_many :users, through: :oceans
	has_many :records
end
