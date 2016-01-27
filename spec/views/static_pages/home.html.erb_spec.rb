require 'rails_helper'

RSpec.describe StaticPagesController, :type => :controller do
    it 'should display the home page' do
      get :home
      expect(response).to be_success
      expect(response).to have_http_status(200)
  end
end