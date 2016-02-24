require 'rails_helper'

RSpec.describe Task, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:task)).to be_valid
  end

  it "is invalid without a status" do
    expect(FactoryGirl.build(:task, done: nil)).to_not be_valid
  end

  it "has 'false' as standard status for done" do
    task = FactoryGirl.create(:task)
    expect(task.done).to eq(false)
  end
end
