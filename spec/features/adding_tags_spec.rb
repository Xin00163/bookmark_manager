feature 'Adding tags' do

  scenario 'I can add a single tag to a new link' do
    sign_up
    add_bookmark('Makers Academy', 'education')
    link = Link.first
    expect(link.tags.map(&:name)).to include('education')
  end

  scenario 'I can add multiple tags to a new link' do
    sign_up
    add_bookmark('Makers Academy', 'education, growth, coding')
    link = Link.first
    # expect(page).to have_content '-education -growth -coding'
    expect(link.tags.map(&:name)).to include("education", "growth", "coding")
  end

end
