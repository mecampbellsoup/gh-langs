require 'open-uri'
require 'json'

module GithubLangs
  class Client
    BASE_URL = "https://api.github.com"

    def initialize(access_token)
      @token = access_token
    end

    def authenticate!
      begin
        default_user
      rescue OpenURI::HTTPError
        return false
      end
      true
    end

    def commits_for(repo, username = nil)
      user = username || default_user
      request_url = "#{BASE_URL}/repos/#{user}/#{repo}/commits"

      response = open(request_url).read
      JSON.parse(response).map { |commit| commit["sha"] }
    end
    alias_method :commits, :commits_for

    def repos_for(username = nil)
      user = username || default_user
      request_url = "#{BASE_URL}/users/#{user}/repos"

      response = open(request_url).read
      JSON.parse(response).map { |repo| repo["html_url"] }
    end
    alias_method :repos, :repos_for

    private

    def default_user
      @default_user ||=
        begin
          response = open("https://api.github.com/user", http_basic_authentication: [token, "x-oauth-basic"]).read
          JSON.parse(response)["login"]
        end
    end

    attr_reader :token
  end
end
