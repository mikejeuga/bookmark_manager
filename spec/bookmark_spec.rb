require "bookmark"
require_relative "./features/web_helper.rb"

describe Bookmark do
  describe "#initialize" do
    it "has a name" do
      b = Bookmark.new("Google", "http://www.google.com")
      expect(b.title).to eq "Google"
    end
  end

  describe "#all" do
    it "should return all the element of an array" do
      add_test_bookmarks
      expect(Bookmark.all[0].title).to eq("Makers")
    end
  end

  describe "#create" do
    it "should create a new bookmark into the bookmark manager" do
      title = "Github"
      url = "https://github.com/"
      expect { Bookmark.create(title, url) }.to change { Bookmark.all.length }.by 1
    end
  end
end
