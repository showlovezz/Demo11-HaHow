class Project < ApplicationRecord
	belongs_to :category
	belongs_to :project_owner
	has_many :project_supports

	enum status: [:is_hidden, :is_published, :succeeded, :failed, :cancel]

	validates :name, :brief, :description, :ad_url, :cover_image, presence: true
	validates_numericality_of :goal, greater_than: 0
	validate :valid_due_date?

	mount_uploader :cover_image, CoverImageUploader

	scope :is_now_on_sale, -> {self.is_published.where('due_date > ?', Time.now)}

	private

	def valid_due_date?
		if due_date.blank? || due_date < ((created_at || Time.zone.now) + 7.days)
			errors.add(:due_date, "due_dateis not correct")
		end
	end

end
