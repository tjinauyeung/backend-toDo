class Task < ActiveRecord::Base
  belongs_to :project
  validates :done, inclusion: [true, false]
end
