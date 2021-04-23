require "databaseconnection"

describe DatabaseConnection do
  context ".setup" do
    it "should take a db name paramter" do
      expect(DatabaseConnection).to respond_to(:setup).with(1).argument
    end

    it "should set a connection to a given db" do
      testdb = "bookmark_manager_test"
      expect(DatabaseConnection.setup(testdb)).to be_a PG::Connection
    end
  end
end
