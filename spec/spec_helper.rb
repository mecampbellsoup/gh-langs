lib = File.expand_path('../lib', __FILE__)
$:.unshift(lib) unless $:.include?(lib)

require 'pry'
require 'github_langs'
require 'minitest/autorun'
require 'minitest/pride'
