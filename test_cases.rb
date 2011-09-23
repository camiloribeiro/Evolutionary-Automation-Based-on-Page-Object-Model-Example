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
  end

  def test_classic_searchs
    ["firefox", "opera", "safari","chrome","ie"].each do |browser|
      [@yahoo, @google,@bing].each do |search_aplication| 
        classic_search("1",browser,search_aplication,"Automação Rocks", "The Bug Bang Theory 2.0")
        classic_search("2",browser,search_aplication,"Fábio Rehm", "Salvador")
      end
    end
  end
end
