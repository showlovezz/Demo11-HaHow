class ProjectOwner < ApplicationRecord
	belongs_to :user
	has_one :project

	mount_uploader :cover_image, CoverImageUploader
end
