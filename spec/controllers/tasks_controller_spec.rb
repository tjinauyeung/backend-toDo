require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  task = FactoryGirl.create(:task)
  project = FactoryGirl.create(:project)

  describe 'tasks#index' do
    it "gets tasks index" do
      get :index, :format => :json, :project_id => project.id
      expect(response).to be_success
    end
  end

  describe '#new' do
    it "gets new_task" do
      get :new, :format => :json, :project_id => project.id
      expect(response).to be_success
    end
  end

  describe '#create' do
    it "creates task" do
    expect{
       post :create, :format => :json, task: FactoryGirl.attributes_for(:task, project_id: project.to_param), :project_id => project.id
     }.to change{Task.count}.by(1)
    end

    it "is invalid without a description" do
       expect(FactoryGirl.build(:task, description: nil)).to_not be_valid
    end

    it "is invalid without a project_id" do
      expect(FactoryGirl.build(:task, project_id: nil)).to_not be_valid
    end
  end

  describe '#edit' do
    it "gets edit_task" do
      task
      get :edit, :format => :json, id: task.id, :project_id => project.id
      expect(response).to be_success
    end

  end

  describe '#update'do
    it "updates task" do
      task
      put :update, :format => :json, id: task.id, :task => { :description => "new description"}, :project_id => project.id
      task.reload
      expect(task.description).to eq("new description")
    end

  end

  describe '#delete'do
    it "deletes task"do
      task
      expect{delete :destroy, :format => :json, id: task.id, :project_id => project.id}.to change{Task.count}.by(-1)
    end
  end
end
