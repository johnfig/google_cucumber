@javascript
@selenium

Feature: Google Advanced Search Page

Background: User is on google advanced search page
  Given I am on the advanced search page
  # And I maximize the browser

Scenario: Test Afrikaans language google dropdown
	When I fill in all these words with "Github"
	When I click "any language" dropdown
 	When I click "Afrikaans" google button
 	Then I should see "Afrikaans" text
 	And I press "Advanced Search"
 	When I click Search tools
 	Then I should see "272,000" text
 	Then I should see "https://www.google.com/search?as_q=Github&as_epq=&as_oq=&as_eq=&as_nlo=&as_nhi=&lr=lang_af&cr=&as_qdr=all&as_sitesearch=&as_occt=any&safe=images&tbs=&as_filetype=&as_rights=" page

Scenario: Test Arabic language google dropdown
	When I fill in this exact word or phrase with "Facebook"
	When I click "any language" dropdown
 	When I click "Arabic" google button
 	Then I should see "Arabic" text
 	And I press "Advanced Search"
 	When I click Search tools
 	Then I should see "1,150,000,000" text
 	Then I should see "https://www.google.com/search?as_q=&as_epq=Facebook&as_oq=&as_eq=&as_nlo=&as_nhi=&lr=lang_ar&cr=&as_qdr=all&as_sitesearch=&as_occt=any&safe=images&tbs=&as_filetype=&as_rights=" page