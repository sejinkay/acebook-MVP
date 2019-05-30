require 'rails_helper'
require './spec/features/web_helper'

RSpec.feature "login/logout", type: :feature do
  scenario "Can log in once account exists" do
    sign_up
    click_link "Logout"
    click_link "Login"
    login
    expect(page).to have_content('Welcome to your wall, Test')
  end

  scenario "Can log out when logged in" do
    sign_up
    click_link "Logout"
    find_link('Login').visible?
  end

  scenario "Cannot log in with wrong email" do
    sign_up
    click_link('Logout')
    click_link('Login')
    fill_in 'login[email]', with: "emale@hotmail.com"
    fill_in 'login[password]', with: "password"
    click_button "Login"
    expect(page).to have_content('Email or password is invalid, please try again')
  end

  scenario "Cannot log in with wrong password" do
    sign_up
    click_link('Logout')
    click_link('Login')
    fill_in 'login[email]', with: "email@hotmail.com"
    fill_in 'login[password]', with: "parseword"
    click_button "Login"
    expect(page).to have_content('Email or password is invalid, please try again')
  end

  scenario "Cannot view the posts without login" do
    sign_up
    click_link('Logout')
    visit('http://localhost:3000/users/Test')
    expect(page).to have_content('Create an Account')
  end
end
