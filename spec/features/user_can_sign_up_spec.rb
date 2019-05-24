require 'rails_helper'
require './spec/features/web_helper'

RSpec.feature "Sign Up", type: :feature do
  scenario "Can sign up and goes to login" do
    sign_up
    expect(page).should have_xpath('/posts')
  end
end
