require 'rails_helper'
require './spec/features/web_helper'

RSpec.feature "Sign Up", type: :feature do
  scenario "Can sign up and goes to login" do
    sign_up
    expect(page).to have_content('Welcome, Test')
  end

  scenario "Cannot sign up with existing email" do
    sign_up
    click_link('Logout')
    sign_up
    expect(page).to have_content('Email or Username unavailable, please try again')
  end
end
