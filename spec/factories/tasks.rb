FactoryGirl.define do
  factory :task do
    description "this is a description"
    done false
    project
  end
end
