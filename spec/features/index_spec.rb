feature "testing_index" do
  scenario "Homepage is loaded" do
    visit("/")
    expect(page).to have_content("Bookmark Manager")
  end
end
