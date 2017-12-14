feature 'has a functioning login page' do
  scenario 'has a sign up form with fields for email and password' do
    sign_up
    expect(page).to have_current_path('/links')
    expect(page).to have_content "Welcome, xin@example.com"
    expect(User.first.email).to eq ('xin@example.com')
  end
end
