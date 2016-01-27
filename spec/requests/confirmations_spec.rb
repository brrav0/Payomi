require 'rails_helper'

RSpec.describe "Confirmations", type: :request do

    it 'should display the confirmations or redirect depending on users' do
      get confirmations_path
      expect(response).to be_success
      expect(response).to have_http_status(200)
  end
    it 'should redirect to login form if user not logged in' do
      get new_confirmation_path
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(login_path)
  end
end
