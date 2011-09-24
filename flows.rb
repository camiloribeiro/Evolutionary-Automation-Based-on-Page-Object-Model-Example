require "rubygems"
require "pages"

module SearchTestHelper
  
  def classic_search(configuration,text_to_search, expected_result)
    
    home = Search::HomePage.new(configuration)
    home.visit
    home.input_search(text_to_search)
    home.run_search
    sleep 2
    result = Search::ResultPage.new(home.browser)
    assert result.should_have_text_present(expected_result)
    (home.browser).close
  
  end
end

