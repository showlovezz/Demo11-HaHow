class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable#, :omniauthable
  
  validates :name, presence: true

  mount_uploader :avator, CoverImageUploader

  has_many :pledges
  has_one :project_owner
end
