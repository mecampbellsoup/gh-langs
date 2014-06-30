require 'spec_helper'

describe "#repos_for" do
  let(:token)  { ENV['GH_ACCESS_TOKEN'] }
  let(:client) { GithubLangs::Client.new(token) }

  it "returns a list of repositories for a given github user" do
    repos = client.repos_for "mecampbellsoup"
    repos.must_include("https://github.com/mecampbellsoup/btc_price") 
  end
end
