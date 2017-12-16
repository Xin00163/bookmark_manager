feature 'users can sign out' do
  before(:each) do
    User.create(email: "test@test.email",
                password: "test",
                password_confirmation: "test")
  end

  scenario "while signing in" do
    sign_in(email: "test@test.email", password: "test")
    click_button "Sign out"
    expect(page).not_to have_content "Welcome, test@test.email"
    expect(page).to have_content ("goodbye!")
  end
  end
