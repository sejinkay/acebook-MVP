require 'rails_helper'
require './spec/features/web_helper'

RSpec.feature "Another user wall", type: :feature do
  scenario "Can view another users wall" do
    sign_up
    click_link "Logout"
    sign_up_2
    visit ('http://test.host/users/1')
    expect(page).to have_content("Test's Wall")
  end
end
