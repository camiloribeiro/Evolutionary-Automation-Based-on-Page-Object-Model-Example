require "rubygems"
require "flows"
require 'ostruct'
require 'test/unit'

class SearchTestCase < Test::Unit::TestCase
  include SearchTestHelper
  def setup
    @google = OpenStruct.new({:name => "google",:url => "http://www.google.com.br",:search_field => "q",:search_button => "lsb", :luck_button => "btnI"})
    @yahoo = OpenStruct.new({:name => "yahoo",:url => "http://www.yahoo.com.br",:search_field => "p",:search_button => "searchsubmit med-large y-fp-pg-grad", :luck_button => ""})
    @bing = OpenStruct.new({:name => "bing",:url => "http://www.bing.com.br",:search_field => "q",:search_button => "sw_qbtn", :luck_button => ""})
    @applications = [@google, @yahoo, @bing] 
  end

  def test_classic_searchs
    ["firefox", "opera", "safari","chrome","ie"].each do |browser|
      @applications.each do |application| 
        configuration = {:browser=>browser, :application=>application} 
        classic_search(configuration,"Automação Rocks", "The Bug Bang Theory 2.0")
      end
    end
  end
end
