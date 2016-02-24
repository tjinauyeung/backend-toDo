require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
project = FactoryGirl.create(:project)

  describe 'projects#index' do
    it "gets projects index" do
      get :index, :format => :json
      expect(response).to be_success
    end
  end

  describe '#new' do
    it "gets new_project" do
      get :new, :format => :json
      expect(response).to be_success
    end
  end

  describe '#create' do
    it "creates project" do
    expect{
       post :create, :format => :json, project: FactoryGirl.attributes_for(:project)
     }.to change{Project.count}.by(1)
    end
  end

  describe '#edit' do
    it "gets edit_project" do
      project
      get :edit, :format => :json, id: project.id
      expect(response).to be_success
    end

  end

  describe '#update'do
    it "updates project" do
      project
      put :update, :format => :json, id: project.id, :project => { :title => "new title"}
      project.reload
      expect(project.title).to eq("new title")
    end

  end

  describe '#delete'do
    it "deletes project"do
      project
      expect{delete :destroy, :format => :json, id: project.id}.to change{Project.count}.by(-1)
    end
  end

  describe '#show'do
    it "shows project"do
      project
      get :show, :format => :json, id: project.id
      expect(response).to be_success
    end

  end
end
