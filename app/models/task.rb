class Task < ActiveRecord::Base
  validates :done, inclusion: [true, false]
end
