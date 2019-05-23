require 'rails_helper'
require './spec/features/web_helper'

RSpec.feature "Edit", type: :feature do
  scenario "Can edit post" do
    sign_up
    login
    new_post
    click_link "edit"
    fill_in 'post[message]', with: "Hello"
    click_button "Save changes"
    expect(page).to have_no_content("world!")
  end
end
