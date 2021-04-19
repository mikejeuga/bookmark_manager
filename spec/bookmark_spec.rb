require "bookmark"

describe Bookmark do
  describe "#initialize" do
    it "has a name" do
      b = Bookmark.new("Google")
      expect(b.name).to eq "Google"
    end
  end

  describe "#all" do
    it "should return all the element of an array" do
      expect(Bookmark.all).to include("http://www.makersacademy.com", "http://askjeeves.com", "http://www.google.com")
    end
  end
end
