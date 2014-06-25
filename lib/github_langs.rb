require 'github_langs/client'
require 'yaml'

module GithubLangs
  dir = File.dirname(__FILE__)
  file = File.expand_path("../config/github.yml", dir)
  ENV['GH_ACCESS_TOKEN'] = YAML.load(File.read(file)).fetch(:GH_ACCESS_TOKEN)
end
