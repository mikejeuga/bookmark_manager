feature "testing bookmarks page" do
  scenario "view button in home page links to bookmarks page" do
    visit "/"
    click_button("View Bookmarks")
    expect(page).to have_content("Here are your Bookmarks")
  end

  scenario "bookmarks page show all instances of Bookmark" do
    visit "/bookmarks"
    expect(page).to have_content("http://www.makersacademy.com")
    expect(page).to have_content("http://askjeeves.com")
    expect(page).to have_content("http://www.google.com")
  end
end
