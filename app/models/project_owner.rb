class ProjectOwner < ApplicationRecord
	belongs_to :user

	has_one :project
end
