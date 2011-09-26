require "rubygems"
require "watir-webdriver"

module Search

  class HomePage

    attr_reader :browser

    def initialize(configuration)
    
      application = configuration[:application]
      
      browser = configuration[:browser]
      
      @url = application.url
      @search_field = application.search_field
      @search_button = application.search_button
      @luck_button = application.luck_button

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
  
end

  class ResultPage
    attr_accessor :browser

    def initialize(browser)
      @browser = browser
    end    

    def should_have_text_present(text_at_the_page)
      @browser.text.include? text_at_the_page 
    end
  end
  
end
