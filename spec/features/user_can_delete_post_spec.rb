require 'rails_helper'

RSpec.feature "Delete", type: :feature do
  scenario "Can delete post" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "delete"
    expect(page).to have_no_content("Hello, world!")
  end
end
