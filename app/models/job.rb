class Job < ActiveRecord::Base
  belongs_to :company

  validates :title, presence: true
  validates :company, presence: true
  validates :description, length: { maximum: 5000 }
end
