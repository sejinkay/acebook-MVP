require 'rails_helper'
require './spec/features/web_helper'

RSpec.feature "404 error", type: :feature do
  scenario "user sees 404 error when looks for invalid user's wall" do
    sign_up
    visit ('/users/wrongusername')
    expect(page).to have_content("Error 404!")
  end
end
