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
    bookmark = Bookmark.create(title: "JJ", url: "https://www.jj.com/")
    visit("/bookmarks")
    click_button("Delete")
    expect(page).to have_current_path("/bookmarks")
    expect(page).not_to have_content "#{bookmark.title}"
  end
end

feature "The Edit button" do
  scenario "should allow the user to update a bookmark" do
    bookmark = Bookmark.create(title: "JJ", url: "https://www.jj.com/")
    visit("/bookmarks")
    click_button("Edit")
    expect(page).to have_current_path("/bookmarks/#{bookmark.id}/edit")
    fill_in("title", with: "MM")
    fill_in("url", with: "www.mm.com")
    click_button("Update")
    expect(current_path).to eq("/bookmarks")
    expect(page).to have_content "www.mm.com"
  end
end
