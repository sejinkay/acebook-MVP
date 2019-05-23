def sign_up
  visit ('/')
  fill_in 'user[name]', with: "Test"
  fill_in 'user[email]', with: "email@hotmail.com"
  fill_in 'user[password]', with: "password"
  click_button "Submit"
end

def login
  fill_in 'login[email]', with: "email@hotmail.com"
  fill_in 'login[password]', with: "password"
  click_button "Login"
end
