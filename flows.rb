require "rubygems"
require "pages"

module SearchTestHelper
  
  attr_accessor :id_test_case, :browser, :aplication, :text_to_search, :expected_result 
  def classic_search(id_test_case,browser, aplication,text_to_search, expected_result)
    
    home = Search::HomePage.new(browser, aplication)
    home.visit
    home.input_search(text_to_search)
    home.run_search
    sleep 2
    
    #home.should_activate_search_button
    result = Search::ResultPage.new(home.browser)
    assert result.should_have_text_present(expected_result)
    #(Watir::ScreenCapture.new).screen_capture(chroid_test_case+"_"+browser+"_"+aplication.name, active_window_only=false, save_as_bmp=false)
    (home.browser).close
  
  end
end

