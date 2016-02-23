require 'rails_helper'

RSpec.describe DocsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/").to route_to("docs#index")
    end
  end
end
