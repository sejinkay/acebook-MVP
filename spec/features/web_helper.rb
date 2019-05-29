def sign_up
  visit ('/')
  fill_in 'user[name]', with: "Test"
  fill_in 'user[email]', with: "email@hotmail.com"
  fill_in 'user[password]', with: "password"
  click_button "Submit"
end

def sign_up_2
  fill_in 'user[name]', with: "Test2"
  fill_in 'user[email]', with: "email2@hotmail.com"
  fill_in 'user[password]', with: "password"
  click_button "Submit"
end

def login
  fill_in 'login[email]', with: "email@hotmail.com"
  fill_in 'login[password]', with: "password"
  click_button "Login"
end

def new_post
  fill_in 'post[message]', with: "Hello, world!"
  click_button "Submit"
end

def edit_post
  click_link "edit"
  fill_in 'post[message]', with: "Hello"
  click_button "Save changes"
end
