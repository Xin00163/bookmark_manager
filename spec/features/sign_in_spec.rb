feature 'has a functioning login page' do
  scenario 'has a sign up form with fields for email and password' do
    sign_up
    expect(page).to have_current_path('/links')
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome, xin@example.com"
    expect(User.first.email).to eq ('xin@example.com')
  end

  scenario 'does not create new user if password is mismatched' do
    sign_up_badly
    expect { sign_up_badly }.to change(User, :count).by(0)
  end
end
