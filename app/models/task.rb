class Task < ActiveRecord::Base
  belongs_to :project
  validates :description, presence: true
  validates :done, inclusion: [true, false]
  validates :project, presence: true
end
