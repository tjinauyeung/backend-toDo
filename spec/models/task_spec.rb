require 'rails_helper'

RSpec.describe Task, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:task)).to be_valid
  end

  it "is invalid without a status (done: true or false)" do
    expect(FactoryGirl.build(:task, done: nil)).to_not be_valid
  end
end
