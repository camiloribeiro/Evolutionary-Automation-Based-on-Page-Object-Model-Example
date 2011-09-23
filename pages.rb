require "rubygems"
require "watir-webdriver"

module Search
  class HomePage
    attr_accessor :browser, :aplication
	
    def initialize(browser, aplication)
      @url = aplication.url
      @search_field = aplication.search_field
      @search_button = aplication.search_button
      @luck_button = aplication.luck_button

      @browser = Watir::Browser.new browser
    end

    def visit
      @browser.goto @url
    end

    def input_search(value)
      @browser.text_field(:name => @search_field).set value
    end

    def run_search
      @browser.button(:class => @search_button).click
    end

    def search_value(text_to_search)
      input_search(text_to_search)
    end
  
    def im_feeling_luck(value)
      input_search(value)
    end
  end

  class ResultPage
    attr_accessor :browser

    def initialize(browser)
      @browser = browser
    end    

    def should_have_text_present(text_at_the_page)
      @browser.text.include? text_at_the_page
      #@browser.close 
    end
  end

  class LuckResultPage
    def should_have_title(title)    
      @browser.title == title
      @browser.close
    end
  end

end
