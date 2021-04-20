feature "In order to add a bookmark" do
  scenario "to be able to see a form and create a new bookmark" do
    visit("/bookmarks")
    fill_in("title", with: "Github")
    fill_in("url", with: "https://github.com/")
    click_button("Create")
    expect(page).to have_content("Github - https://github.com/")
  end
end
