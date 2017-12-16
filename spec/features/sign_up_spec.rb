feature 'has a functioning login page' do
  scenario 'has a sign up form with fields for email and password' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_current_path('/links')
    expect(page).to have_content "Welcome, yan@example.com"
    expect(User.first.email).to eq ('yan@example.com')
  end

  scenario 'does not create new user if password is mismatched' do
    sign_up_badly
    expect { sign_up_badly }.to change(User, :count).by(0)
    expect(page).to have_current_path('/users/new')
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario 'user cannot sign up without entering an email' do
    expect { sign_up_without_email }.to change(User, :count).by(0)
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'user cannot sign up without entering an email' do
    expect { sign_up_with_invalid_email }.to change(User, :count).by(0)
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'user cannot sign up with already registerred email address' do
    sign_up
    expect { sign_up }.to change(User, :count).by(0)
    expect(page).to have_content "Email is already taken"
  end
end
