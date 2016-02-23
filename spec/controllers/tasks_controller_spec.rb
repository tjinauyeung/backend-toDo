require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let(:task) {Task.create(description: "this is a description")}
  describe 'GETS' do
    it "returns tasks index" do
      get :index, :format => :json
      expect(response).to be_success
    end


    it "returns task new" do
      get :new, :format => :json
      expect(response).to be_success
    end

    it "creates task"do
      post :create, :format =>:json, :task => task.attributes
      expect{Task.create}.to change{Task.count}.by(1)
    end

    it "returns task edit" do
      task
      get :edit, :format => :json, id: task.id
      expect(response).to be_success
    end

    it "returns task update" do
      task
      put :update, :format => :json, id: task.id, :task => { :description => "new description"}
      task.reload
      expect(task.description).to eq("new description")
    end

    it "deletes the task"do
      task
      expect{delete :destroy, :format => :json, id: task.id}.to change{Task.count}.by(-1)
    end
  end
end
