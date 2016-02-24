class Task < ActiveRecord::Base
  validates :description, presence: true
  validates :done, inclusion: [true, false]
end
