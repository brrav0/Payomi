require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
describe "GET static pages" do
    it 'should display the home page' do
      get home_path
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template("home")
  end
    it 'should display the about page' do
      get about_path
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template("about")
  end
    it 'should display the contact page' do
      get contact_path
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template("contact")
  end
    it 'should display the terms_and_condition page' do
      get terms_and_conditions_path
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template("terms_and_conditions")
  end
  end
end
