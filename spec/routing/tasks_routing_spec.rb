require 'rails_helper'

RSpec.describe TasksController, type: :routing do
  project=FactoryGirl.create(:project)
  task=FactoryGirl.create(:task)
  describe "routing" do

    it "routes to #index of projects" do
      expect(:get => "/projects").to route_to("projects#index")
    end



    it "routes to #index" do
      expect(:get => "/projects/1/tasks").to route_to("tasks#index", project_id: '1')
    end

    it "routes to #create" do
      expect(:post => "/projects/1/tasks").to route_to("tasks#create", project_id: '1')
    end

    it "routes to #edit" do
      task
      expect(:get => "/projects/1/tasks/1/edit").to route_to("tasks#edit", project_id:'1', id: '1')
    end
#
#     it "routes put update" do
#       task
#       expect(:put => "/tasks/1").to route_to("tasks#update", id: '1')
#
#     end
#
#     it "routes to #new" do
#       expect(:get => "/tasks/new").to route_to("tasks#new")
#     end
#
#     it "routes to #delete" do
#       task
#       expect(:delete => "/tasks/1").to route_to("tasks#destroy", id: '1')
#
#     end
#
#     it "does not routes to #show" do
#       task
#       expect(:get => "/tasks/1").not_to be_routable
#     end
  end
end
