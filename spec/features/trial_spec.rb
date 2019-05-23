require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
 scenario "Can sign up" do
   visit "/"
   fill_in "Name", with: "Tara"
   fill_in "Email", with: "tara@hotmail.com"
   fill_in "Password", with: "password"
   click_button "Sign Up"
   fill_in "login[email]", with: "tara@hotmail.com"
   fill_in "login[password]", with: "password"
   click_button "Login"
   click_link "New post"
   expect(1).to eq(1)
 end
end
