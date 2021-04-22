require_relative "./web_helper.rb"

feature "testing bookmarks page" do
  scenario "view button in home page links to bookmarks page" do
    visit "/"
    click_button("View Bookmarks")
    expect(page).to have_content("Here are your Bookmarks")
  end

  scenario "bookmarks page show all instances of Bookmark" do
    add_test_bookmarks
    visit "/bookmarks"
    expect(page).to have_content("Makers - http://www.makersacademy.com")
    expect(page).to have_content("Askjeeves - http://askjeeves.com")
    expect(page).to have_content("Google - http://www.google.com")
    expect(page).to have_link("http://www.google.com")
  end
end

feature "deleting bookmarks" do
  scenario "should see a button to delete bookmarks" do
    visit("/bookmarks")
    fill_in("title", with: "Google")
    click_button("Delete")
    expect(page).not_to have_content("Google - http://www.google.com")
    expect(page).not_to have_link("http://www.google.com")
  end
end
