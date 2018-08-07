class Project < ApplicationRecord
	belongs_to :category
	belongs_to :project_owner
	has_many :project_supports

	enum status: [:is_hidden, :is_published, :succeeded, :failed, :cancel]

	validates :name, :brief, :description, :ad_url, :cover_image, presence: true
	validates_numericality_of :goal, greater_than: 0
	validate :valid_due_date?

	private

	def valid_due_date?
		if due_date.blank? || due_date < ((created_at || Time.zone.now) + 30.days)
			errors.add(:due_date, "due_dateis not orrect")
		end
	end

end
