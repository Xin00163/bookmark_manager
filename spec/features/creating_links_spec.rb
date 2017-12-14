feature "create new links" do

  scenario "there is a button to add links" do
    sign_up
    visit('/links')
    find_button("Add link")
  end
  scenario "new links can be created and added to Bookmark Manager" do
    sign_up
    add_bookmark('Reddit', 'fun')
    expect(current_path).to eq '/links'
    within 'ul#links' do
      expect(page).to have_content 'Reddit'
    end
  end
end
