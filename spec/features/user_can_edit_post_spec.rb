require 'rails_helper'

RSpec.feature "Edit", type: :feature do
  scenario "Can edit post" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "edit"
    fill_in "Message", with: "Hello"
    click_button "Save changes"
    expect(page).to have_no_content("world!")
  end
end
