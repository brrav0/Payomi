require 'rails_helper'


RSpec.describe "Log in process", type: :feature do

  it "should redirect to activation alert when it logs me in with an inactivated account" do
    user = FactoryGirl.create(:user)
    visit login_path
      fill_in 'Email', :with => 'foo@example.com'
      fill_in 'Mot de passe', :with => 'secret'
    click_button 'Connexion'
    expect(page).to have_content 'est pas activé'
  end

  it "should redirect to the login form with a wrong credential alert when it logs me in with an invalid account" do
    user = FactoryGirl.create(:user)
    visit login_path
      fill_in 'Email', :with => 'unkown@unknown.fr'
      fill_in 'Mot de passe', :with => 'unknown'
    click_button 'Connexion'
    expect(page).to have_content 'mot de passe est incorrect'
  end

  it "should display the confirmation index page when it logs me in with a valid account" do
    user = FactoryGirl.create(:user, activated: true)
    visit login_path
      fill_in 'Email', :with => 'foo@example.com'
      fill_in 'Mot de passe', :with => 'secret'
    click_button 'Connexion'
    expect(page).to have_content 'Ajouter une circularisation'
  end

end
