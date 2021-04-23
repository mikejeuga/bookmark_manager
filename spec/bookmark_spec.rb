require "bookmark"
require_relative "./features/web_helper.rb"

describe Bookmark do
  let(:last) { double :bookmarks, id: 16, title: "Last", url: "www.last.com" }

  context "#initialize" do
    it "has a name" do
      b = Bookmark.new(id: 54, title: "Google", url: "http://www.google.com")
      expect(b.title).to eq "Google"
    end
  end

  context "#all" do
    it "should return all the element of an array" do
      add_test_bookmarks
      expect(Bookmark.all[0].title).to eq("Makers")
    end
  end

  context "#create" do
    it "should create a new bookmark into the bookmark manager" do
      title = "Github"
      url = "https://github.com/"
      expect { Bookmark.create(title: title, url: url) }.to change { Bookmark.all.length }.by 1
    end
  end

  context "#delete" do
    it "should delete the bookmark chosen" do
      Bookmark.create(title: last.title, url: last.url)
      Bookmark.delete(id: last.id)
      expect(Bookmark.all).not_to include(last)
    end
  end
end
