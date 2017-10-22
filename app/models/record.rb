class Record < ApplicationRecord
	belongs_to :user
	belongs_to :boat
	belongs_to :product
end
