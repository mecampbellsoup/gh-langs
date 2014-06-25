require 'spec_helper'

describe "#repositories" do
  let(:credentials) do
    {
      username: "mecampbellsoup",
      password: "mypassword"
    }
  end
  let(:client) { GithubLangs::Client.new(credentials) }

  it "returns a list of repositories for a given github user" do
    user = client.user "mecampbellsoup"
    expect(user.repositories).to include(["btc_price"]) 
  end
end
