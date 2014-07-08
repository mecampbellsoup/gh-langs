require 'spec_helper'

module GithubLangs
  describe Client do
    let(:token)          { ENV['GH_ACCESS_TOKEN'] }
    let(:client)         { Client.new(token) }
    let(:invalid_client) { Client.new("foo") }

    describe "#authenticate!" do
      it "returns true when the client is properly authenticated" do
        client.authenticate!.must_equal true
      end

      it "returns false when the client is not properly authenticated" do
        invalid_client.authenticate!.must_equal false
      end
    end

    describe "#repos_for" do
      it "returns the repos belonging to the default user credentials" do
        client.repos.must_include("https://github.com/mecampbellsoup/btc_price")
      end

      it "returns the repos belonging to the passed-in username" do
        client.repos_for("rafaelsales").must_include("https://github.com/rafaelsales/vim")
      end
    end

    describe "#commits_for" do
      it "returns a list of commits for the given repository assuming default user as author" do
        client.commits_for("btc_price").must_include("7f3b09d8c7fc1ee444922424bdd48f5e00b07402")
      end

      it "takes an optional username argument to specify the commit's author" do
        client.commits("vim", "rafaelsales").must_include("a37852240a776d1acb616cd5c2d49e489ae3a16b")
      end
    end
  end
end
