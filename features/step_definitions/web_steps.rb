require 'cucumber/websteps'

After('@leave_the_window_open') do |scenario|
  if scenario.respond_to?(:status) && scenario.status == :failed
    print "Step Failed. Press return to close browser"
    STDIN.getc
  end
end

Given /^PENDING/ do
  pending
end

#Action on page
And /^I maximize the browser$/ do
  page.driver.browser.manage.window.maximize
end

Then /^I wait "(.*?)" seconds$/ do |seconds|
  sleep seconds.to_i
end

Then /^show the page/ do
  save_and_open_page
end

Then /^render the page/ do
  screenshot_and_open_image
end

When 'I wait for the page to load' do
  wait_until { page.evaluate_script('$.active') == 0 } if Capybara.current_driver == :webkit
  page.has_content? ''
end

# ACTIONS
And /^I select "(.*?)" from "(.*?)" dropdown$/ do |value, id|
  select(value, :from => id) 
end

When /^I press "([^\"]*)" within "([^\"]*)"$/ do |button, scope_selector|
  within(scope_selector) do      
    click_link_or_button(button)
  end
end

And /^I click "([^"]*)" input$/ do |id|
   find(:xpath, "//input[@id='#{id}']").click
end

# <button> with button value or
# <a> with link text
And /^I click "([^"]*)" button$/ do |value_or_text|
   click_on(value_or_text)
end

And /^I click "([^"]*)" link$/ do |text|
  find(:xpath, "//a[text() = '#{text}']").click
end

And /^I click "([^"]*)" button-id$/ do |id|
   click_button(id)
end

And /^I click the "([^"]*)" of "([^"]*)" buttons$/ do |number, value_or_text|
   all(:xpath, "//button[text() = '#{value_or_text}']")[number.to_i - 1].click
   # puts elements.size
end

And /^I click the "([^"]*)" of "([^"]*)" links$/ do |number, value_or_text|
   all(:xpath, "//a[text() = '#{value_or_text}']")[number.to_i - 1].click
   # puts elements.size
end

And /^I click OK button of alert dialog$/ do 
  page.driver.browser.switch_to.alert.accept
end
# FILL IN VALUE FOR ELEMENTS
# <input>
Then /^I fill in input-name "(.*?)" with "(.*?)"$/ do |name, value|
  find_xpath("//input[@name='#{name}']").set value
end

Then /^I fill in input-id "(.*?)" with "(.*?)"$/ do |id, value|
  find_xpath("//input[@id='#{id}']").set value
end

# ASSERTION
Then /^I should see "(.*?)" text$/ do |text|
  page.should have_content(text)
end

Then /^I should see (input|button) with id "(.*?)"$/ do |tag, id| 
  page.has_xpath?("//#{tag}[@id='#{id}']").should be_true
end

Then /^I should (not |)see "(.*?)" button$/ do |check, value|
  page.has_xpath?("//button[contains(text(),'#{value}')]").should (check == "" ? be_true : be_false) 
end

Then /^I should see "(.*?)" in "(.*?)" input$/ do |value, id|
  find("#{id}").value.should == value
end

Then /^I should see "(.*?)" is read\-only$/ do |id|
  element = find("##{id}")
  element["readonly"].should be_present
end

Then /^"(.*)" should( not | )be visible$/ do |id, check|
  page.should have_selector("##{id}", visible: check.blank?)
end

Then /^I should see (checked|unchecked|) "(.*?)" checkbox$/ do |check, id|
  checkbox = find("##{id}")
  if check == "checked"
    checkbox.should be_checked
  else
    checkbox.should_not be_checked
  end
end

Then /^I should see input-name "(.*?)" with "(.*?)"$/ do |name, value|
  find_xpath("./input[@name='#{name}']").value.should == value
end

# My Custom Methods
When /I click within "([^"]*)"$/ do |selector|
  find(selector).click
end

When /I click "([^"]*)" dropdown$/ do |selector|
  find('.goog-flat-menu-button-caption', :text => selector).click
end

When /I click "([^"]*)" google button$/ do |selector|
  find('.goog-menuitem-content', :text => selector).click
end

When /I fill in all these words with "([^"]*)"$/ do |selector|
  page.fill_in 'as_q', :with => selector
end

When /I fill in this exact word or phrase with "([^"]*)"$/ do |selector|
  page.fill_in 'as_epq', :with => selector
end

Then /^I should see "([^"]*)" page$/ do |url|
	current_url.should eq url 
end

When /^I click Search tools$/ do
  find("#hdtb_tls").click
end