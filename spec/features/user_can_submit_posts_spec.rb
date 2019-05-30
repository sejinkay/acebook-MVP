require 'rails_helper'
require './spec/features/web_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    sign_up
    new_post
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can submit posts on the named URL" do
    sign_up
    visit('/users/Test')
    new_post
    expect(page).to have_content("Hello, world!")
  end
end
