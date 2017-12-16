require './app/models/user'

describe User do
  let!(:user) do
    User.create(email: "user@email.com",
                password: "12345",
                password_confirmation: "12345")
  end

  it 'authenticate the email and password of a user' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end
end
