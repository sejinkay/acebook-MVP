require 'rails_helper'
require './spec/features/web_helper'

RSpec.feature "Edit", type: :feature do
  scenario "Can edit post" do
    sign_up
    new_post
    edit_post
    expect(page).to have_no_content("world!")
  end

  scenario "Shows updated time" do
    sign_up
    new_post
    edit_post
    expect(page).to have_content("Updated")
  end
end
