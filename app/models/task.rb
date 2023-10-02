class Task < ApplicationRecord
  belongs_to :project
  validates :task_name, presence: true, length: { maximum: 150 }
  validates :task_description, presence: true, length: { maximum: 255 }
end
