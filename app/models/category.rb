class Category < ApplicationRecord
	enum status: [:is_hidden, :is_published]

	has_many :projects

	validates :name, presence: true
end
