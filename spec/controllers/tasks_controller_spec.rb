require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  describe 'GET index' do
    it "returns tasks index" do
      get :index, :format => :json
      expect(response).to be_success
    end
  end
end
