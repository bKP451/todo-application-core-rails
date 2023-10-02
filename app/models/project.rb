class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  validates :project_name, presence: true,  length: { maximum: 255}
end
