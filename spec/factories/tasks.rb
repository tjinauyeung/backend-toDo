FactoryGirl.define do
  factory :task do |f|
    f.description "this is a description"
    #f.association :project, factory: :project
  end
end
