require "rails_helper"

RSpec.describe AccountActivationsController, type: :routing do
  describe "GET account activation" do

    it "routes to #edit" do
      expect(:get => "/account_activations/1/edit").to route_to("account_activations#edit", :id => "1")
    end

  end
end

