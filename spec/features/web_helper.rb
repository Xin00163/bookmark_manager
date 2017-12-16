def sign_up
  visit '/users/new'
  fill_in :email, with: 'yan@example.com'
  fill_in :password, with: 'password'
  fill_in :password_confirmation, with: 'password'
  click_button "Sign Up"
end

def sign_up_badly
  visit '/users/new'
  fill_in :email, with: 'xin@example.com'
  fill_in :password, with: 'password'
  fill_in :password_confirmation, with: 'notcorrect'
  click_button "Sign Up"
end

def sign_up_without_email
  visit '/users/new'
  fill_in :email, with: ''
  fill_in :password, with: 'password'
  fill_in :password_confirmation, with: 'password'
  click_button "Sign Up"
end

def sign_up_with_invalid_email
  visit '/users/new'
  fill_in :email, with: 'invalid@email'
  fill_in :password, with: 'password'
  fill_in :password_confirmation, with: 'password'
  click_button "Sign Up"
end

def sign_in(email:, password:)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end


def add_bookmark(name, tag)
  visit '/links/new'
  fill_in 'url',   with: 'http://www.makersacademy.com/'
  fill_in 'title', with: name
  fill_in 'tags',  with: tag
  click_button 'Create link'
end

def add_tag(tag)
  visit '/newtag'
  fill_in 'tag', with: tag
  fill_in 'title', with: 'Makers Academy'
  click_button 'Create tag'
end
