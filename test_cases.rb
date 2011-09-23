require "rubygems"
require "flows.rb"
require 'test/unit'

class SearchTestCase < Test::Unit::TestCase
  include SearchTestHelper
  def test_classic_searchs
    ["firefox", "opera", "safari","chrome"].each do |browser|
      [Yahoo.new, Bing.new,Google.new].each do |search_aplication| 
        classic_search("1",browser,search_aplication,"Automação Rocks", "The Bug Bang Theory 2.0")
        classic_search("2",browser,search_aplication,"Fábio Rehm", "Salvador")
      end
    end
  end
end

class SearchAplication
  attr_reader :name, :url, :search_field, :search_button, :luck_button 
end

class Google < SearchAplication
  def initialize 
    @name = "google"
    @url = "http://www.google.com.br"
    @search_field = "q"
    @search_button = "lsb"
    @luck_button = "btnI"
  end 
end

class Yahoo < SearchAplication 
  def initialize
    @name = "yahoo"
    @url = "http://www.yahoo.com.br"
    @search_field = "p"
    @search_button = "searchsubmit med-large y-fp-pg-grad"
    @luck_button = ""
  end 
end

class Bing < SearchAplication
  def initialize
    @name = "bing"
    @url = "http://www.bing.com"
    @search_field = "q"
    @search_button = "sw_qbtn"
    @luck_button = ""
  end 
end
