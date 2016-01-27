require 'rails_helper'

RSpec.describe "confirmations/indexuser", :type => :view do
  it "renders _navbaruser partial" do
    render
    expect(view).to render_template(:partial => "_navbaruser")
  end
end
