require 'rails_helper'
require './spec/features/web_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can view Timeline" do
    sign_up
    click_link "Timeline"
    expect(page).to have_content('Welcome, Test')
  end

  scenario "Cannot view users that don't exists" do
    sign_up
    visit('/users/Wrongname')
    expect(page).to have_content('Error 404!')
  end
end
