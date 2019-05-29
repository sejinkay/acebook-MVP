require 'rails_helper'
require './spec/features/web_helper'

RSpec.feature "Sign Up", type: :feature do
  scenario "Can sign up and goes to posts (with username)" do
    sign_up
    expect(page).to have_content('Welcome to your wall, Test')
  end

  scenario "Cannot sign up with existing email" do
    sign_up
    click_link('Logout')
    sign_up
    expect(page).to have_content('Email or Username unavailable, please try again')
  end

  scenario "Cannot sign up with email that doesnt adhere to email format" do
    visit '/'
    fill_in 'user[name]', with: "Test"
    fill_in 'user[email]', with: "THISISNOTANEMAILADDRESS"
    fill_in 'user[password]', with: "password"
    click_button "Submit"
    expect(page).to have_content('Incorrect email format')
  end
end
