require 'open-uri'

module GithubLangs
  class Client
    def initialize(access_token)
      @token = access_token
    end

    def authenticate!
      begin
        open("https://api.github.com/user", http_basic_authentication: [token, "x-oauth-basic"])
      rescue OpenURI::HTTPError
        return false
      end
      true
    end

    private

    attr_reader :token
  end
end
