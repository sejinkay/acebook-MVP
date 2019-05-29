require 'rails_helper'
require './spec/features/web_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can view Timeline" do
    sign_up
    click_link "Timeline"
    expect(page).to have_content('Welcome, Test')
  end
end  
