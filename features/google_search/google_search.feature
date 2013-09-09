@javascript
@selenium

Feature: Google Advanced Search Page

Background: User is on google advanced search page
  Given I am on the advanced search page
  And I maximize the browser

# -----------------
# Test 2nd link URL
# -----------------

Scenario: Test Afrikaans language google dropdown
	When I fill in all these words with "hello world"
	When I click "any language" dropdown
	And I wait "2" seconds
 	When I click "Afrikaans" google button
 	And I press "Advanced Search"
 	And I wait "2" seconds
 	And I click on the second link
 	And I wait "2" seconds
 	Then I should see "http://www.correctmytext.com/text/341/page1" page

Scenario: Test Arabic language google dropdown
	When I fill in this exact word or phrase with "History of san francisco"
	When I click "any language" dropdown
	And I wait "2" seconds
 	When I click "Arabic" google button
 	And I press "Advanced Search"
 	And I click on the second link
 	And I wait "2" seconds
 	Then I should see "http://www.tripadvisor.com.eg/Resources-g60713-Maps-San_Francisco_California.html" page

Scenario: Test the “all these words” textbox
	When I fill in all these words with "What does the fox say"
 	And I press "Advanced Search"
 	And I click on the second link
 	And I wait "2" seconds
 	Then I should see "http://www.youtube.com/watch?v=jofNR_WkoCE" page

Scenario: Test the “this exact word or phrase” textbox
	When I fill in all these words with "Owls"
 	And I press "Advanced Search"
 	And I click on the second link
 	And I wait "2" seconds
 	Then I should see "http://www.owlpages.com/sounds.php" page

Scenario: Test the second link with last update filter for past 24 hours
	When I fill in all these words with "Facebook"
	When I click "anytime" dropdown
	And I wait "2" seconds
 	When I click "past 24 hours" google button
 	And I press "Advanced Search"
 	When I click Search tools
 	And I click on the second link
 	And I wait "2" seconds
 	Then I should see "http://www.google.com/search?as_q=Facebook&as_epq=&as_oq=&as_eq=&as_nlo=&as_nhi=&lr=&cr=&as_qdr=d&as_sitesearch=&as_occt=any&safe=images&tbs=&as_filetype=&as_rights=" page

Scenario: Test the second link with last update filter for past week
	When I fill in this exact word or phrase with "Google"
	When I click "anytime" dropdown
	And I wait "2" seconds
 	When I click "past week" google button
 	And I press "Advanced Search"
 	When I click Search tools
 	And I click on the second link
 	And I wait "2" seconds
 	Then I should see "http://www.washingtonpost.com/business/technology/google-encrypts-data-amid-backlash-against-nsa-spying/2013/09/06/9acc3c20-1722-11e3-a2ec-b47e45e6f8ef_story.html" page

# -----------------
# Test result count
# -----------------

Scenario: Test Afrikaans language google dropdown
	When I fill in all these words with "hello world"
	When I click "any language" dropdown
	And I wait "2" seconds
 	When I click "Afrikaans" google button
 	Then I should see "Afrikaans" text
 	And I press "Advanced Search"
 	And I wait "2" seconds
 	When I click Search tools
 	Then I should see "About 39,600 results" result count

Scenario: Test Arabic language google dropdown
	When I fill in this exact word or phrase with "History of san francisco"
	When I click "any language" dropdown
	And I wait "2" seconds
 	When I click "Arabic" google button
 	Then I should see "Arabic" text
 	And I press "Advanced Search"
 	When I click Search tools
 	Then I should see "About 5,590 results" result count

Scenario: Test the “all these words” textbox
	When I fill in all these words with "What does the fox say"
 	And I press "Advanced Search"
 	Then I should see "About 552,000,000 results" result count

Scenario: Test the “this exact word or phrase” textbox
	When I fill in all these words with "Owls"
 	And I press "Advanced Search"
 	Then I should see "24,000,000" text
 	Then I should see "About 24,000,000 results" result count

Scenario: Test the results count with last update filter for past 24 hours
	When I fill in all these words with "Facebook"
	When I click "anytime" dropdown
	And I wait "2" seconds
 	When I click "past 24 hours" google button
 	Then I should see "past 24 hours" text
 	And I press "Advanced Search"
 	When I click Search tools
 	Then I should see "About 243,000,000 results" result count

Scenario: Test the results count with last update filter for past week
	When I fill in this exact word or phrase with "Google"
	When I click "anytime" dropdown
	And I wait "2" seconds
 	When I click "past week" google button
 	Then I should see "past week" text
 	And I press "Advanced Search"
 	When I click Search tools
 	Then I should see "About 1,730,000,000 results" result count
