require 'rails_helper'
require './spec/features/web_helper'

RSpec.feature "Delete", type: :feature do
  scenario "Can delete post" do
    sign_up
    login
    click_link "New post"
    fill_in 'post[message]', with: "Hello, world!"
    click_button "Submit"
    click_link "delete"
    expect(page).to have_no_content("Hello, world!")
  end
end
