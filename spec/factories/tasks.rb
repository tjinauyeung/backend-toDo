FactoryGirl.define do
  factory :task do |f|
    f.description "this is a description"
    association :project, factory: :project
  end
end
