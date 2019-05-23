require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
  scenario "Can sign up" do
    visit "/users/new"
    fill_in "Name", with: "Tara"
    fill_in "Email", with: "tara@hotmail.com"
    fill_in "Password", with: "password"
    click_button "Sign Up"
    fill_in "Email", with: "tara@hotmail.com"
    fill_in "Password", with: "password"
    click_button "Login"
    expect(page).to have_content("New post")
  end
end
