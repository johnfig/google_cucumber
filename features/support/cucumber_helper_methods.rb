module CucumberHelperMethods

def find_xpath(xpath)
  begin
    field = find(:xpath, xpath)
  rescue Capybara::ElementNotFound
    # In Capybara 0.4+ #find_field raises an error instead of returning nil
    field = nil
  end
end

end
