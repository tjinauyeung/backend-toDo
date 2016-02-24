class Task < ActiveRecord::Base
  belongs_to :project
  validates :done, inclusion: [true, false]
  validates :project_id, presence: true
end
