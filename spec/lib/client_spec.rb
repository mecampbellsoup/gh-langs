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
  end
end
