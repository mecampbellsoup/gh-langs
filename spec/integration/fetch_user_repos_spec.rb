require 'spec_helper'

describe "#repositories" do
  let(:token)  { ENV['GH_ACCESS_TOKEN'] }
  let(:client) { GithubLangs::Client.new(token) }

  it "returns a list of repositories for a given github user" do
    user = client.user "mecampbellsoup"
    expect(user.repositories).to include(["btc_price"]) 
  end
end
