class Project < ApplicationRecord
	belongs_to :project_owner
  belongs_to :category
  
  has_many :project_supports
  has_many :pledges, through: :project_supports
  has_many :paid_pledges, through: :project_supports

  enum status: [:is_hidden, :is_published, :succeeded, :failed, :cancel]
  
  scope :is_now_on_sale, -> {self.where(status: [:is_published, :succeeded]).where('due_date > ?', Time.now)}
  
  scope :succeeded_and_done, -> {self.succeeded.where('due_date < ?', Time.now)}
  
  scope :past_projects, -> {self.where.not(status: [:cancel, :is_hidden]).where('due_date < ?', Time.now)}

  
  mount_uploader :cover_image, CoverImageUploader
  
  validates :name, :brief, :description, :ad_url, :cover_image, presence: true
  validates_numericality_of :goal, greater_than: 0
  validate :valid_due_date?
  
  
  def paid_pledges_amounts  
    return paid_pledges.inject(0) do |sum, pledge|
      sum += pledge.support_price * pledge.quantity
    end
  end
  
  def percentage_of_reaching_goal
    paid_pledges_amounts.to_f / goal.to_f
  end
  
  def seconds_left
    due_date.to_i - Time.now.to_i
  end
  
  private
  
  def valid_due_date?
    if due_date.blank? || due_date < ((created_at || Time.zone.now) + 7.days)
      errors.add(:due_date, "due_date is not correct")
    end
  end
end
