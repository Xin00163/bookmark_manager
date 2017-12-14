feature 'Tagging' do

  scenario 'links can be filtered by tag' do
    sign_up
    add_bookmark('Google', 'bubbles')
    add_bookmark('Reddit', 'fun')
    visit '/tag/bubbles'
    expect(page).to_not have_content 'Reddit'
  end
end
