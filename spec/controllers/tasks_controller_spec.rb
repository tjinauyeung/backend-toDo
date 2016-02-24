require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let(:task) {Task.create(description: "this is a description")}
  let(:invalid_description) do
    { description: ""}
  end
  describe '#index' do
    it "returns tasks index" do
      get :index, :format => :json
      expect(response).to be_success
    end
  end

  describe '#new' do
    it "returns task new" do
      get :new, :format => :json
      expect(response).to be_success
    end
  end

  describe '#create'do
    it "creates task"do
      post :create, :format =>:json, :task => task.attributes
      expect{Task.create}.to change{Task.count}.by(1)
    end

    it "fails to create task" do
      post :create, :format =>:json, :task => {:description => "ha" * 500}
      expect{Task.create}.to_not change{Task.count}
    end
  end

  describe '#edit' do
    it "returns task edit" do
      task
      get :edit, :format => :json, id: task.id
      expect(response).to be_success
    end
  end

  describe '#update'do
    it "returns task update" do
      task
      put :update, :format => :json, id: task.id, :task => { :description => "new description"}
      task.reload
      expect(task.description).to eq("new description")
    end
  end

  describe '#delete'do
    it "deletes the task"do
      task
      expect{delete :destroy, :format => :json, id: task.id}.to change{Task.count}.by(-1)
    end
  end
end
